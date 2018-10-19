#include <QtTest>
#include <QCoreApplication>

#include "singleapplication.hpp"

class SingleApplicationTest : public QObject
{
	Q_OBJECT

	public:
		SingleApplicationTest();

	protected:
		SingleApplication *guard;

	private slots:
		void testInstance();
};

SingleApplicationTest::SingleApplicationTest()
{
	guard = new SingleApplication(QCoreApplication::applicationName());
}

void SingleApplicationTest::testInstance()
{
	QVERIFY2(guard->createInstance(), "Could not create first instance");

	QVERIFY2(guard->createInstance() == false, "Must not create second instance");
}

QTEST_MAIN(SingleApplicationTest)
#include "tst_singleapplicationtest.moc"
