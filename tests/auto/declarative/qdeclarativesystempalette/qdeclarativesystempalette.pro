load(qttest_p4)
contains(QT_CONFIG,declarative): QT += declarative core
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativesystempalette.cpp

!symbian: {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test

