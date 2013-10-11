# Qt kernel module

# Only used on platforms with CONFIG += precompile_header
#PRECOMPILED_HEADER = $$PWD/qt_gui_pch.h


KERNEL_P= kernel
HEADERS += \
	$$PWD/qaction.h \
    $$PWD/qaction_p.h \
	$$PWD/qactiongroup.h \
	$$PWD/qapplication.h \
	$$PWD/qapplication_p.h \
	$$PWD/qboxlayout.h \
	$$PWD/qclipboard.h \
	$$PWD/qcursor.h \
	$$PWD/qdesktopwidget.h \
	$$PWD/qdrag.h \
	$$PWD/qdnd_p.h \
	$$PWD/qevent.h \
	$$PWD/qevent_p.h \
	$$PWD/qformlayout.h \
	$$PWD/qgridlayout.h \
	$$PWD/qkeysequence.h \
	$$PWD/qlayout.h \
	$$PWD/qlayout_p.h \
	$$PWD/qlayoutengine_p.h \
	$$PWD/qlayoutitem.h \
	$$PWD/qmime.h \
	$$PWD/qsessionmanager.h \
	$$PWD/qshortcut.h \
	$$PWD/qshortcutmap_p.h \
	$$PWD/qsizepolicy.h \
	$$PWD/qpalette.h \
	$$PWD/qsound.h \
	$$PWD/qsound_p.h \
	$$PWD/qstackedlayout.h \
	$$PWD/qtooltip.h \
	$$PWD/qwhatsthis.h \
    $$PWD/qwidget.h \
    $$PWD/qwidget_p.h \
	$$PWD/qwidgetaction.h \
	$$PWD/qwidgetaction_p.h \
	$$PWD/qwindowdefs.h \
	$$PWD/qkeymapper_p.h \
	$$PWD/qgesture.h \
	$$PWD/qgesture_p.h \
	$$PWD/qstandardgestures_p.h \
	$$PWD/qgesturerecognizer.h \
	$$PWD/qgesturemanager_p.h \
	$$PWD/qsoftkeymanager_p.h \
    $$PWD/qsoftkeymanager_common_p.h \
	$$PWD/qguiplatformplugin_p.h

SOURCES += \
	$$PWD/qaction.cpp \
	$$PWD/qactiongroup.cpp \
	$$PWD/qapplication.cpp \
	$$PWD/qboxlayout.cpp \
	$$PWD/qclipboard.cpp \
	$$PWD/qcursor.cpp \
	$$PWD/qdrag.cpp \
	$$PWD/qdnd.cpp \
	$$PWD/qevent.cpp \
	$$PWD/qformlayout.cpp \
	$$PWD/qgridlayout.cpp \
	$$PWD/qkeysequence.cpp \
	$$PWD/qlayout.cpp \
	$$PWD/qlayoutengine.cpp \
	$$PWD/qlayoutitem.cpp \
	$$PWD/qmime.cpp \
	$$PWD/qpalette.cpp \
	$$PWD/qshortcut.cpp \
	$$PWD/qshortcutmap.cpp \
	$$PWD/qsound.cpp \
	$$PWD/qstackedlayout.cpp \
	$$PWD/qtooltip.cpp \
	$$PWD/qguivariant.cpp \
	$$PWD/qwhatsthis.cpp \
	$$PWD/qwidget.cpp \
	$$PWD/qwidgetaction.cpp \
	$$PWD/qkeymapper.cpp \
	$$PWD/qgesture.cpp \
	$$PWD/qstandardgestures.cpp \
	$$PWD/qgesturerecognizer.cpp \
	$$PWD/qgesturemanager.cpp \
	$$PWD/qsoftkeymanager.cpp \
    $$PWD/qdesktopwidget.cpp \
	$$PWD/qguiplatformplugin.cpp

win32 {
	DEFINES += QT_NO_DIRECTDRAW

    HEADERS += \
        $$PWD/qwinnativepangesturerecognizer_win_p.h

	SOURCES += \
		$$PWD/qapplication_win.cpp \
		$$PWD/qclipboard_win.cpp \
		$$PWD/qcursor_win.cpp \
		$$PWD/qdesktopwidget_win.cpp \
		$$PWD/qdnd_win.cpp \
		$$PWD/qmime_win.cpp \
		$$PWD/qsound_win.cpp \
		$$PWD/qwidget_win.cpp \
		$$PWD/qole_win.cpp \
        $$PWD/qkeymapper_win.cpp \
        $$PWD/qwinnativepangesturerecognizer_win.cpp

    !contains(DEFINES, QT_NO_DIRECTDRAW):LIBS += ddraw.lib
}

symbian {
    exists($${EPOCROOT}epoc32/include/platform/mw/akntranseffect.h): DEFINES += QT_SYMBIAN_HAVE_AKNTRANSEFFECT_H

    SOURCES += \
        $$PWD/qapplication_s60.cpp \
        $$PWD/qeventdispatcher_s60.cpp \
        $$PWD/qwidget_s60.cpp \
        $$PWD/qcursor_s60.cpp \
        $$PWD/qdesktopwidget_s60.cpp \
        $$PWD/qkeymapper_s60.cpp\
        $$PWD/qclipboard_s60.cpp\
        $$PWD/qdnd_s60.cpp \
        $$PWD/qsound_s60.cpp

    HEADERS += \
        $$PWD/qt_s60_p.h \
        $$PWD/qeventdispatcher_s60_p.h

    LIBS += -lbafl -lestor

    INCLUDEPATH += $$MW_LAYER_SYSTEMINCLUDE
    INCLUDEPATH += ../3rdparty/s60

    contains(QT_CONFIG, s60) {
        SOURCES += $$PWD/qsoftkeymanager_s60.cpp
        HEADERS += $$PWD/qsoftkeymanager_s60_p.h
    }
}


