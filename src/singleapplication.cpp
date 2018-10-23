#include "singleapplication.hpp"

namespace {
	QString generateKeyHash(const QString &key, const QString &salt) {
		QByteArray data;

		data.append(key.toUtf8());
		data.append(salt.toUtf8());

		data = QCryptographicHash::hash(data, QCryptographicHash::Keccak_512).toHex();

		return data;
	}
}

SingleApplication::SingleApplication(const QString &key) :
	key(key),
	memLockKey(generateKeyHash(key, QStringLiteral("_memLockKey"))),
	sharedMemKey(generateKeyHash(key, QStringLiteral("_sharedMemKey"))),
	sharedMem(sharedMemKey),
	memLock(memLockKey, 1) {
	memLock.acquire();
	{
		QSharedMemory fix(sharedMemKey);
		fix.attach();
	}
	memLock.release();
}

SingleApplication::~SingleApplication() {
	release();
}

bool SingleApplication::isRunning() {
	if (sharedMem.isAttached()) {
		return false;
	}

	memLock.acquire();
	const bool running = sharedMem.attach();

	if (running) {
		sharedMem.detach();
	}

	memLock.release();

	return running;
}

bool SingleApplication::createInstance() {
	if (isRunning()) {
		return false;
	}

	memLock.acquire();
	const bool result = sharedMem.create(sizeof(quint64));
	memLock.release();

	if (!result) {
		release();
		return false;
	}

	return true;
}

void SingleApplication::release() {
	memLock.acquire();

	if (sharedMem.isAttached()) {
		sharedMem.detach();
	}

	memLock.release();
}
