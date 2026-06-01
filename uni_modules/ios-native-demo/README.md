# ios-native-demo

This is a minimal uni-app x UTS plugin that demonstrates calling iOS native APIs from a page.

## Call Flow

1. The page imports functions from `@/uni_modules/ios-native-demo`.
2. The plugin's `utssdk/app-ios/index.uts` implementation is used on iOS.
3. The UTS implementation calls iOS native APIs from `UIKit` and `Foundation`.

## APIs

- `getIosNativeDemoInfo()`: returns information from `UIDevice.current`.
- `copyIosNativeDemoText(text)`: writes text to `UIPasteboard.general`.

## Page Usage

```ts
import { getIosNativeDemoInfo, copyIosNativeDemoText } from '@/uni_modules/ios-native-demo'

const info = getIosNativeDemoInfo()
copyIosNativeDemoText(`${info.systemName} ${info.systemVersion}`)
```

For offline native packaging, regenerate iOS local-pack resources in HBuilderX so the compiled plugin output is refreshed under `unpackage/resources/app-ios/uni_modules`.
