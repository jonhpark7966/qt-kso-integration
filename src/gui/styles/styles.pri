# Qt styles module

HEADERS += \
	$$PWD/qstyle.h \
	$$PWD/qstylefactory.h \
	$$PWD/qstyleoption.h \
	$$PWD/qstyleplugin.h \
	$$PWD/qcommonstylepixmaps_p.h \
	$$PWD/qcommonstyle.h \
	$$PWD/qstylehelper_p.h \
	$$PWD/qproxystyle.h \
	$$PWD/qproxystyle_p.h \
	$$PWD/qstylesheetstyle_p.h

SOURCES += \
	$$PWD/qstyle.cpp \
	$$PWD/qstylefactory.cpp \
	$$PWD/qstyleoption.cpp \
	$$PWD/qstyleplugin.cpp \
	$$PWD/qstylehelper.cpp \
	$$PWD/qcommonstyle.cpp \
	$$PWD/qproxystyle.cpp \
        $$PWD/qstylesheetstyle.cpp \
        $$PWD/qstylesheetstyle_default.cpp

wince* {
    RESOURCES += $$PWD/qstyle_wince.qrc
} else:symbian {
    RESOURCES += $$PWD/qstyle_s60.qrc
} else {
    RESOURCES += $$PWD/qstyle.qrc
}

contains( styles, all ) {
	styles = mac windows windowsxp windowsvista
}

x11|embedded|!macx-*:styles -= mac

x11{
    QMAKE_CXXFLAGS += $$QT_CFLAGS_QGTKSTYLE
    LIBS_PRIVATE += $$QT_LIBS_QGTKSTYLE
    styles += gtk
}

contains( styles, mac ) {
	HEADERS += \
		$$PWD/qmacstyle_mac.h \
		$$PWD/qmacstylepixmaps_mac_p.h \
		$$PWD/qmacstyle_mac_p.h
        OBJECTIVE_SOURCES += $$PWD/qmacstyle_mac.mm

	!contains( styles, windows ) {
		message( mac requires windows )
		styles += windows
		DEFINES+= QT_STYLE_WINDOWS
	}
} else {
	DEFINES += QT_NO_STYLE_MAC
}

contains( styles, cde ) {
	HEADERS += $$PWD/qcdestyle.h
	SOURCES += $$PWD/qcdestyle.cpp

	!contains( styles, motif ) {
		message( cde requires motif )
		styles += motif
		DEFINES+= QT_STYLE_MOTIF
	}
} else {
	DEFINES += QT_NO_STYLE_CDE
}

contains( styles, windowsvista ) {
	HEADERS += $$PWD/qwindowsvistastyle.h
	HEADERS += $$PWD/qwindowsvistastyle_p.h
	SOURCES += $$PWD/qwindowsvistastyle.cpp
	!contains( styles, windowsxp ) {
		message( windowsvista requires windowsxp )
		styles += windowsxp
		DEFINES+= QT_STYLE_WINDOWSXP
	}
} else {
	DEFINES += QT_NO_STYLE_WINDOWSVISTA
}

contains( styles, windowsxp ) {
	HEADERS += $$PWD/qwindowsxpstyle.h
	SOURCES += $$PWD/qwindowsxpstyle.cpp
	!contains( styles, windows ) {
		message( windowsxp requires windows )
		styles += windows
		DEFINES+= QT_STYLE_WINDOWS
	}
} else {
	DEFINES += QT_NO_STYLE_WINDOWSXP
}

contains( styles, plastique ) {
	HEADERS += $$PWD/qplastiquestyle.h
	SOURCES += $$PWD/qplastiquestyle.cpp
	!contains( styles, windows ) {
		message( plastique requires windows )
		styles += windows
		DEFINES+= QT_STYLE_WINDOWS
	}
} else {
	DEFINES += QT_NO_STYLE_PLASTIQUE
}

contains( styles, gtk ) {
        HEADERS += $$PWD/qgtkstyle.h
        HEADERS += $$PWD/qgtkpainter_p.h
        HEADERS += $$PWD/qgtkstyle_p.h
        SOURCES += $$PWD/qgtkstyle.cpp
        SOURCES += $$PWD/qgtkpainter.cpp
        SOURCES += $$PWD/qgtkstyle_p.cpp
	!contains( styles, cleanlooks ) {
		styles += cleanlooks
		DEFINES+= QT_STYLE_CLEANLOOKS
	}
} else {
	DEFINES += QT_NO_STYLE_GTK
}

contains( styles, cleanlooks ) {
        HEADERS += $$PWD/qcleanlooksstyle.h
        HEADERS += $$PWD/qcleanlooksstyle_p.h
        SOURCES += $$PWD/qcleanlooksstyle.cpp
	!contains( styles, windows ) {
		styles += windows
		DEFINES+= QT_STYLE_WINDOWS
	}
} else {
	DEFINES += QT_NO_STYLE_CLEANLOOKS
}

contains( styles, windows ) {
	HEADERS += $$PWD/qwindowsstyle.h
	SOURCES += $$PWD/qwindowsstyle.cpp
} else {
	DEFINES += QT_NO_STYLE_WINDOWS
}

contains( styles, motif ) {
	HEADERS += $$PWD/qmotifstyle.h
	SOURCES += $$PWD/qmotifstyle.cpp
} else {
	DEFINES += QT_NO_STYLE_MOTIF
}

contains( styles, windowsce ) {
	HEADERS += $$PWD/qwindowscestyle.h
	SOURCES += $$PWD/qwindowscestyle.cpp
} else {
	DEFINES += QT_NO_STYLE_WINDOWSCE
}

contains( styles, windowsmobile ) {
	HEADERS += $$PWD/qwindowsmobilestyle.h
	SOURCES += $$PWD/qwindowsmobilestyle.cpp
} else {
	DEFINES += QT_NO_STYLE_WINDOWSMOBILE
}

contains( styles, s60 ):contains(QT_CONFIG, s60) {
    HEADERS += \
        $$PWD/qs60style.h \
        $$PWD/qs60style_p.h
    SOURCES += $$PWD/qs60style.cpp
    symbian {
        SOURCES += $$PWD/qs60style_s60.cpp
        LIBS += -legul -lbmpanim
        contains(CONFIG, is_using_gnupoc) {
            LIBS += -laknicon -laknskins -laknskinsrv -lfontutils
        } else {
            LIBS += -lAknIcon -lAKNSKINS -lAKNSKINSRV -lFontUtils
        }
    } else {
        SOURCES += $$PWD/qs60style_simulated.cpp
        RESOURCES += $$PWD/qstyle_s60_simulated.qrc
    }
} else {
    symbian {
        HEADERS += $$PWD/qs60style.h
        SOURCES += $$PWD/qs60style_stub.cpp
    }
    DEFINES += QT_NO_STYLE_S60
}
