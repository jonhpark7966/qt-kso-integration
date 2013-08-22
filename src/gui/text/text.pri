# Qt kernel module

HEADERS += \
	$$PWD/qfont.h \
	$$PWD/qfontdatabase.h \
	$$PWD/qfontengine_p.h \
	$$PWD/qfontengineglyphcache_p.h \
	$$PWD/qfontinfo.h \
	$$PWD/qfontmetrics.h \
	$$PWD/qfont_p.h \
	$$PWD/qfontsubset_p.h \
	$$PWD/qtextcontrol_p.h \
	$$PWD/qtextcontrol_p_p.h \
	$$PWD/qtextengine_p.h \
	$$PWD/qtextlayout.h \
	$$PWD/qtextformat.h \
	$$PWD/qtextformat_p.h \
	$$PWD/qtextobject.h \
	$$PWD/qtextobject_p.h \
	$$PWD/qtextoption.h \
	$$PWD/qfragmentmap_p.h \
	$$PWD/qtextdocument.h \
	$$PWD/qtextdocument_p.h \
	$$PWD/qtexthtmlparser_p.h \
	$$PWD/qabstracttextdocumentlayout.h \
	$$PWD/qtextdocumentlayout_p.h \
	$$PWD/qtextcursor.h \
	$$PWD/qtextcursor_p.h \
	$$PWD/qtextdocumentfragment.h \
	$$PWD/qtextdocumentfragment_p.h \
	$$PWD/qtextimagehandler_p.h \
	$$PWD/qtexttable.h \
	$$PWD/qtextlist.h \
	$$PWD/qsyntaxhighlighter.h \
	$$PWD/qtextdocumentwriter.h \
	$$PWD/qcssparser_p.h \
	$$PWD/qtexttable_p.h \
	$$PWD/qzipreader_p.h \
	$$PWD/qzipwriter_p.h \
	$$PWD/qtextodfwriter_p.h \
	$$PWD/qstatictext_p.h \
	$$PWD/qstatictext.h

SOURCES += \
	$$PWD/qfont.cpp \
	$$PWD/qfontengine.cpp \
	$$PWD/qfontsubset.cpp \
	$$PWD/qfontmetrics.cpp \
	$$PWD/qfontdatabase.cpp \
	$$PWD/qtextcontrol.cpp \
	$$PWD/qtextengine.cpp \
	$$PWD/qtextlayout.cpp \
	$$PWD/qtextformat.cpp \
	$$PWD/qtextobject.cpp \
	$$PWD/qtextoption.cpp \
	$$PWD/qfragmentmap.cpp \
	$$PWD/qtextdocument.cpp \
	$$PWD/qtextdocument_p.cpp \
	$$PWD/qtexthtmlparser.cpp \
	$$PWD/qabstracttextdocumentlayout.cpp \
	$$PWD/qtextdocumentlayout.cpp \
	$$PWD/qtextcursor.cpp \
	$$PWD/qtextdocumentfragment.cpp \
	$$PWD/qtextimagehandler.cpp \
	$$PWD/qtexttable.cpp \
	$$PWD/qtextlist.cpp \
	$$PWD/qtextdocumentwriter.cpp \
	$$PWD/qsyntaxhighlighter.cpp \
	$$PWD/qcssparser.cpp \
	$$PWD/qzip.cpp \
	$$PWD/qtextodfwriter.cpp \
	$$PWD/qstatictext.cpp

win32 {
	SOURCES += \
		$$PWD/qfont_win.cpp \
		$$PWD/qfontengine_win.cpp
	HEADERS += $$PWD/qfontengine_win_p.h
}

unix:x11 {
	HEADERS += \
		$$PWD/qfontengine_x11_p.h \
		$$PWD/qfontdatabase_x11.cpp \
		$$PWD/qfontengine_ft_p.h
	SOURCES += \
		$$PWD/qfont_x11.cpp \
		$$PWD/qfontengine_x11.cpp \
		$$PWD/qfontengine_ft.cpp
}

!embedded:!x11:mac {
	SOURCES += \
		$$PWD/qfont_mac.cpp
        OBJECTIVE_SOURCES += $$PWD/qfontengine_mac.mm
}

embedded {
	SOURCES += \
		$$PWD/qfont_qws.cpp \
		$$PWD/qfontengine_qws.cpp \
		$$PWD/qfontengine_ft.cpp \
		$$PWD/qfontengine_qpf.cpp \
		$$PWD/qabstractfontengine_qws.cpp
	HEADERS += \
		$$PWD/qfontengine_ft_p.h \
		$$PWD/qfontengine_qpf_p.h \
		$$PWD/qabstractfontengine_qws.h \
		$$PWD/qabstractfontengine_p.h
	DEFINES += QT_NO_FONTCONFIG
}

