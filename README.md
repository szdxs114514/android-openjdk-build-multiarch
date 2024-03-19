# mobile-openjdk8-build-multiarch 

基于http://openjdk.java.net/projects/mobile/android.html构建

## 构建准备 

### 开始
#### Android
- 下载 Android NDK r10e 地址→ https://developer.android.com/ndk/downloads/older_releases.html
  
#### iOS
-  使用Xcode12构建

### 特定于平台和体系结构的环境变量
<table>
      <thead>
        <tr>
          <th></th>
          <th align="center" colspan="7">Environment variables</th>
        </tr>
        <tr>
          <th>Platform - Architecture</th>
          <th align="center">TARGET</th>
          <th align="center">TARGET_JDK</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Android - armv8/aarch64</td>
          <td align="center">aarch64-linux-android</td>
          <td align="center">aarch64</td>
        </tr>
        <tr>
          <td>Android - armv7/aarch32</td>
          <td align="center">arm-linux-androideabi</td>
          <td align="center">arm</td>
        </tr>
        <tr>
          <td>Android - x86/i686</td>
          <td align="center">i686-linux-android</td>
          <td align="center">x86</td>
        </tr>
        <tr>
          <td>Android - x86_64/amd64</td>
          <td align="center">x86_64-linux-android</td>
          <td align="center">x86_64</td>
        </tr>
        <tr>
          <td>iOS/iPadOS - armv8/aarch64</td>
          <td align="center">aarch64-macos-ios</td>
          <td align="center">aarch64</td>
        </tr>
      </tbody>
	</table>

### 运行(构建)脚本:
```
export BUILD_IOS=1 # only when targeting iOS, default is 0 (target Android)

export BUILD_FREETYPE_VERSION=[2.6.2/.../2.10.4] # default: 2.10.4
export JDK_DEBUG_LEVEL=[release/fastdebug/debug] # default: release
export JVM_VARIANTS=[client/server] # default: client (aarch32), server (other architectures)

# Setup NDK, run once (Android only)
./extractndk.sh
./maketoolchain.sh 

# Get CUPS, Freetype and build Freetype
./getlibs.sh
./buildlibs.sh

# Clone JDK, run once
./clonejdk.sh

# Configure JDK and build, if no configuration is changed, run makejdkwithoutconfigure.sh instead
./buildjdk.sh

# Pack the built JDK
./removejdkdebuginfo.sh
./tarjdk.sh
```

