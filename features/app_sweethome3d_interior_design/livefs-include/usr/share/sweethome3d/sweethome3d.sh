#!/bin/sh
#
#
BASEPATH=/usr/share/sweethome3d
JAVA_ARGS="-Djava.library.path=/usr/lib/jni \
 -Dcom.eteks.sweethome3d.applicationFolders=$HOME/.eteks/sweethome3d:/usr/share/sweethome3d \
 --add-exports java.desktop/sun.awt=ALL-UNNAMED"

# These have aged poorly and cause glitches,
# so both of these parameters removed:
# 387805e5c19cba3ee0691f991a45d9b1e94fac84i (2017-03-05)
#   Add -Dsun.java2d.opengl=true to startup script.
#   Closes: #854030
# 2793f4a3b23bcca09f13cc8557c201cbfc6d7599  (2016-10-12)
#  * Set -Dcom.eteks.sweethome3d.j3d.checkOffScreenSupport=false to fix crashes
#    and segmentation faults when trying to take a photo or open the preferences
#    menu. Thanks to Török Edwin for the suggested fix.
#    (Closes: #838387, #750821)

. /usr/lib/java-wrappers/java-wrappers.sh

find_java_runtime java8

find_jars j3dcore j3dutils vecmath batik
find_jars sunflow itext janino
find_jars freehep-io freehep-graphics2d freehep-graphicsbase freehep-graphicsio freehep-graphicsio-svg
find_jars /usr/share/sweethome3d/sweethome3d.jar
find_jars /usr/share/icedtea-web/netx.jar

cd $BASEPATH
run_java com.eteks.sweethome3d.SweetHome3D -open "$@"

