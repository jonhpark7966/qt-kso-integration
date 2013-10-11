TARGET	   = QtCore
QPRO_PWD   = $$PWD
QT         = 
DEFINES   += QT_BUILD_CORE_LIB QT_BUILD_XML_LIB QT_BUILD_GUI_LIB QT_NO_USING_NAMESPACE
win32-msvc*|win32-icc:QMAKE_LFLAGS += /BASE:0x67000000
irix-cc*:QMAKE_CXXFLAGS += -no_prelink -ptused
win32-msvc*:QMAKE_USE_PGO = yes
win32-borland {
        QMAKE_CFLAGS_WARN_ON        += -w-use
        QMAKE_CXXFLAGS_WARN_ON        += -w-use
}

!win32:!embedded:!mac:!symbian:CONFIG      += x11
contains(QT_CONFIG, x11sm):CONFIG += x11sm

# corelib begin
include(../qbase.pri)
include(animation/animation.pri)
include(arch/arch.pri)
include(concurrent/concurrent.pri)
include(global/global.pri)
include(thread/thread.pri)
include(tools/tools.pri)
include(io/io.pri)
include(plugin/plugin.pri)
include(kernel/kernel.pri)
include(codecs/codecs.pri)
include(statemachine/statemachine.pri)
include(xml/xml.pri)
# corelib end

# xml begin
include(../xml/dom/dom.pri)
include(../xml/sax/sax.pri)
include(../xml/stream/stream.pri)
# xml end

# gui begin
#platforms
x11:include(../gui/kernel/x11.pri)
mac:include(../gui/kernel/mac.pri)
win32:include(../gui/kernel/win.pri)
embedded:include(../gui/embedded/embedded.pri)
symbian {
    include(../gui/kernel/symbian.pri)
    include(../gui/s60framework/s60framework.pri)
}

#modules
include(../gui/animation/animation.pri)
include(../gui/kernel/kernel.pri)
include(../gui/image/image.pri)
include(../gui/painting/painting.pri)
include(../gui/text/text.pri)
include(../gui/styles/styles.pri)
include(../gui/widgets/widgets.pri)
include(../gui/dialogs/dialogs.pri)
include(../gui/accessible/accessible.pri)
include(../gui/itemviews/itemviews.pri)
include(../gui/inputmethod/inputmethod.pri)
include(../gui/graphicsview/graphicsview.pri)
include(../gui/util/util.pri)
include(../gui/statemachine/statemachine.pri)
include(../gui/math3d/math3d.pri)
include(../gui/effects/effects.pri)

include(../gui/egl/egl.pri)
# gui end

PRECOMPILED_HEADER = ../gui/kernel/qt_gui_pch.h
INCLUDEPATH += \
	$$QMAKE_INCDIR_QT/QtXml \
	$$QMAKE_INCDIR_QT/QtGui

mac|darwin:LIBS_PRIVATE += -framework ApplicationServices

mac:lib_bundle:DEFINES += QT_NO_DEBUG_PLUGIN_CHECK
win32:DEFINES-=QT_NO_CAST_TO_ASCII

win32:!wince*: DEFINES += QT_NO_EGL
embedded: QT += network

QMAKE_LIBS += $$QMAKE_LIBS_CORE
#QMAKE_LIBS += $$QMAKE_LIBS_GUI

QMAKE_DYNAMIC_LIST_FILE = $$PWD/QtCore.dynlist
QMAKE_DYNAMIC_LIST_FILE += $$PWD/QtGui.dynlist

contains(DEFINES,QT_EVAL):include(eval.pri)

symbian: {
    TARGET.UID3=0x2001B2DC

    # Problems using data exports from this DLL mean that we can't page it on releases that don't support
    # data exports (currently that's any release before Symbian^3)
    pagingBlock = "$${LITERAL_HASH}ifndef SYMBIAN_DLL_DATA_EXPORTS_SUPPORTED" \
                  "UNPAGED" \
                  "$${LITERAL_HASH}endif"
    MMP_RULES += pagingBlock
}

neon:*-g++* {
    DEFINES += QT_HAVE_NEON
    HEADERS += $$NEON_HEADERS
    SOURCES += $$NEON_SOURCES

    DRAWHELPER_NEON_ASM_FILES = $$NEON_ASM

    neon_compiler.commands = $$QMAKE_CXX -c -mfpu=neon
    neon_compiler.commands += $(CXXFLAGS) $(INCPATH) ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
    neon_compiler.dependency_type = TYPE_C
    neon_compiler.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_BASE}$${first(QMAKE_EXT_OBJ)}
    neon_compiler.input = DRAWHELPER_NEON_ASM_FILES
    neon_compiler.variable_out = OBJECTS
    neon_compiler.name = compiling[neon] ${QMAKE_FILE_IN}
    silent:neon_compiler.commands = @echo compiling[neon] ${QMAKE_FILE_IN} && $$neon_compiler.commands
    QMAKE_EXTRA_COMPILERS += neon_compiler
}

