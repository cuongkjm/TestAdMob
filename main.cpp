#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "QmlBanner.h"
#include "QmlInterstitialAd.h"
#include "QmlRewardedVideoAd.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    /* Admob */
    qmlRegisterType<QmlBanner>("QmlBanner", 1, 0, "QmlBanner");
    qmlRegisterType<QmlInterstitialAd>("QmlInterstitialAd", 1, 0, "QmlInterstitialAd");
    qmlRegisterType<QmlRewardedVideoAd>("QmlRewardedVideoAd", 1, 0, "QmlRewardedVideoAd");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
