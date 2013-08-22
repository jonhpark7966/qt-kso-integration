# -*-mode:sh-*-
# Qt image handling

# Qt kernel module

HEADERS += \
        $$PWD/qbitmap.h \
        $$PWD/qicon.h \
        $$PWD/qicon_p.h \
        $$PWD/qiconloader_p.h \
        $$PWD/qiconengine.h \
        $$PWD/qiconengineplugin.h \
        $$PWD/qimage.h \
        $$PWD/qimage_p.h \
        $$PWD/qimageiohandler.h \
        $$PWD/qimagereader.h \
        $$PWD/qimagewriter.h \
        $$PWD/qmovie.h \
        $$PWD/qnativeimage_p.h \
        $$PWD/qpaintengine_pic_p.h \
        $$PWD/qpicture.h \
        $$PWD/qpicture_p.h \
        $$PWD/qpictureformatplugin.h \
        $$PWD/qpixmap.h \
        $$PWD/qpixmap_raster_p.h \
        $$PWD/qpixmapcache.h \
        $$PWD/qpixmapcache_p.h \
        $$PWD/qpixmapdata_p.h \
        $$PWD/qpixmapdatafactory_p.h \
        $$PWD/qpixmapfilter_p.h \
        $$PWD/qimagepixmapcleanuphooks_p.h \
        $$PWD/qvolatileimage_p.h \
        $$PWD/qvolatileimagedata_p.h \
        $$PWD/qnativeimagehandleprovider_p.h

SOURCES += \
        $$PWD/qbitmap.cpp \
        $$PWD/qicon.cpp \
        $$PWD/qiconloader.cpp \
        $$PWD/qimage.cpp \
        $$PWD/qimageiohandler.cpp \
        $$PWD/qimagereader.cpp \
        $$PWD/qimagewriter.cpp \
        $$PWD/qpaintengine_pic.cpp \
        $$PWD/qpicture.cpp \
        $$PWD/qpictureformatplugin.cpp \
        $$PWD/qpixmap.cpp \
        $$PWD/qpixmapcache.cpp \
        $$PWD/qpixmapdata.cpp \
        $$PWD/qpixmapdatafactory.cpp \
        $$PWD/qpixmapfilter.cpp \
        $$PWD/qiconengine.cpp \
        $$PWD/qiconengineplugin.cpp \
        $$PWD/qmovie.cpp \
        $$PWD/qpixmap_raster.cpp \
        $$PWD/qnativeimage.cpp \
        $$PWD/qimagepixmapcleanuphooks.cpp \
        $$PWD/qvolatileimage.cpp

win32 {
    SOURCES += $$PWD/qpixmap_win.cpp
}
else:embedded {
    SOURCES += $$PWD/qpixmap_qws.cpp
}
else:x11 {
    HEADERS += $$PWD/qpixmap_x11_p.h
    SOURCES += $$PWD/qpixmap_x11.cpp
}
else:mac {
    HEADERS += $$PWD/qpixmap_mac_p.h
    SOURCES += $$PWD/qpixmap_mac.cpp
}
else:symbian {
    HEADERS += $$PWD/qpixmap_raster_symbian_p.h
    SOURCES += $$PWD/qpixmap_raster_symbian.cpp
}

!symbian|contains(S60_VERSION, 3.1)|contains(S60_VERSION, 3.2) {
    SOURCES += $$PWD/qvolatileimagedata.cpp
}
else {
    SOURCES += $$PWD/qvolatileimagedata_symbian.cpp
}

# Built-in image format support
HEADERS += \
        $$PWD/qbmphandler_p.h \
        $$PWD/qppmhandler_p.h \
        $$PWD/qxbmhandler_p.h \
        $$PWD/qxpmhandler_p.h

SOURCES += \
        $$PWD/qbmphandler.cpp \
        $$PWD/qppmhandler.cpp \
        $$PWD/qxbmhandler.cpp \
        $$PWD/qxpmhandler.cpp

!contains(QT_CONFIG, no-png):include($$PWD/qpnghandler.pri)
else:DEFINES *= QT_NO_IMAGEFORMAT_PNG

contains(QT_CONFIG, jpeg):include($$PWD/qjpeghandler.pri)
contains(QT_CONFIG, mng):include($$PWD/qmnghandler.pri)
contains(QT_CONFIG, tiff):include($$PWD/qtiffhandler.pri)
contains(QT_CONFIG, gif):include($$PWD/qgifhandler.pri)

# SIMD
NEON_SOURCES += $$PWD/qimage_neon.cpp
SSE2_SOURCES += $$PWD/qimage_sse2.cpp
SSE4_SOURCES += $$PWD/qimage_sse4.cpp
SSSE3_SOURCES += $$PWD/qimage_ssse3.cpp
