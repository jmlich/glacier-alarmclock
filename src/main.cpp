#include <QtGui/QGuiApplication>

#include <QtQml>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlContext>
#include <QtQuick/QQuickView>
#include <QtQuick/QQuickItem>
#include <QScreen>

#include <glacierapp.h>

#include <QtGui/QGuiApplication>
#include <QLoggingCategory>


int main(int argc, char *argv[])
{
    QGuiApplication *app = GlacierApp::app(argc, argv);
    app->setOrganizationName("NemoMobile");

    QScreen* sc = app->primaryScreen();
    if(sc){
        sc->setOrientationUpdateMask(Qt::LandscapeOrientation
                             | Qt::PortraitOrientation
                             | Qt::InvertedLandscapeOrientation
                             | Qt::InvertedPortraitOrientation);
    }

    QQuickWindow *window = GlacierApp::showWindow();
    window->setTitle(QObject::tr("Clock"));
    window->setIcon(QIcon("/usr/share/glacier-alarmclock/images/icon-app-clock.png"));


    return app->exec();


}
