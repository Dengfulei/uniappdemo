# UniAppX iOS Native Project

This directory contains the iOS native host project for the `uniappdemo` uni-app x app.

## Source

The project is based on DCloud's official `UniAppX-iOS@5.07` native SDK demo project (`UniAppXDemo`). The app resources were replaced with the current project's iOS local-pack resources:

- AppID: `__UNI__35453D1`
- Runtime version in `Info.plist`: `5.07`
- App resources: `UniAppXDemo/uni-app-x/apps/__UNI__35453D1`
- UTS plugin resources: `UniAppXDemo/uni-app-x/uni_modules`
- iOS UTS demo plugin source: `../uni_modules/native-demo`
- iOS UTS demo generated Swift sample: `UniAppXDemo/uni-app-x/uni_modules/native-demo/utssdk/app-ios/src/native-demo-index.swift`

Official references:

- https://doc.dcloud.net.cn/uni-app-x/native/download/ios.html
- https://doc.dcloud.net.cn/uni-app-x/native/use/ios.html

## Open

Open `UniAppXDemo.xcodeproj` or `UniAppXDemo.xcworkspace` in Xcode and run the `UniAppX` scheme.

## Refresh uni-app x resources

After regenerating local-pack iOS resources from HBuilderX, sync them with:

```sh
rm -rf native-ios-project/UniAppXDemo/uni-app-x/apps native-ios-project/UniAppXDemo/uni-app-x/uni_modules
mkdir -p native-ios-project/UniAppXDemo/uni-app-x/apps native-ios-project/UniAppXDemo/uni-app-x/uni_modules
rsync -a --exclude='.DS_Store' unpackage/resources/app-ios/__UNI__35453D1 native-ios-project/UniAppXDemo/uni-app-x/apps/
rsync -a --exclude='.DS_Store' unpackage/resources/app-ios/uni_modules/ native-ios-project/UniAppXDemo/uni-app-x/uni_modules/
```

## Verification

This project was verified with:

```sh
xcodebuild -list -project native-ios-project/UniAppXDemo.xcodeproj
xcodebuild -project native-ios-project/UniAppXDemo.xcodeproj -scheme UniAppX -configuration Debug -sdk iphonesimulator -derivedDataPath /tmp/uniappdemo-ios-derived CODE_SIGNING_ALLOWED=NO build
```
