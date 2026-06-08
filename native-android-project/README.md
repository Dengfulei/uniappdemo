# uni-app x Android Native Project

This Android Studio project embeds the current uni-app x app and its Android UTS plugins.

## Modules

- `app`: native Android host app. The launcher enters `io.dcloud.uniapp.UniAppActivity` directly, and `ProductDetailActivity` is opened by the `native-bridge` UTS plugin.
- `uniappx`: Android Library module for the uni-app x runtime, exported app resources, and generated Kotlin code.
- `native-bridge`: Android UTS plugin module generated from `uni_modules/native-bridge`.
- `native-demo`: Android UTS plugin module generated from `uni_modules/native-demo`.

## Required SDK files

The repository does not currently contain the DCloud Android native SDK AARs or the UTS Gradle plugin jars. Before opening or syncing the project, copy them from the matching uni-app x Android native SDK version:

1. Copy the runtime AAR files into `uniappx/libs/`.
2. Copy `uts-kotlin-compiler-plugin-0.0.1.jar` and `uts-kotlin-gradle-plugin-0.0.1.jar` into `plugins/`.

The exported uni-app x app id is `__UNI__35453D1`, and the copied resources live at:

```text
uniappx/src/main/assets/apps/__UNI__35453D1/www
```

## Refresh exported resources

After changing the uni-app x project, regenerate local Android resources in HBuilderX:

```text
发行 -> 原生App-本地打包 -> 生成本地打包App资源
```

Then copy:

- `unpackage/resources/app-android/__UNI__35453D1` to `native-android-project/uniappx/src/main/assets/apps/__UNI__35453D1`
- `unpackage/resources/app-android/uniappx/app-android/src/*` to `native-android-project/uniappx/src/main/java/`
- `unpackage/resources/app-android/uni_modules/native-bridge/utssdk/app-android/src/*` to `native-android-project/native-bridge/src/main/java/`
- `unpackage/resources/app-android/uni_modules/native-demo/utssdk/app-android/src/*` to `native-android-project/native-demo/src/main/java/`
