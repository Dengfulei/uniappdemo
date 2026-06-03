# NativeUniModules

`NativeUniModules` packages the generated iOS UTS Swift files into a framework:

- `native-bridge-index.swift`
- `native-demo-index.swift`

Build from the repository root:

```sh
sh native-ios-project/NativeUniModules/build-xcframework.sh
```

The output is written to:

```text
native-ios-project/Frameworks/NativeUniModules.xcframework
```
