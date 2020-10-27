export NDK_VERSION=r14

if [ -z "$JDK_DEBUG_LEVEL" ]
then
  export JDK_DEBUG_LEVEL=release
fi

if [ "$TARGET_JDK" == "aarch64" ]
then
  export TARGET_SHORT=arm64
else
  export TARGET_SHORT=$TARGET_JDK
fi

# Override GitHub Actions env var
export NDK_HOME=`pwd`/android-ndk-$NDK_VERSION

export NDK=$NDK_HOME
export ANDROID_DEVKIT=$NDK/generated-toolchains/android-${TARGET_SHORT}-toolchain
export TOOLCHAIN=$ANDROID_DEVKIT

export ANDROID_INCLUDE=$NDK/platforms/android-21/arch-${TARGET_SHORT}/usr/include

export CPPFLAGS="-I$ANDROID_INCLUDE" # -I/usr/include -I/usr/lib
export LDFLAGS="-L$NDK/platforms/android-21/arch-${TARGET_SHORT}/usr/lib"

# Configure and build.
# Deprecated...
export AR=$TOOLCHAIN/bin/$TARGET-ar
export AS=$TOOLCHAIN/bin/$TARGET-as
export CC=$TOOLCHAIN/bin/$TARGET-gcc
export CXX=$TOOLCHAIN/bin/$TARGET-g++
export LD=$TOOLCHAIN/bin/$TARGET-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET-strip

# export BUILD_AR=$AR
# export BUILD_AS=$AS
# export BUILD_CC=$CC
# export BUILD_CXX=$CXX
# export BUILD_LD=$LD
# export BUILD_RANLIB=$RANLIB
# export BUILD_STRIP=$STRIP
