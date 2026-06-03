#!/bin/sh
set -eu

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_IOS_DIR="$(cd "$ROOT_DIR/.." && pwd)"
FRAMEWORK_NAME="NativeUniModules"
BUILD_DIR="${TMPDIR:-/tmp}/$FRAMEWORK_NAME-build"
OUTPUT_DIR="$REPO_IOS_DIR/Frameworks"
OUTPUT_XCFRAMEWORK="$OUTPUT_DIR/$FRAMEWORK_NAME.xcframework"

BRIDGE_SOURCE="$REPO_IOS_DIR/UniAppXDemo/uni-app-x/uni_modules/native-bridge/utssdk/app-ios/src/index.swift"
DEMO_SOURCE="$REPO_IOS_DIR/UniAppXDemo/uni-app-x/uni_modules/native-demo/utssdk/app-ios/src/native-demo-index.swift"

rm -rf "$BUILD_DIR" "$OUTPUT_XCFRAMEWORK"
mkdir -p "$OUTPUT_DIR"

make_framework() {
  platform="$1"
  target="$2"
  sdk_name="$3"
  module_suffix="$4"
  dcloud_slice="$5"

  sdk_path="$(xcrun --sdk "$sdk_name" --show-sdk-path)"
  framework_dir="$BUILD_DIR/$platform/$FRAMEWORK_NAME.framework"
  modules_dir="$framework_dir/Modules/$FRAMEWORK_NAME.swiftmodule"
  headers_dir="$framework_dir/Headers"
  uts_foundation_dir="$REPO_IOS_DIR/SDK/Libs/DCloudUTSFoundation.xcframework/$dcloud_slice"
  runtime_dir="$REPO_IOS_DIR/SDK/Libs/DCloudUniappRuntime.xcframework/$dcloud_slice"

  mkdir -p "$modules_dir" "$headers_dir"

  swiftc "$BRIDGE_SOURCE" "$DEMO_SOURCE" \
    -emit-library \
    -emit-module \
    -module-name "$FRAMEWORK_NAME" \
    -target "$target" \
    -sdk "$sdk_path" \
    -parse-as-library \
    -enable-library-evolution \
    -F "$uts_foundation_dir" \
    -F "$runtime_dir" \
    -framework DCloudUTSFoundation \
    -framework DCloudUniappRuntime \
    -emit-module-path "$modules_dir/$module_suffix.swiftmodule" \
    -emit-module-interface-path "$modules_dir/$module_suffix.swiftinterface" \
    -emit-private-module-interface-path "$modules_dir/$module_suffix.private.swiftinterface" \
    -emit-objc-header \
    -emit-objc-header-path "$headers_dir/$FRAMEWORK_NAME-Swift.h" \
    -Xlinker -install_name \
    -Xlinker "@rpath/$FRAMEWORK_NAME.framework/$FRAMEWORK_NAME" \
    -o "$framework_dir/$FRAMEWORK_NAME"

  cat > "$headers_dir/$FRAMEWORK_NAME.h" <<EOF
#import <Foundation/Foundation.h>

//! Project version number for $FRAMEWORK_NAME.
FOUNDATION_EXPORT double ${FRAMEWORK_NAME}VersionNumber;

//! Project version string for $FRAMEWORK_NAME.
FOUNDATION_EXPORT const unsigned char ${FRAMEWORK_NAME}VersionString[];

#import <$FRAMEWORK_NAME/$FRAMEWORK_NAME-Swift.h>
EOF

  cat > "$framework_dir/Modules/module.modulemap" <<EOF
framework module $FRAMEWORK_NAME {
  umbrella header "$FRAMEWORK_NAME.h"
  export *
  module * { export * }
}
EOF

  cat > "$framework_dir/Info.plist" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>CFBundleDevelopmentRegion</key>
  <string>en</string>
  <key>CFBundleExecutable</key>
  <string>$FRAMEWORK_NAME</string>
  <key>CFBundleIdentifier</key>
  <string>com.example.$FRAMEWORK_NAME</string>
  <key>CFBundleInfoDictionaryVersion</key>
  <string>6.0</string>
  <key>CFBundleName</key>
  <string>$FRAMEWORK_NAME</string>
  <key>CFBundlePackageType</key>
  <string>FMWK</string>
  <key>CFBundleShortVersionString</key>
  <string>1.0.0</string>
  <key>CFBundleVersion</key>
  <string>1</string>
  <key>MinimumOSVersion</key>
  <string>12.0</string>
</dict>
</plist>
EOF
}

make_framework "ios-arm64" "arm64-apple-ios12.0" "iphoneos" "arm64-apple-ios" "ios-arm64"
make_framework "ios-arm64-simulator" "arm64-apple-ios12.0-simulator" "iphonesimulator" "arm64-apple-ios-simulator" "ios-arm64_x86_64-simulator"
make_framework "ios-x86_64-simulator" "x86_64-apple-ios12.0-simulator" "iphonesimulator" "x86_64-apple-ios-simulator" "ios-arm64_x86_64-simulator"

universal_simulator_dir="$BUILD_DIR/ios-arm64_x86_64-simulator/$FRAMEWORK_NAME.framework"
mkdir -p "$(dirname "$universal_simulator_dir")"
cp -R "$BUILD_DIR/ios-arm64-simulator/$FRAMEWORK_NAME.framework" "$universal_simulator_dir"
lipo -create \
  "$BUILD_DIR/ios-arm64-simulator/$FRAMEWORK_NAME.framework/$FRAMEWORK_NAME" \
  "$BUILD_DIR/ios-x86_64-simulator/$FRAMEWORK_NAME.framework/$FRAMEWORK_NAME" \
  -output "$universal_simulator_dir/$FRAMEWORK_NAME"
cp "$BUILD_DIR/ios-x86_64-simulator/$FRAMEWORK_NAME.framework/Modules/$FRAMEWORK_NAME.swiftmodule/"x86_64-apple-ios-simulator* \
  "$universal_simulator_dir/Modules/$FRAMEWORK_NAME.swiftmodule/"

xcodebuild -create-xcframework \
  -framework "$BUILD_DIR/ios-arm64/$FRAMEWORK_NAME.framework" \
  -framework "$universal_simulator_dir" \
  -output "$OUTPUT_XCFRAMEWORK"

echo "$OUTPUT_XCFRAMEWORK"
