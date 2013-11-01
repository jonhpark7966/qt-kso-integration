# Qt util module

HEADERS += \
        $$PWD/qsystemtrayicon.h \
        $$PWD/qcompleter.h \
        $$PWD/qcompleter_p.h \
        $$PWD/qdesktopservices.h \
        $$PWD/qsystemtrayicon_p.h \
        $$PWD/qundogroup.h \
        $$PWD/qundostack.h \
        $$PWD/qundostack_p.h \
        $$PWD/qundoview.h

SOURCES += \
        $$PWD/qsystemtrayicon.cpp \
        $$PWD/qcompleter.cpp \
        $$PWD/qdesktopservices.cpp \
        $$PWD/qundogroup.cpp \
        $$PWD/qundostack.cpp \
        $$PWD/qundoview.cpp


wince* {
		SOURCES += \
				$$PWD/qsystemtrayicon_wince.cpp
} else:win32 {
		SOURCES += \
				$$PWD/qsystemtrayicon_win.cpp
}

unix:x11 {
		SOURCES += \
				$$PWD/qsystemtrayicon_x11.cpp
}

embedded {
		SOURCES += \
				$$PWD/qsystemtrayicon_qws.cpp
}

!embedded:!x11:mac {
		OBJECTIVE_SOURCES += $$PWD/qsystemtrayicon_mac.mm
}

symbian {
    LIBS += -letext -lplatformenv
    contains(S60_VERSION, 3.1)|contains(S60_VERSION, 3.2)|contains(S60_VERSION, 5.0) {
        LIBS += -lsendas2 -lapmime
        contains(QT_CONFIG, s60) {
            contains(CONFIG, is_using_gnupoc) {
                LIBS += -lcommonui
            } else {
                LIBS += -lCommonUI
            }
        }
    } else {
        DEFINES += USE_SCHEMEHANDLER
    }
}