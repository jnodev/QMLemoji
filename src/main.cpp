#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QDebug>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    /*
    //use a font which supports Emoji
    QFontDatabase fontDB;
    fontDB.addApplicationFont(":/resources/fonts/OpenSansEmoji.ttf");
    app.setFont(QFont(QStringLiteral("OpenSansEmoji")));
    */

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
