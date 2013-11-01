# Qt inputmethod module

HEADERS +=$$PWD/qinputcontextfactory.h \
          $$PWD/qinputcontextplugin.h \
          $$PWD/qinputcontext_p.h \
          $$PWD/qinputcontext.h
SOURCES +=$$PWD/qinputcontextfactory.cpp \
          $$PWD/qinputcontextplugin.cpp \
          $$PWD/qinputcontext.cpp
x11 {
    HEADERS += $$PWD/qximinputcontext_p.h
    SOURCES += $$PWD/qximinputcontext_x11.cpp
}
win32 {
    HEADERS += $$PWD/qwininputcontext_p.h
    SOURCES += $$PWD/qwininputcontext_win.cpp
}
embedded {
    HEADERS += $$PWD/qwsinputcontext_p.h
    SOURCES += $$PWD/qwsinputcontext_qws.cpp
}
mac:!embedded {
    HEADERS += $$PWD/qmacinputcontext_p.h
    SOURCES += $$PWD/qmacinputcontext_mac.cpp
}
symbian:contains(QT_CONFIG, s60) {
    HEADERS += $$PWD/qcoefepinputcontext_p.h
    SOURCES += $$PWD/qcoefepinputcontext_s60.cpp
    LIBS += -lfepbase -lakninputlanguage
}

