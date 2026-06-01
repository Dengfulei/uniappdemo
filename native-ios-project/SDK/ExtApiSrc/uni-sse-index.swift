import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
@objc(UTSSDKModulesDCloudUniSseConnectEventSourceOptions)
@objcMembers
public class ConnectEventSourceOptions : NSObject, UTSObject {
    public var url: String!
    public var header: UTSJSONObject?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "url":
                    self.url = try! utsSubscriptCheckValue(newValue)
                case "header":
                    self.header = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.url = obj["url"] as! String
        self.header = obj["header"] as! UTSJSONObject?
    }
}
public typealias ConnectEventSourceCallback = (_ ev: UniMessageEvent) -> Void
public typealias ConnectEventSourceErrorCallback = (_ error: UniError) -> Void
public typealias ConnectEventSource = (_ options: ConnectEventSourceOptions) -> UniEventSource
public protocol UniEventSource {
    func onMessage(_ callback: @escaping ConnectEventSourceCallback)
    func onError(_ callback: @escaping ConnectEventSourceErrorCallback)
    func onOpen(_ callback: @escaping ConnectEventSourceCallback)
    func close()
}
@objc(UTSSDKModulesDCloudUniSseUniMessageEvent)
@objcMembers
public class UniMessageEvent : NSObject {
    public var type: String? = nil
    public var data: Any? = nil
    public var lastEventId: String? = nil
}
public var connectEventSource: ConnectEventSource = {
(_ options: ConnectEventSourceOptions) -> UniEventSource in
return UniEventSourceImpl(options.url, options.header)
}
@objc(UTSSDKModulesDCloudUniSseMessageEventHandler)
@objcMembers
public class MessageEventHandler : NSObject {
    public override init(){}
    public var message: ConnectEventSourceCallback? = nil
    public var error: ConnectEventSourceErrorCallback? = nil
    public var `open`: ConnectEventSourceCallback? = nil
    public var close: ConnectEventSourceCallback? = nil
}
@objc(UTSSDKModulesDCloudUniSseUniEventSourceImpl)
@objcMembers
public class UniEventSourceImpl : NSObject, UniEventSource {
    private var connectUrl: String
    private var headers: UTSJSONObject? = nil
    private var messageEventHandler: MessageEventHandler = MessageEventHandler()
    private var eventSource: EventSource? = nil
    public init(_ url: String, _ headers: UTSJSONObject?){
        self.connectUrl = url
        super.init()
        self.headers = headers
        var tmpUrl = URL(string: self.connectUrl)
        var map = Map<String, String>()
        if (tmpUrl != nil) {
            self.eventSource = EventSource(url: tmpUrl!, headers: self.headers?.toMap() ?? map)
            self.connect()
            self.eventAction()
        }
    }
    public func onMessage(_ callback: @escaping ConnectEventSourceCallback) -> Void {
        self.messageEventHandler.message = callback
    }
    public func onError(_ callback: @escaping ConnectEventSourceErrorCallback) -> Void {
        self.messageEventHandler.error = callback
    }
    public func onOpen(_ callback: @escaping ConnectEventSourceCallback) -> Void {
        self.messageEventHandler.open = callback
    }
    public func close() -> Void {
        self.eventSource?.disconnect()
        self.messageEventHandler.close?(self.constructorEvent("close"))
    }
    private func connect() {
        self.eventSource?.connect()
    }
    private func eventAction() {
        self.eventSource?.onOpen({
        () -> Void in
        self.messageEventHandler.open?(self.constructorEvent("open"))
        })
        self.eventSource?.onComplete({
        (errCode: Int?, reconnect: Bool?, error: Error?) -> Void in
        if (self.eventSource?.readyState != EventSourceState.closed) {
            var err = UniError()
            err.errCode = NSNumber(errCode ?? 0)
            if (error != nil) {
                err.errMsg = error!.localizedDescription
            }
            self.messageEventHandler.error?(err)
        }
        })
        self.eventSource?.onMessage({
        (id: String?, event: String?, data: String?) -> Void in
        var tempType = ""
        if (event != nil) {
            tempType = event!
        }
        var ev = self.constructorEvent(tempType)
        ev.data = data
        ev.lastEventId = id
        self.messageEventHandler.message?(ev)
        })
    }
    private func constructorEvent(_ type: String) -> UniMessageEvent {
        var event = UniMessageEvent()
        event.type = type
        return event
    }
}
@objc(UTSSDKModulesDCloudUniSseConnectEventSourceOptionsJSONObject)
@objcMembers
public class ConnectEventSourceOptionsJSONObject : NSObject {
    public var url: String!
    public var header: UTSJSONObject?
}
public func connectEventSourceByJs(_ options: ConnectEventSourceOptionsJSONObject) -> Int {
    var ins = connectEventSource(ConnectEventSourceOptions(UTSJSONObject([
        "url": options.url,
        "header": options.header
    ])))
    return UTSBridge.registerJavaScriptClassInstance(UniEventSourceByJsProxy(ins))
}
@objc(UTSSDKModulesDCloudUniSseUniEventSourceByJsProxy)
@objcMembers
public class UniEventSourceByJsProxy : NSObject {
    public var __instance: UniEventSource
    public init(_ ins: UniEventSource){
        __instance = ins
    }
    public func onMessageByJs(_ callback: UTSCallback) -> Void {
        return __instance.onMessage({
        (ev: UniMessageEvent) -> Void in
        callback(ev)
        })
    }
    public func onErrorByJs(_ callback: UTSCallback) -> Void {
        return __instance.onError({
        (error: UniError) -> Void in
        callback(error)
        })
    }
    public func onOpenByJs(_ callback: UTSCallback) -> Void {
        return __instance.onOpen({
        (ev: UniMessageEvent) -> Void in
        callback(ev)
        })
    }
    public func closeByJs() -> Void {
        return __instance.close()
    }
}
@objc(UTSSDKModulesDCloudUniSseIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniSseIndexSwift : NSObject {
    public static func s_connectEventSourceByJs(_ options: ConnectEventSourceOptionsJSONObject) -> Int {
        return connectEventSourceByJs(options)
    }
}
