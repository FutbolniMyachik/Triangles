#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>

#include "trianglemodel.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    TriangleModel model;
    model.addTriangle(QPointF{100, 100}, QPointF{200, 300}, QPointF{300, 400});
    engine.rootContext()->setContextProperty("triangleModel", &model);
    return app.exec();
}
