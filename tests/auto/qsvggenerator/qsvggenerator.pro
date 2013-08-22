############################################################
# Project file for autotest for file qsvggenerator.h
############################################################

load(qttest_p4)
QT += svg

SOURCES += tst_qsvggenerator.cpp

wince*|symbian {
    addFiles.sources = referenceSvgs
    addFiles.path = .
    DEPLOYMENT += addFiles
}

wince* {
    DEFINES += SRCDIR=\\\"\\\"
} else:!symbian {
    DEFINES += SRCDIR=\\\"$$PWD/\\\"
}