symbian {
	SOURCES += \
		$$PWD/qfont_s60.cpp
	contains(QT_CONFIG, freetype) {
		SOURCES += \
			$$PWD/qfontengine_ft.cpp
		HEADERS += \
			$$PWD/qfontengine_ft_p.h
		DEFINES += \
			QT_NO_FONTCONFIG
	} else {
		SOURCES += \
			$$PWD/qfontengine_s60.cpp
		HEADERS += \
			$$PWD/qfontengine_s60_p.h
		LIBS += -lfntstr -lecom
	}
}

contains(QT_CONFIG, freetype) {
    SOURCES += \
	../3rdparty/freetype/src/base/ftbase.c \
	../3rdparty/freetype/src/base/ftbbox.c \
	../3rdparty/freetype/src/base/ftdebug.c \
	../3rdparty/freetype/src/base/ftglyph.c \
	../3rdparty/freetype/src/base/ftinit.c \
	../3rdparty/freetype/src/base/ftmm.c \
	../3rdparty/freetype/src/base/fttype1.c \
	../3rdparty/freetype/src/base/ftsynth.c \
	../3rdparty/freetype/src/base/ftbitmap.c \
	../3rdparty/freetype/src/bdf/bdf.c \
	../3rdparty/freetype/src/cache/ftcache.c \
	../3rdparty/freetype/src/cff/cff.c \
	../3rdparty/freetype/src/cid/type1cid.c \
	../3rdparty/freetype/src/gzip/ftgzip.c \
	../3rdparty/freetype/src/pcf/pcf.c \
	../3rdparty/freetype/src/pfr/pfr.c \
	../3rdparty/freetype/src/psaux/psaux.c \
	../3rdparty/freetype/src/pshinter/pshinter.c \
	../3rdparty/freetype/src/psnames/psmodule.c \
	../3rdparty/freetype/src/raster/raster.c \
	../3rdparty/freetype/src/sfnt/sfnt.c \
	../3rdparty/freetype/src/smooth/smooth.c \
	../3rdparty/freetype/src/truetype/truetype.c \
	../3rdparty/freetype/src/type1/type1.c \
	../3rdparty/freetype/src/type42/type42.c \
	../3rdparty/freetype/src/winfonts/winfnt.c \
	../3rdparty/freetype/src/lzw/ftlzw.c\
          ../3rdparty/freetype/src/otvalid/otvalid.c\
          ../3rdparty/freetype/src/otvalid/otvbase.c\
          ../3rdparty/freetype/src/otvalid/otvgdef.c\
          ../3rdparty/freetype/src/otvalid/otvjstf.c\
          ../3rdparty/freetype/src/otvalid/otvcommn.c\
          ../3rdparty/freetype/src/otvalid/otvgpos.c\
          ../3rdparty/freetype/src/otvalid/otvgsub.c\
          ../3rdparty/freetype/src/otvalid/otvmod.c\
          ../3rdparty/freetype/src/autofit/afangles.c\
          ../3rdparty/freetype/src/autofit/afglobal.c\
          ../3rdparty/freetype/src/autofit/aflatin.c\
          ../3rdparty/freetype/src/autofit/afmodule.c\
          ../3rdparty/freetype/src/autofit/afdummy.c\
          ../3rdparty/freetype/src/autofit/afhints.c\
          ../3rdparty/freetype/src/autofit/afloader.c\
          ../3rdparty/freetype/src/autofit/autofit.c

    symbian {
        SOURCES += \
            ../3rdparty/freetype/src/base/ftsystem.c
    } else {
        SOURCES += \
            ../3rdparty/freetype/builds/unix/ftsystem.c
        INCLUDEPATH += \
            ../3rdparty/freetype/builds/unix
    }

    INCLUDEPATH += \
	../3rdparty/freetype/src \
	../3rdparty/freetype/include

    DEFINES += FT2_BUILD_LIBRARY FT_CONFIG_OPTION_SYSTEM_ZLIB
    
    embedded:CONFIG += opentype
} else:contains(QT_CONFIG, system-freetype) {
    embedded:CONFIG += opentype
    # pull in the proper freetype2 include directory
    include($$QT_SOURCE_TREE/config.tests/unix/freetype/freetype.pri)
    LIBS_PRIVATE += -lfreetype
}

contains(QT_CONFIG, fontconfig) {
    CONFIG += opentype
}

DEFINES += QT_NO_OPENTYPE
INCLUDEPATH += ../3rdparty/harfbuzz/src
