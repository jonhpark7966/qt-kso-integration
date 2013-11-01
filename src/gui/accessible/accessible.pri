# Qt accessibility module

contains(QT_CONFIG, accessibility) {
      HEADERS += $$PWD/qaccessible.h \
                 $$PWD/qaccessible2.h \
		 $$PWD/qaccessibleobject.h \
		 $$PWD/qaccessiblewidget.h \
		 $$PWD/qaccessibleplugin.h
      SOURCES += $$PWD/qaccessible.cpp \
                 $$PWD/qaccessible2.cpp \
		 $$PWD/qaccessibleobject.cpp \
		 $$PWD/qaccessiblewidget.cpp \
		 $$PWD/qaccessibleplugin.cpp

      mac:!embedded {
        HEADERS += $$PWD/qaccessible_mac_p.h
        OBJECTIVE_SOURCES += $$PWD/qaccessible_mac.mm \
                             $$PWD/qaccessible_mac_cocoa.mm
      } else:win32 { 
        SOURCES += $$PWD/qaccessible_win.cpp
      } else {
        HEADERS += $$PWD/qaccessiblebridge.h
        SOURCES += $$PWD/qaccessible_unix.cpp $$PWD/qaccessiblebridge.cpp
      }
}
