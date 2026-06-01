# native-demo

This is a minimal uni-app x UTS plugin that demonstrates calling native APIs from a page on iOS, Android, and HarmonyOS.

## Call Flow

1. The page imports functions from `@/uni_modules/native-demo`.
2. uni-app x selects the platform implementation under `utssdk/app-ios`, `utssdk/app-android`, or `utssdk/app-harmony`.
3. Each UTS implementation calls the current platform's native APIs.

## APIs

- `getNativeDemoInfo()`: returns current platform and device information.
- `copyNativeDemoText(text)`: writes text to the system clipboard.
- `openNativeAlbum(callback)`: opens the system album and returns open/select/cancel status through the callback.

## Page Usage

```ts
import { copyNativeDemoText, getNativeDemoInfo, openNativeAlbum } from '@/uni_modules/native-demo'

const info = getNativeDemoInfo()
copyNativeDemoText(`${info.systemName} ${info.systemVersion}`)

openNativeAlbum((result) => {
  console.log(`${result.action}: ${result.message}`)
})
```

For offline native packaging, regenerate local-pack resources in HBuilderX so the compiled plugin output is refreshed under `unpackage/resources/app-ios`, `unpackage/resources/app-android`, or `unpackage/resources/app-harmony`.
