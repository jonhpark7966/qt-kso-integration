# Qt dialogs module

HEADERS += \
	$$PWD/qabstractprintdialog.h \
	$$PWD/qabstractprintdialog_p.h \
	$$PWD/qabstractpagesetupdialog.h \
	$$PWD/qabstractpagesetupdialog_p.h \
	$$PWD/qcolordialog.h \
	$$PWD/qcolordialog_p.h \
        $$PWD/qfscompleter_p.h \
	$$PWD/qdialog.h \
	$$PWD/qdialog_p.h \
	$$PWD/qerrormessage.h \
	$$PWD/qfiledialog.h \
	$$PWD/qfiledialog_p.h \
	$$PWD/qfontdialog.h \
	$$PWD/qfontdialog_p.h \
	$$PWD/qinputdialog.h \
	$$PWD/qmessagebox.h \
	$$PWD/qpagesetupdialog.h \
	$$PWD/qprintdialog.h \
	$$PWD/qprogressdialog.h \
        $$PWD/qsidebar_p.h \
        $$PWD/qfilesystemmodel.h \
        $$PWD/qfilesystemmodel_p.h \
        $$PWD/qfileinfogatherer_p.h \
	$$PWD/qwizard.h \
        $$PWD/qprintpreviewdialog.h

!embedded:mac {
    OBJECTIVE_SOURCES += $$PWD/qfiledialog_mac.mm \
                         $$PWD/qfontdialog_mac.mm \
                         $$PWD/qnspanelproxy_mac.mm \
                         $$PWD/qpagesetupdialog_mac.mm \
                         $$PWD/qprintdialog_mac.mm

# Compile qcolordialog_mac.mm with exception support, disregarding the -no-exceptions 
# configure option. (qcolordialog_mac needs to catch exceptions thrown by cocoa)
    EXCEPTION_SOURCES = $$PWD/qcolordialog_mac.mm
    exceptions_compiler.commands = $$QMAKE_CXX -c
    exceptions_compiler.commands += $(CXXFLAGS) $(INCPATH) ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
    exceptions_compiler.commands += -fexceptions
    exceptions_compiler.dependency_type = TYPE_C
    exceptions_compiler.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_BASE}$${first(QMAKE_EXT_OBJ)}
    exceptions_compiler.input = EXCEPTION_SOURCES
    exceptions_compiler.variable_out = OBJECTS
    exceptions_compiler.name = compiling[exceptopns] ${QMAKE_FILE_IN}
    silent:exceptions_compiler.commands = @echo compiling[exceptopns] ${QMAKE_FILE_IN} && $$exceptions_compiler.commands
    QMAKE_EXTRA_COMPILERS += exceptions_compiler
}

win32 {
    HEADERS += $$PWD/qwizard_win_p.h \
               $$PWD/qfiledialog_win_p.h
    SOURCES += $$PWD/qdialogsbinarycompat_win.cpp \
               $$PWD/qfiledialog_win.cpp \
               $$PWD/qpagesetupdialog_win.cpp \
               $$PWD/qprintdialog_win.cpp \
               $$PWD/qwizard_win.cpp

    !win32-borland:!wince*: LIBS += -lshell32 	# the filedialog needs this library
}

!mac:!embedded:!symbian:unix {
        HEADERS += $$PWD/qpagesetupdialog_unix_p.h
	SOURCES += $$PWD/qprintdialog_unix.cpp \
		   $$PWD/qpagesetupdialog_unix.cpp
	FORMS += $$PWD/qprintsettingsoutput.ui \
        $$PWD/qprintwidget.ui \
        $$PWD/qprintpropertieswidget.ui
}

embedded {
        contains(QT_CONFIG,qtopia) {
            HEADERS += $$PWD/qpagesetupdialog_unix_p.h
            DEFINES += QTOPIA_PRINTDIALOG
            SOURCES += $$PWD/qprintdialog_qws.cpp \
                       $$PWD/qpagesetupdialog_unix.cpp
        } else {
            HEADERS += $$PWD/qpagesetupdialog_unix_p.h
            SOURCES += $$PWD/qprintdialog_unix.cpp \
                       $$PWD/qpagesetupdialog_unix.cpp
            FORMS += $$PWD/qprintsettingsoutput.ui \
                     $$PWD/qprintwidget.ui \
                     $$PWD/qprintpropertieswidget.ui
        }
}

wince*|symbian: FORMS += $$PWD/qfiledialog_embedded.ui
else: FORMS += $$PWD/qfiledialog.ui

INCLUDEPATH += $$PWD
SOURCES += \
	$$PWD/qabstractprintdialog.cpp \
	$$PWD/qabstractpagesetupdialog.cpp \
	$$PWD/qcolordialog.cpp \
	$$PWD/qdialog.cpp \
	$$PWD/qerrormessage.cpp \
	$$PWD/qfiledialog.cpp \
	$$PWD/qfontdialog.cpp \
	$$PWD/qinputdialog.cpp \
	$$PWD/qmessagebox.cpp \
	$$PWD/qprogressdialog.cpp \
        $$PWD/qsidebar.cpp \
        $$PWD/qfilesystemmodel.cpp \
        $$PWD/qfileinfogatherer.cpp \
        $$PWD/qpagesetupdialog.cpp \
	$$PWD/qwizard.cpp \
        $$PWD/qprintpreviewdialog.cpp

symbian:contains(QT_CONFIG, s60) {
    contains(CONFIG, is_using_gnupoc) {
        LIBS += -lcommondialogs
    } else {
        LIBS += -lCommonDialogs
    }
    SOURCES += $$PWD/qfiledialog_symbian.cpp \
               $$PWD/qcolordialog_symbian.cpp
}

FORMS += $$PWD/qpagesetupwidget.ui
RESOURCES += $$PWD/qprintdialog.qrc
RESOURCES += $$PWD/qmessagebox.qrc

# Compensate for lack of platform defines in Symbian3
symbian: DEFINES += SYMBIAN_VERSION_$$upper($$replace(SYMBIAN_VERSION,\\.,_))