contains(QMAKE_MAC_XARCH, no) {
    DEFINES += QT_NO_MAC_XARCH
} else {
    win32-g++*|!win32:!win32-icc*:!macx-icc* {
        mmx {
            mmx_compiler.commands = $$QMAKE_CXX -c -Winline

            mac {
                mmx_compiler.commands += -Xarch_i386 -mmmx
                mmx_compiler.commands += -Xarch_x86_64 -mmmx
            } else {
                mmx_compiler.commands += -mmmx
            }

            mmx_compiler.commands += $(CXXFLAGS) $(INCPATH) ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
            mmx_compiler.dependency_type = TYPE_C
            mmx_compiler.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_BASE}$${first(QMAKE_EXT_OBJ)}
            mmx_compiler.input = MMX_SOURCES
            mmx_compiler.variable_out = OBJECTS
            mmx_compiler.name = compiling[mmx] ${QMAKE_FILE_IN}
            silent:mmx_compiler.commands = @echo compiling[mmx] ${QMAKE_FILE_IN} && $$mmx_compiler.commands
            QMAKE_EXTRA_COMPILERS += mmx_compiler
        }
        3dnow {
            mmx3dnow_compiler.commands = $$QMAKE_CXX -c -Winline

            mac {
                mmx3dnow_compiler.commands += -Xarch_i386 -m3dnow -Xarch_i386 -mmmx
                mmx3dnow_compiler.commands += -Xarch_x86_64 -m3dnow -Xarch_x86_64 -mmmx
            } else {
                mmx3dnow_compiler.commands += -m3dnow -mmmx
            }

            mmx3dnow_compiler.commands += $(CXXFLAGS) $(INCPATH) ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
            mmx3dnow_compiler.dependency_type = TYPE_C
            mmx3dnow_compiler.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_BASE}$${first(QMAKE_EXT_OBJ)}
            mmx3dnow_compiler.input = MMX3DNOW_SOURCES
            mmx3dnow_compiler.variable_out = OBJECTS
            mmx3dnow_compiler.name = compiling[mmx3dnow] ${QMAKE_FILE_IN}
            silent:mmx3dnow_compiler.commands = @echo compiling[mmx3dnow] ${QMAKE_FILE_IN} && $$mmx3dnow_compiler.commands
            QMAKE_EXTRA_COMPILERS += mmx3dnow_compiler
            sse {
                sse3dnow_compiler.commands = $$QMAKE_CXX -c -Winline

                mac {
                    sse3dnow_compiler.commands += -Xarch_i386 -m3dnow -Xarch_i386 -msse
                    sse3dnow_compiler.commands += -Xarch_x86_64 -m3dnow -Xarch_x86_64 -msse
                } else {
                    sse3dnow_compiler.commands += -m3dnow -msse
                }

                sse3dnow_compiler.commands += $(CXXFLAGS) $(INCPATH) ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
                sse3dnow_compiler.dependency_type = TYPE_C
                sse3dnow_compiler.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_BASE}$${first(QMAKE_EXT_OBJ)}
                sse3dnow_compiler.input = SSE3DNOW_SOURCES
                sse3dnow_compiler.variable_out = OBJECTS
                sse3dnow_compiler.name = compiling[sse3dnow] ${QMAKE_FILE_IN}
                silent:sse3dnow_compiler.commands = @echo compiling[sse3dnow] ${QMAKE_FILE_IN} && $$sse3dnow_compiler.commands
                QMAKE_EXTRA_COMPILERS += sse3dnow_compiler
            }
        }
        sse {
            sse_compiler.commands = $$QMAKE_CXX -c -Winline

            mac {
                sse_compiler.commands += -Xarch_i386 -msse
                sse_compiler.commands += -Xarch_x86_64 -msse
            } else {
                sse_compiler.commands += -msse
            }

            sse_compiler.commands += $(CXXFLAGS) $(INCPATH) ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
            sse_compiler.dependency_type = TYPE_C
            sse_compiler.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_BASE}$${first(QMAKE_EXT_OBJ)}
            sse_compiler.input = SSE_SOURCES
            sse_compiler.variable_out = OBJECTS
            sse_compiler.name = compiling[sse] ${QMAKE_FILE_IN}
            silent:sse_compiler.commands = @echo compiling[sse] ${QMAKE_FILE_IN} && $$sse_compiler.commands
            QMAKE_EXTRA_COMPILERS += sse_compiler
        }
        sse2 {
            sse2_compiler.commands = $$QMAKE_CXX -c -Winline

            mac {
                sse2_compiler.commands += -Xarch_i386 -msse2
                sse2_compiler.commands += -Xarch_x86_64 -msse2
            } else {
                sse2_compiler.commands += -msse2
            }

            sse2_compiler.commands += $(CXXFLAGS) $(INCPATH) ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
            sse2_compiler.dependency_type = TYPE_C
            sse2_compiler.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_BASE}$${first(QMAKE_EXT_OBJ)}
            sse2_compiler.input = SSE2_SOURCES
            sse2_compiler.variable_out = OBJECTS
            sse2_compiler.name = compiling[sse2] ${QMAKE_FILE_IN}
            silent:sse2_compiler.commands = @echo compiling[sse2] ${QMAKE_FILE_IN} && $$sse2_compiler.commands
            QMAKE_EXTRA_COMPILERS += sse2_compiler
        }
        ssse3 {
            ssse3_compiler.commands = $$QMAKE_CXX -c -Winline

            mac {
                ssse3_compiler.commands += -Xarch_i386 -mssse3
                ssse3_compiler.commands += -Xarch_x86_64 -mssse3
            } else {
                ssse3_compiler.commands += -mssse3
            }

            ssse3_compiler.commands += $(CXXFLAGS) $(INCPATH) ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
            ssse3_compiler.dependency_type = TYPE_C
            ssse3_compiler.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_BASE}$${first(QMAKE_EXT_OBJ)}
            ssse3_compiler.input = SSSE3_SOURCES
            ssse3_compiler.variable_out = OBJECTS
            ssse3_compiler.name = compiling[ssse3] ${QMAKE_FILE_IN}
            silent:ssse3_compiler.commands = @echo compiling[ssse3] ${QMAKE_FILE_IN} && $$ssse3_compiler.commands
            QMAKE_EXTRA_COMPILERS += ssse3_compiler
        }
        sse4_1 {
            sse4_1_compiler.commands = $$QMAKE_CXX -c -Winline

            mac {
                sse4_1_compiler.commands += -Xarch_i386 -msse4.1
                sse4_1_compiler.commands += -Xarch_x86_64 -msse4.1
            } else {
                sse4_1_compiler.commands += -msse4.1
            }

            sse4_1_compiler.commands += $(CXXFLAGS) $(INCPATH) ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
            sse4_1_compiler.dependency_type = TYPE_C
            sse4_1_compiler.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_BASE}$${first(QMAKE_EXT_OBJ)}
            sse4_1_compiler.input = SSE4_SOURCES
            sse4_1_compiler.variable_out = OBJECTS
            sse4_1_compiler.name = compiling[sse4_1] ${QMAKE_FILE_IN}
            silent:sse4_1_compiler.commands = @echo compiling[sse4_1] ${QMAKE_FILE_IN} && $$sse4_1_compiler.commands
            QMAKE_EXTRA_COMPILERS += sse4_1_compiler
        }
        iwmmxt {
            iwmmxt_compiler.commands = $$QMAKE_CXX -c -Winline
            iwmmxt_compiler.commands += -mcpu=iwmmxt
            iwmmxt_compiler.commands += $(CXXFLAGS) $(INCPATH) ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}
            iwmmxt_compiler.dependency_type = TYPE_C
            iwmmxt_compiler.output = ${QMAKE_VAR_OBJECTS_DIR}${QMAKE_FILE_BASE}$${first(QMAKE_EXT_OBJ)}
            iwmmxt_compiler.input = IWMMXT_SOURCES
            iwmmxt_compiler.variable_out = OBJECTS
            iwmmxt_compiler.name = compiling[iwmmxt] ${QMAKE_FILE_IN}
            silent:iwmmxt_compiler.commands = @echo compiling[iwmmxt] ${QMAKE_FILE_IN} && $$iwmmxt_compiler.commands
            QMAKE_EXTRA_COMPILERS += iwmmxt_compiler
        }
    } else {
        mmx: SOURCES += $$MMX_SOURCES
        3dnow: SOURCES += $$MMX3DNOW_SOURCES
        3dnow:sse: SOURCES += $$SSE3DNOW_SOURCES
        sse: SOURCES += $$SSE_SOURCES
        sse2: SOURCES += $$SSE2_SOURCES
        ssse3: SOURCES += $$SSSE3_SOURCES
        sse4: SOURCES += $$SSE4_SOURCES
        iwmmxt: SOURCES += $$IWMMXT_SOURCES
    }
}

