import Foundation

@objcMembers
public final class NativeTestPluginBridge: NSObject {
    public static let pluginVersion = "1.0.0"

    public static func ping() -> String {
        return "NativeTestPlugin.framework is ready"
    }

    public static func info() -> [String: String] {
        return [
            "name": "NativeTestPlugin",
            "version": pluginVersion,
            "platform": "iOS"
        ]
    }
}
