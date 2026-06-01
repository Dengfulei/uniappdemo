# HarmonyUniAppXVerify

这是一个用于验证 uni-app x 鸿蒙原生 SDK 集成的 DevEco Studio 工程。

## 已接入内容

- `@dcloudio/uni-app-x-runtime` 运行时依赖
- `uniappdemo` 导出的 Harmony 本地打包资源
- 启动鸿蒙原生工程后自动进入 uni-app x
- 工程 SDK 版本对齐本机 DevEco Studio 6.0.2 / API 22

说明：当前导出的 uni-app x 资源标记 `compilerVersion` 为 `5.07`，工程依赖已升级到 ohpm 官方仓库当前可用的 5.x runtime：`@dcloudio/uni-app-x-runtime@5.0.32026031301`。DCloud 文档要求 runtime 版本与导出资源使用的 HBuilderX 版本对应，避免 4.71 runtime 加载 5.x 资源导致运行时异常。

## 打开方式

1. 使用 DevEco Studio 打开当前目录。
2. 点击 `Sync Now` 安装 ohpm 依赖。
3. 运行 `entry` 模块。
4. App 启动后会自动进入 uni-app x 首页。

当前接入的 uni-app x AppID 是 `__UNI__35453D1`。

## 当前修改状态

- 已删除原生测试 UI、`ProductDetailAbility` 和 `native-bridge` 测试插件配置，保留无 UI 的 `pages/Index` 作为官方启动链路中的空白启动壳。
- 已重新导出并同步 `uniappdemo` 的 Harmony 本地打包资源。
- 已执行 `ohpm install`，依赖中只保留 `@dcloudio/uni-app-x-runtime`。
- 已在 DevEco Studio 中完成 Sync，`Ohpm Install` 和 `Build Init` 均成功。
- 已执行新的 HAP 构建校验，构建成功；尚未执行真机安装运行。
