TEMPLATE = app
TARGET = tst_inputmethodhints

QT        += core

HEADERS   += inputmethodhints.h
SOURCES   += main.cpp \
    inputmethodhints.cpp
FORMS     += inputmethodhints.ui
RESOURCES +=

symbian:TARGET.UID3 = 0xE4938ABC
