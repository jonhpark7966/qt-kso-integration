TARGET = QtMultimedia
QPRO_PWD = $$PWD
QT = core

DEFINES += QT_BUILD_MULTIMEDIA_LIB QT_NO_USING_NAMESPACE

unix:QMAKE_PKGCONFIG_REQUIRES = QtCore

include(../qbase.pri)

include(audio/audio.pri)
include(video/video.pri)

symbian: {
    TARGET.UID3 = 0x2001E627
}
