import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
@objc(UTSSDKModulesNativeBridgeNativeBridgeOptions)
@objcMembers
public class NativeBridgeOptions : NSObject, UTSObject {
    public var methodName: String!
    public var data: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "methodName":
                    self.methodName = try! utsSubscriptCheckValue(newValue)
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.methodName = obj["methodName"] as! String
        self.data = obj["data"] as! String
    }
}
@objc(UTSSDKModulesNativeBridgeNativeBridgeMessage)
@objcMembers
public class NativeBridgeMessage : NSObject, UTSObject {
    public var methodName: String!
    public var data: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "methodName":
                    self.methodName = try! utsSubscriptCheckValue(newValue)
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.methodName = obj["methodName"] as! String
        self.data = obj["data"] as! String
    }
}
public typealias OpenNativeBridge = (_ options: NativeBridgeOptions) -> Void
public typealias NativeBridgeMessageCallback = (_ message: NativeBridgeMessage) -> Void
public typealias OnNativeBridgeMessage = (_ callback: @escaping NativeBridgeMessageCallback) -> Void
public typealias OffNativeBridgeMessage = () -> Void
public var nativeBridgeEventName = "UniAppXNativeBridge"
public var uniAppXMessageEventName = "UniAppXNativeMessage"
public var openNativeBridge: OpenNativeBridge = {
(_ options: NativeBridgeOptions) -> Void in
if (options.methodName == "") {
    console.log("""
native-bridge ignored empty methodName
""")
    return
}
var notificationName = Notification.Name(nativeBridgeEventName)
var userInfo = Map<String, Any>()
userInfo.set("methodName", options.methodName!)
userInfo.set("data", options.data!)
NotificationCenter.default.post(name: notificationName, object: nil, userInfo: userInfo)
}
@objc(UTSSDKModulesNativeBridgeNativeBridgeMessageManager)
@objcMembers
public class NativeBridgeMessageManager : NSObject {
    public static var listener: NativeBridgeMessageCallback? = nil
    public static func addListener(_ callback: @escaping NativeBridgeMessageCallback) {
        self.listener = callback
        var notificationName = Notification.Name(uniAppXMessageEventName)
        var method = Selector("handleReceiveMessage:")
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
        NotificationCenter.default.addObserver(self, selector: method, name: notificationName, object: nil)
    }
    public static func removeListener() {
        var notificationName = Notification.Name(uniAppXMessageEventName)
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
        self.listener = nil
    }
    @objc
    public static func handleReceiveMessage(_ notification: Notification) {
        var userInfo = notification.userInfo
        if (userInfo == nil) {
            return
        }
        var message = NativeBridgeMessage(UTSJSONObject([
            "methodName": """
\(userInfo!["methodName"] ?? "")
""",
            "data": """
\(userInfo!["data"] ?? "")
"""
        ]))
        self.listener?(message)
    }
}
public var onNativeBridgeMessage: OnNativeBridgeMessage = {
(_ callback: @escaping NativeBridgeMessageCallback) -> Void in
NativeBridgeMessageManager.addListener(callback)
}
public var offNativeBridgeMessage: OffNativeBridgeMessage = {
() -> Void in
NativeBridgeMessageManager.removeListener()
}
@objc(UTSSDKModulesNativeBridgeNativeBridgeOptionsJSONObject)
@objcMembers
public class NativeBridgeOptionsJSONObject : NSObject {
    public var methodName: String!
    public var data: String!
}
public func openNativeBridgeByJs(_ options: NativeBridgeOptionsJSONObject) -> Void {
    return openNativeBridge(NativeBridgeOptions(UTSJSONObject([
        "methodName": options.methodName,
        "data": options.data
    ])))
}
public func onNativeBridgeMessageByJs(_ callback: UTSCallback) -> Void {
    return onNativeBridgeMessage({
    (message: NativeBridgeMessage) -> Void in
    callback(message)
    })
}
public func offNativeBridgeMessageByJs() -> Void {
    return offNativeBridgeMessage()
}
@objc(UTSSDKModulesNativeBridgeIndexSwift)
@objcMembers
public class UTSSDKModulesNativeBridgeIndexSwift : NSObject {
    public static func s_openNativeBridgeByJs(_ options: NativeBridgeOptionsJSONObject) -> Void {
        return openNativeBridgeByJs(options)
    }
    public static func s_onNativeBridgeMessageByJs(_ callback: UTSCallback) -> Void {
        return onNativeBridgeMessageByJs(callback)
    }
    public static func s_offNativeBridgeMessageByJs() -> Void {
        return offNativeBridgeMessageByJs()
    }
}
