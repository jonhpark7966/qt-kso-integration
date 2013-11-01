symbian {
    contains(QT_CONFIG, s60): LIBS+= $$QMAKE_LIBS_S60
    RESOURCES += $$PWD/symbianresources.qrc

    HEADERS += $$PWD/symbian/qsymbianevent.h
    SOURCES += $$PWD/symbian/qsymbianevent.cpp
}
