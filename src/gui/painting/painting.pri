# Qt gui library, paint module
HEADERS += \
        $$PWD/qbezier_p.h \
        $$PWD/qbrush.h \
        $$PWD/qcolor.h \
        $$PWD/qcolor_p.h \
        $$PWD/qcolormap.h \
        $$PWD/qdrawutil.h \
        $$PWD/qemulationpaintengine_p.h \
        $$PWD/qgraphicssystem_p.h \
        $$PWD/qgraphicssystemex_p.h \
        $$PWD/qmatrix.h \
        $$PWD/qmemrotate_p.h \
        $$PWD/qoutlinemapper_p.h \
        $$PWD/qpaintdevice.h \
        $$PWD/qpaintengine.h \
		$$PWD/qpaintengine_p.h \
        $$PWD/qpaintengine_alpha_p.h \
        $$PWD/qpaintengine_preview_p.h \
        $$PWD/qpaintengineex_p.h \
        $$PWD/qpainter.h \
        $$PWD/qpainter_p.h \
        $$PWD/qpainterpath.h \
        $$PWD/qpainterpath_p.h \
        $$PWD/qvectorpath_p.h \
        $$PWD/qpathclipper_p.h \
        $$PWD/qpdf_p.h \
        $$PWD/qpen.h \
        $$PWD/qpolygon.h \
        $$PWD/qpolygonclipper_p.h \
        $$PWD/qprintengine.h \
        $$PWD/qprintengine_pdf_p.h \
        $$PWD/qprintengine_ps_p.h \
        $$PWD/qprinter.h \
        $$PWD/qprinter_p.h \
        $$PWD/qprinterinfo.h \
        $$PWD/qrasterizer_p.h \
        $$PWD/qregion.h \
        $$PWD/qstroker_p.h \
        $$PWD/qstylepainter.h \
        $$PWD/qtessellator_p.h \
        $$PWD/qtextureglyphcache_p.h \
        $$PWD/qtransform.h \
        $$PWD/qwindowsurface_p.h \
        $$PWD/qwmatrix.h \
        $$PWD/qpaintbuffer_p.h \
        $$PWD/qpathgradient_p.h \
        $$PWD/qcomplexstroker.h \
        $$PWD/qcomplexstroker_p.h \
        $$PWD/qcustomlineanchor.h \
        $$PWD/qcustomlineanchor_p.h

SOURCES += \
        $$PWD/qbezier.cpp \
        $$PWD/qblendfunctions.cpp \
        $$PWD/qbrush.cpp \
        $$PWD/qcolor.cpp \
        $$PWD/qcolor_p.cpp \
        $$PWD/qcssutil.cpp \
        $$PWD/qdrawutil.cpp \
        $$PWD/qemulationpaintengine.cpp \
        $$PWD/qgraphicssystem.cpp \
        $$PWD/qmatrix.cpp \
        $$PWD/qmemrotate.cpp \
        $$PWD/qoutlinemapper.cpp \
        $$PWD/qpaintdevice.cpp \
        $$PWD/qpaintengine.cpp \
        $$PWD/qpaintengine_alpha.cpp \
        $$PWD/qpaintengine_preview.cpp \
        $$PWD/qpaintengineex.cpp \
        $$PWD/qpainter.cpp \
        $$PWD/qpainterpath.cpp \
        $$PWD/qpathclipper.cpp \
        $$PWD/qpdf.cpp \
        $$PWD/qpen.cpp \
        $$PWD/qpolygon.cpp \
        $$PWD/qprintengine_pdf.cpp \
        $$PWD/qprintengine_ps.cpp \
        $$PWD/qprinter.cpp \
        $$PWD/qrasterizer.cpp \
        $$PWD/qregion.cpp \
        $$PWD/qstroker.cpp \
        $$PWD/qstylepainter.cpp \
        $$PWD/qtessellator.cpp \
        $$PWD/qtextureglyphcache.cpp \
        $$PWD/qtransform.cpp \
        $$PWD/qwindowsurface.cpp \
        $$PWD/qpaintbuffer.cpp	\
        $$PWD/qcomplexstroker.cpp \
        $$PWD/qcustomlineanchor.cpp

        SOURCES +=                                      \
                $$PWD/qpaintengine_raster.cpp        \
                $$PWD/qdrawhelper.cpp                \
                $$PWD/qimagescale.cpp                \
                $$PWD/qgrayraster.c

        HEADERS +=                                      \
                $$PWD/qpaintengine_raster_p.h        \
                $$PWD/qdrawhelper_p.h                \
                $$PWD/qblendfunctions_p.h            \
                $$PWD/qrasterdefs_p.h                \
                $$PWD/qgrayraster_p.h

win32 {
        HEADERS += $$PWD/qprintengine_win_p.h

        SOURCES += \
                $$PWD/qcolormap_win.cpp \
                $$PWD/qpaintdevice_win.cpp \
                $$PWD/qprintengine_win.cpp \
                $$PWD/qprinterinfo_win.cpp

        !win32-borland:!wince*:LIBS += -lmsimg32
}

