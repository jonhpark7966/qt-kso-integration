HEADERS = bearercloud.h \
          cloud.h

SOURCES = main.cpp \
          bearercloud.cpp \
          cloud.cpp

RESOURCES = icons.qrc

TARGET = bearercloud

QT = core network svg

CONFIG += console

symbian:TARGET.CAPABILITY = NetworkServices ReadUserData
