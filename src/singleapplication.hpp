#ifndef SINGLEAPPLICATION_HPP
#define SINGLEAPPLICATION_HPP

#include <QtGlobal>
#include <QSharedMemory>
#include <QSystemSemaphore>
#include <QCryptographicHash>

#if defined(SINGLEAPPLICATION_LIBRARY)
#  define SINGLEAPPLICATIONSHARED_EXPORT Q_DECL_EXPORT
#else
#  define SINGLEAPPLICATIONSHARED_EXPORT Q_DECL_IMPORT
#endif

class SINGLEAPPLICATIONSHARED_EXPORT SingleApplication {
	public:
		explicit SingleApplication(const QString &key);
		~SingleApplication();

		bool isRunning();
		bool createInstance();
		void release();

	private:
		const QString key;
		const QString memLockKey;
		const QString sharedMemKey;

		QSharedMemory sharedMem;
		QSystemSemaphore memLock;

		Q_DISABLE_COPY(SingleApplication)
};

#endif // SINGLEAPPLICATION_HPP