unix:x11 {
	INCLUDEPATH += ../3rdparty/xorg
	HEADERS += \
		$$PWD/qx11embed_x11.h \
		$$PWD/qx11info_x11.h \
        $$PWD/qkde_p.h

	SOURCES += \
		$$PWD/qapplication_x11.cpp \
		$$PWD/qclipboard_x11.cpp \
		$$PWD/qcursor_x11.cpp \
		$$PWD/qdnd_x11.cpp \
		$$PWD/qdesktopwidget_x11.cpp \
		$$PWD/qmotifdnd_x11.cpp \
		$$PWD/qsound_x11.cpp \
		$$PWD/qwidget_x11.cpp \
		$$PWD/qwidgetcreate_x11.cpp \
		$$PWD/qx11embed_x11.cpp \
		$$PWD/qx11info_x11.cpp \
		$$PWD/qkeymapper_x11.cpp \
		$$PWD/qkde.cpp

        contains(QT_CONFIG, glib) {
            SOURCES += \
		$$PWD/qguieventdispatcher_glib.cpp
            HEADERS += \
                $$PWD/qguieventdispatcher_glib_p.h
            QMAKE_CXXFLAGS += $$QT_CFLAGS_GLIB
	    LIBS_PRIVATE +=$$QT_LIBS_GLIB
	}
            SOURCES += \
		$$PWD/qeventdispatcher_x11.cpp
            HEADERS += \
                $$PWD/qeventdispatcher_x11_p.h
}

embedded {
	HEADERS += \
		$$PWD/qeventdispatcher_qws_p.h

	SOURCES += \
		$$PWD/qapplication_qws.cpp \
		$$PWD/qclipboard_qws.cpp \
		$$PWD/qcursor_qws.cpp \
		$$PWD/qdesktopwidget_qws.cpp \
		$$PWD/qdnd_qws.cpp \
		$$PWD/qeventdispatcher_qws.cpp \
		$$PWD/qsound_qws.cpp \
		$$PWD/qwidget_qws.cpp \
		$$PWD/qkeymapper_qws.cpp \
		$$PWD/qsessionmanager_qws.cpp

        contains(QT_CONFIG, glib) {
            SOURCES += \
		$$PWD/qeventdispatcher_glib_qws.cpp
            HEADERS += \
                $$PWD/qeventdispatcher_glib_qws_p.h
            QMAKE_CXXFLAGS += $$QT_CFLAGS_GLIB
            LIBS_PRIVATE +=$$QT_LIBS_GLIB
	}
}

!embedded:!x11:mac {
	SOURCES += \
		$$PWD/qclipboard_mac.cpp \
		$$PWD/qmime_mac.cpp \
		$$PWD/qt_mac.cpp \
		$$PWD/qkeymapper_mac.cpp

        OBJECTIVE_HEADERS += \
                qcocoawindow_mac_p.h \
                qcocoapanel_mac_p.h \
                qcocoawindowdelegate_mac_p.h \
                qcocoaview_mac_p.h \
                qcocoaapplication_mac_p.h \
                qcocoaapplicationdelegate_mac_p.h \
                qmacgesturerecognizer_mac_p.h \
                qmultitouch_mac_p.h \
                qcocoasharedwindowmethods_mac_p.h

        OBJECTIVE_SOURCES += \
                $$PWD/qcursor_mac.mm \
                $$PWD/qdnd_mac.mm \
                $$PWD/qsound_mac.mm  \
                $$PWD/qapplication_mac.mm \
		        $$PWD/qwidget_mac.mm \
		        $$PWD/qcocoapanel_mac.mm \
                $$PWD/qcocoaview_mac.mm \
                $$PWD/qcocoawindow_mac.mm \
                $$PWD/qcocoawindowdelegate_mac.mm \
                $$PWD/qcocoamenuloader_mac.mm \
                $$PWD/qcocoaapplication_mac.mm \
                $$PWD/qcocoaapplicationdelegate_mac.mm \
                $$PWD/qt_cocoa_helpers_mac.mm \
                $$PWD/qdesktopwidget_mac.mm \
                $$PWD/qeventdispatcher_mac.mm \
                $$PWD/qcocoawindowcustomthemeframe_mac.mm \
                $$PWD/qmacgesturerecognizer_mac.mm \
                $$PWD/qmultitouch_mac.mm

        HEADERS += \
                $$PWD/qt_cocoa_helpers_mac_p.h \
                $$PWD/qcocoaapplication_mac_p.h \
                $$PWD/qcocoaapplicationdelegate_mac_p.h \
                $$PWD/qeventdispatcher_mac_p.h

        MENU_NIB.files = mac/qt_menu.nib
        MENU_NIB.path = Resources
        MENU_NIB.version = Versions
        QMAKE_BUNDLE_DATA += MENU_NIB
        RESOURCES += mac/macresources.qrc

        LIBS_PRIVATE += -framework AppKit
}

wince*: {
        HEADERS += \
                ../corelib/kernel/qfunctions_wince.h \
                kernel/qguifunctions_wince.h

        SOURCES += \
                ../corelib/kernel/qfunctions_wince.cpp \
                kernel/qguifunctions_wince.cpp
}
