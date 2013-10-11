contains(QT_CONFIG, egl): {
	CONFIG += egl

	HEADERS += \
	    $$PWD/qegl_p.h \
	    $$PWD/qeglcontext_p.h \
	    $$PWD/qeglproperties_p.h

	SOURCES += \
	    $$PWD/qegl.cpp \
	    $$PWD/qeglproperties.cpp

	wince*: SOURCES += $$PWD/qegl_wince.cpp

	unix {
	    embedded {
	        SOURCES += $$PWD/qegl_qws.cpp
	    } else {
	        symbian {
	            SOURCES += $$PWD/qegl_symbian.cpp
	        } else {
	            SOURCES += $$PWD/qegl_x11.cpp
	        }
	    }
	}
} else:symbian {
	DEFINES += QT_NO_EGL
	SOURCES += $$PWD/qegl_stub.cpp
	SOURCES += $$PWD/qeglproperties_stub.cpp
}
