load(qttest_p4)

SOURCES += tst_qaudiooutput.cpp

QT = core multimedia

wince*|symbian: {
    deploy.sources += 4.wav
    DEPLOYMENT = deploy
    !symbian {
        DEFINES += SRCDIR=\\\"\\\"
        QT += core
    }
} else {
    DEFINES += SRCDIR=\\\"$$PWD/\\\"
}
