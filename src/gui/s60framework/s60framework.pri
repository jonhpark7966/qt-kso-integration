SOURCES += $$PWD/qs60mainapplication.cpp \
           $$PWD/qs60mainappui.cpp \
           $$PWD/qs60maindocument.cpp

HEADERS += $$PWD/qs60mainapplication_p.h \
           $$PWD/qs60mainapplication.h \
           $$PWD/qs60mainappui.h \
           $$PWD/qs60maindocument.h

!isEmpty(QT_LIBINFIX): DEFINES += QT_LIBINFIX_UNQUOTED=$$QT_LIBINFIX