QT += quick multimedia multimediawidgets

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp

RESOURCES += qml.qrc \
data/images/song_1.png \
data/images/song_2.jpg \
data/images/song_3.jpg \
data/icons/app_icon.ico \
data/songs/song_1.mp3 \
data/songs/song_2.mp3 \
data/songs/song_3.mp3 \

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $PWD

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS +=