embedded {
    HEADERS += \
        $$PWD/qgraphicssystem_qws_p.h \

    SOURCES += \
        $$PWD/qgraphicssystem_qws.cpp \

} else {
    HEADERS += \
        $$PWD/qgraphicssystem_raster_p.h \
        $$PWD/qgraphicssystem_runtime_p.h \
        $$PWD/qgraphicssystemfactory_p.h \
        $$PWD/qgraphicssystemplugin_p.h \
        $$PWD/qwindowsurface_raster_p.h \

    SOURCES += \
        $$PWD/qgraphicssystem_raster.cpp \
        $$PWD/qgraphicssystem_runtime.cpp \
        $$PWD/qgraphicssystemfactory.cpp \
        $$PWD/qgraphicssystemplugin.cpp \
        $$PWD/qwindowsurface_raster.cpp \
}

unix:x11 {
        HEADERS += \
                $$PWD/qpaintengine_x11_p.h

        SOURCES += \
                $$PWD/qcolormap_x11.cpp \
                $$PWD/qpaintdevice_x11.cpp \
                $$PWD/qpaintengine_x11.cpp
}

!embedded:!x11:mac {
        HEADERS += \
                $$PWD/qpaintengine_mac_p.h \
                $$PWD/qgraphicssystem_mac_p.h \
                $$PWD/qprintengine_mac_p.h

        SOURCES += \
                $$PWD/qcolormap_mac.cpp \
                $$PWD/qpaintdevice_mac.cpp \
                $$PWD/qpaintengine_mac.cpp \
                $$PWD/qgraphicssystem_mac.cpp \
                $$PWD/qprinterinfo_mac.cpp
        OBJECTIVE_SOURCES += \
                $$PWD/qprintengine_mac.mm \
}

unix:!mac:!symbian {
        HEADERS += \
                $$PWD/qprinterinfo_unix_p.h
        SOURCES += \
                $$PWD/qprinterinfo_unix.cpp
}

win32|x11|mac|embedded|symbian {
        SOURCES += $$PWD/qbackingstore.cpp
        HEADERS += $$PWD/qbackingstore_p.h
}

embedded {
        contains(QT_CONFIG,qtopia) {
                DEFINES += QTOPIA_PRINTENGINE
                HEADERS += $$PWD/qprintengine_qws_p.h
                SOURCES += $$PWD/qprintengine_qws.cpp
        }

        SOURCES += \
                $$PWD/qcolormap_qws.cpp \
                $$PWD/qpaintdevice_qws.cpp
}

symbian {
        SOURCES += \
		$$PWD/qpaintengine_raster_symbian.cpp \
                $$PWD/qregion_s60.cpp \
                $$PWD/qcolormap_s60.cpp

        HEADERS += \
                $$PWD/qpaintengine_raster_symbian_p.h
}

x11|embedded {
        contains(QT_CONFIG,qtopia) {
            DEFINES += QT_NO_CUPS QT_NO_LPR
        } else {
            SOURCES += $$PWD/qcups.cpp
            HEADERS += $$PWD/qcups_p.h
        }
} else {
        DEFINES += QT_NO_CUPS QT_NO_LPR
}

if(mmx|3dnow|sse|sse2|sse4|iwmmxt) {
    HEADERS += $$PWD/qdrawhelper_x86_p.h \
               $$PWD/qdrawhelper_mmx_p.h \
               $$PWD/qdrawhelper_sse_p.h \
               $$PWD/qdrawingprimitive_sse2_p.h
    MMX_SOURCES += $$PWD/qdrawhelper_mmx.cpp
    MMX3DNOW_SOURCES += $$PWD/qdrawhelper_mmx3dnow.cpp
    SSE3DNOW_SOURCES += $$PWD/qdrawhelper_sse3dnow.cpp
    SSE_SOURCES += $$PWD/qdrawhelper_sse.cpp
    SSE2_SOURCES += $$PWD/qdrawhelper_sse2.cpp
    SSSE3_SOURCES += $$PWD/qdrawhelper_ssse3.cpp
    SSE4_SOURCES += $$PWD/qpathgradient_p_sse4.cpp
    IWMMXT_SOURCES += $$PWD/qdrawhelper_iwmmxt.cpp
}

x11 {
        HEADERS += $$PWD/qwindowsurface_x11_p.h
        SOURCES += $$PWD/qwindowsurface_x11.cpp
}

mac {
        HEADERS += $$PWD/qwindowsurface_mac_p.h
        SOURCES += $$PWD/qwindowsurface_mac.cpp
}

embedded {
        HEADERS += $$PWD/qwindowsurface_qws_p.h
        SOURCES += $$PWD/qwindowsurface_qws.cpp
}



symbian {
        HEADERS += $$PWD/qwindowsurface_s60_p.h \
                    $$PWD/qdrawhelper_arm_simd_p.h \
                    $$PWD/qgraphicssystemex_symbian_p.h
        SOURCES += $$PWD/qwindowsurface_s60.cpp \
                    $$PWD/qgraphicssystemex_symbian.cpp
        armccIfdefBlock = \
        "$${LITERAL_HASH}if defined(ARMV6)" \
        "MACRO QT_HAVE_ARM_SIMD" \
        "SOURCEPATH 	$$PWD/painting" \
        "SOURCE			qdrawhelper_arm_simd.cpp" \
        "$${LITERAL_HASH}endif"

        MMP_RULES += armccIfdefBlock
        QMAKE_CXXFLAGS.ARMCC *= -O3
}

NEON_SOURCES += $$PWD/qdrawhelper_neon.cpp
NEON_HEADERS += $$PWD/qdrawhelper_neon_p.h
NEON_ASM += ../3rdparty/pixman/pixman-arm-neon-asm.S painting/qdrawhelper_neon_asm.S

include($$PWD/../../3rdparty/zlib_dependency.pri)
