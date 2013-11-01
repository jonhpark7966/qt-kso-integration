# Qt for Embedded Linux

embedded {
	CONFIG -= opengl x11
	LIBS -= -dl
	KERNEL_P        = kernel

	!mac:HEADERS += $$PWD/qsoundqss_qws.h
	HEADERS += \
		    $$PWD/qcopchannel_qws.h \
		    $$PWD/qdecoration_qws.h \
		    $$PWD/qdecorationfactory_qws.h \
		    $$PWD/qdecorationplugin_qws.h \
		    $$PWD/qdirectpainter_qws.h \
		    $$PWD/qlock_p.h \
		    $$PWD/qscreen_qws.h \
		    $$PWD/qscreenmulti_qws_p.h \
		    $$PWD/qscreenproxy_qws.h \
		    $$PWD/qwindowsystem_qws.h \
		    $$PWD/qwindowsystem_p.h \
		    $$PWD/qwscommand_qws_p.h \
		    $$PWD/qwscursor_qws.h \
		    $$PWD/qwsdisplay_qws.h \
		    $$PWD/qwsdisplay_qws_p.h \
		    $$PWD/qwsevent_qws.h \
		    $$PWD/qwsmanager_qws.h \
		    $$PWD/qwsmanager_p.h \
		    $$PWD/qwsproperty_qws.h \
		    $$PWD/qwsprotocolitem_qws.h \
                    $$PWD/qtransportauth_qws.h \
                    $$PWD/qtransportauth_qws_p.h \
                    $$PWD/qtransportauthdefs_qws.h \
		    $$PWD/qwssocket_qws.h \
		    $$PWD/qwslock_p.h \
		    $$PWD/qwsutils_qws.h \
                    $$PWD/qwssharedmemory_p.h \
		    $$PWD/qwssignalhandler_p.h \
		    $$PWD/qwsembedwidget.h

	 !mac:SOURCES += $$PWD/qsoundqss_qws.cpp
         SOURCES +=  \
		    $$PWD/qcopchannel_qws.cpp \
		    $$PWD/qdecoration_qws.cpp \
		    $$PWD/qdecorationfactory_qws.cpp \
		    $$PWD/qdecorationplugin_qws.cpp \
		    $$PWD/qdirectpainter_qws.cpp \
		    $$PWD/qlock.cpp \
		    $$PWD/qscreen_qws.cpp \
		    $$PWD/qscreenmulti_qws.cpp \
		    $$PWD/qscreenproxy_qws.cpp \
		    $$PWD/qwindowsystem_qws.cpp \
		    $$PWD/qwscommand_qws.cpp \
		    $$PWD/qwscursor_qws.cpp \
		    $$PWD/qwsevent_qws.cpp \
		    $$PWD/qwsmanager_qws.cpp \
		    $$PWD/qwsproperty_qws.cpp \
                    $$PWD/qtransportauth_qws.cpp \
		    $$PWD/qwslock.cpp \
                    $$PWD/qwssharedmemory.cpp \
		    $$PWD/qwssocket_qws.cpp \
		    $$PWD/qwssignalhandler.cpp \
		    $$PWD/qwsembedwidget.cpp

        contains(QT_CONFIG,sxe)|contains(QT_CONFIG,qtopia) {
            SOURCES += $$PWD/qunixsocket.cpp $$PWD/qunixsocketserver.cpp
            HEADERS += $$PWD/qunixsocket_p.h $$PWD/qunixsocketserver_p.h
        }

#
# Decorations
#
    contains( decorations, default ) {
    	HEADERS += $$PWD/qdecorationdefault_qws.h
    	SOURCES += $$PWD/qdecorationdefault_qws.cpp
    }
    contains( decorations, styled ) {
    	HEADERS += $$PWD/qdecorationstyled_qws.h
    	SOURCES += $$PWD/qdecorationstyled_qws.cpp
    }

    contains( decorations, windows ) {
    	HEADERS += $$PWD/qdecorationwindows_qws.h
    	SOURCES += $$PWD/qdecorationwindows_qws.cpp
    }

#
# Qt for Embedded Linux Drivers
#
	HEADERS += $$PWD/qscreendriverplugin_qws.h \
		    $$PWD/qscreendriverfactory_qws.h \
		    $$PWD/qkbd_qws.h \
		    $$PWD/qkbd_qws_p.h \
		    $$PWD/qkbd_defaultmap_qws_p.h \
		    $$PWD/qkbddriverplugin_qws.h \
		    $$PWD/qkbddriverfactory_qws.h \
		    $$PWD/qmouse_qws.h \
		    $$PWD/qmousedriverplugin_qws.h \
		    $$PWD/qmousedriverfactory_qws.h

	SOURCES += $$PWD/qscreendriverplugin_qws.cpp \
		    $$PWD/qscreendriverfactory_qws.cpp \
		    $$PWD/qkbd_qws.cpp \
		    $$PWD/qkbddriverplugin_qws.cpp \
		    $$PWD/qkbddriverfactory_qws.cpp \
		    $$PWD/qmouse_qws.cpp \
		    $$PWD/qmousedriverplugin_qws.cpp \
		    $$PWD/qmousedriverfactory_qws.cpp

#
# Graphics drivers
#
        contains( gfx-drivers, linuxfb ) {
	        HEADERS += $$PWD/qscreenlinuxfb_qws.h
		SOURCES += $$PWD/qscreenlinuxfb_qws.cpp
	}

        contains( gfx-drivers, qnx ) {
                HEADERS += $$PWD/qscreenqnx_qws.h
                SOURCES += $$PWD/qscreenqnx_qws.cpp
                LIBS += -lgf
        }

	contains( gfx-drivers, qvfb ) {
		HEADERS += $$PWD/qscreenvfb_qws.h
		SOURCES += $$PWD/qscreenvfb_qws.cpp
	}


	contains( gfx-drivers, vnc ) {
		VNCDIR = $$QT_SOURCE_TREE/src/plugins/gfxdrivers/vnc
		INCLUDEPATH += $$VNCDIR
		HEADERS += $$VNCDIR/qscreenvnc_qws.h \
			   $$VNCDIR/qscreenvnc_p.h
		SOURCES += $$VNCDIR/qscreenvnc_qws.cpp
	}

	contains( gfx-drivers, transformed ) {
		HEADERS += $$PWD/qscreentransformed_qws.h
		SOURCES += $$PWD/qscreentransformed_qws.cpp
	}

	contains( gfx-drivers, directfb ) {
		INCLUDEPATH += $$QT_SOURCE_TREE/src/plugins/gfxdrivers/directfb
                include($$PWD/directfb.pri)
	}
#
# Keyboard drivers
#
	contains( kbd-drivers, qvfb ) {
		HEADERS +=$$PWD/qkbdvfb_qws.h
		SOURCES +=$$PWD/qkbdvfb_qws.cpp
		!contains( kbd-drivers, qvfb ) {
			kbd-drivers += qvfb
		}
        }

	contains( kbd-drivers, tty ) {
		HEADERS +=$$PWD/qkbdtty_qws.h
		SOURCES +=$$PWD/qkbdtty_qws.cpp
	}

	contains( kbd-drivers, linuxinput ) {
		HEADERS +=$$PWD/qkbdlinuxinput_qws.h
		SOURCES +=$$PWD/qkbdlinuxinput_qws.cpp
	}

	contains( kbd-drivers, um ) {
		HEADERS +=$$PWD/qkbdum_qws.h
		SOURCES +=$$PWD/qkbdum_qws.cpp
	}

        contains( kbd-drivers, qnx ) {
                HEADERS += $$PWD/qkbdqnx_qws.h
                SOURCES += $$PWD/qkbdqnx_qws.cpp
        }

#
# Mouse drivers
#
	contains( mouse-drivers, qvfb ) {
		HEADERS +=$$PWD/qmousevfb_qws.h
		SOURCES +=$$PWD/qmousevfb_qws.cpp
	}

	contains( mouse-drivers, pc ) {
		HEADERS +=$$PWD/qmousepc_qws.h
		SOURCES +=$$PWD/qmousepc_qws.cpp
	}

	contains( mouse-drivers, linuxtp ) {
		HEADERS +=$$PWD/qmouselinuxtp_qws.h
		SOURCES +=$$PWD/qmouselinuxtp_qws.cpp
	}

	contains( mouse-drivers, tslib ) {
		LIBS_PRIVATE += -lts
		HEADERS +=$$PWD/qmousetslib_qws.h
		SOURCES +=$$PWD/qmousetslib_qws.cpp
	}

	contains( mouse-drivers, linuxinput ) {
		HEADERS +=$$PWD/qmouselinuxinput_qws.h
		SOURCES +=$$PWD/qmouselinuxinput_qws.cpp
        }

        contains( mouse-drivers, qnx ) {
                HEADERS += $$PWD/qmouseqnx_qws.h
                SOURCES += $$PWD/qmouseqnx_qws.cpp
        }
}
