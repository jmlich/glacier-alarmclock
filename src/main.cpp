#include <QtGui/QGuiApplication>

#include <QScreen>
#include <QtQml/QQmlContext>
#include <QtQml/QQmlEngine>
#include <QtQml>
#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickView>

#include <glacierapp.h>

#include <QLoggingCategory>
#include <QtGui/QGuiApplication>

int main(int argc, char* argv[])
{
    QGuiApplication* app = GlacierApp::app(argc, argv);
    app->setOrganizationName("NemoMobile");

    QScreen* sc = app->primaryScreen();
    if (sc) {
        sc->setOrientationUpdateMask(Qt::LandscapeOrientation
            | Qt::PortraitOrientation
            | Qt::InvertedLandscapeOrientation
            | Qt::InvertedPortraitOrientation);
    }

    QQuickWindow* window = GlacierApp::showWindow();
    window->setTitle(QObject::tr("Clock"));
    window->setIcon(QIcon("/usr/share/glacier-alarmclock/images/icon-app-clock.png"));

    return app->exec();
}
