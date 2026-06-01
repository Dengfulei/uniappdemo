import DCloudUTSFoundation
import DCloudUniappRuntime
import Dispatch
import Foundation
@_implementationOnly import Starscream
import Swift
@_implementationOnly import websocket
public typealias ConnectSocket = (_ options: ConnectSocketOptions) -> SocketTask
@objc(UTSSDKModulesDCloudUniWebsocketConnectSocketSuccess)
@objcMembers
public class ConnectSocketSuccess : NSObject, UTSObject {
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias ConnectSocketSuccessCallback = (_ result: ConnectSocketSuccess) -> Void
public typealias ConnectSocketErrorCode = NSNumber
public protocol ConnectSocketFail : IUniError {
    var errCode: ConnectSocketErrorCode { get set }
}
public typealias ConnectSocketFailCallback = (_ result: ConnectSocketFail) -> Void
public typealias ConnectSocketComplete = Any
public typealias ConnectSocketCompleteCallback = (_ result: ConnectSocketComplete) -> Void
@objc(UTSSDKModulesDCloudUniWebsocketConnectSocketOptions)
@objcMembers
public class ConnectSocketOptions : NSObject, UTSObject {
    public var url: String!
    public var header: UTSJSONObject?
    public var protocols: [String]?
    public var success: ConnectSocketSuccessCallback?
    public var fail: ConnectSocketFailCallback?
    public var complete: ConnectSocketCompleteCallback?
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
                case "protocols":
                    self.protocols = try! utsSubscriptCheckValueIfPresent(newValue)
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                case "complete":
                    self.complete = try! utsSubscriptCheckValueIfPresent(newValue)
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
        self.protocols = obj["protocols"] as! [String]?
        self.success = obj["success"] as! ConnectSocketSuccessCallback?
        self.fail = obj["fail"] as! ConnectSocketFailCallback?
        self.complete = obj["complete"] as! ConnectSocketCompleteCallback?
    }
}
@objc(UTSSDKModulesDCloudUniWebsocketGeneralCallbackResult)
@objcMembers
public class GeneralCallbackResult : NSObject, UTSObject {
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias SendSocketMessageErrorCode = NSNumber
public protocol SendSocketMessageFail : IUniError {
    var errCode: SendSocketMessageErrorCode { get set }
}
@objc(UTSSDKModulesDCloudUniWebsocketSendSocketMessageOptions)
@objcMembers
public class SendSocketMessageOptions : NSObject, UTSObject {
    public var data: Any!
    public var success: ((_ result: GeneralCallbackResult) -> Void)?
    public var fail: ((_ result: SendSocketMessageFail) -> Void)?
    public var complete: ((_ result: Any) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "data":
                    self.data = try! utsSubscriptCheckValue(newValue)
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                case "complete":
                    self.complete = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.data = obj["data"] as! Any
        self.success = obj["success"] as! ((_ result: GeneralCallbackResult) -> Void)?
        self.fail = obj["fail"] as! ((_ result: SendSocketMessageFail) -> Void)?
        self.complete = obj["complete"] as! ((_ result: Any) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniWebsocketCloseSocketOptions)
@objcMembers
public class CloseSocketOptions : NSObject, UTSObject {
    public var code: NSNumber?
    public var reason: String?
    public var success: ((_ result: GeneralCallbackResult) -> Void)?
    public var fail: ((_ result: GeneralCallbackResult) -> Void)?
    public var complete: ((_ result: GeneralCallbackResult) -> Void)?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "code":
                    self.code = try! utsSubscriptCheckValueIfPresent(newValue)
                case "reason":
                    self.reason = try! utsSubscriptCheckValueIfPresent(newValue)
                case "success":
                    self.success = try! utsSubscriptCheckValueIfPresent(newValue)
                case "fail":
                    self.fail = try! utsSubscriptCheckValueIfPresent(newValue)
                case "complete":
                    self.complete = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.code = obj["code"] as! NSNumber?
        self.reason = obj["reason"] as! String?
        self.success = obj["success"] as! ((_ result: GeneralCallbackResult) -> Void)?
        self.fail = obj["fail"] as! ((_ result: GeneralCallbackResult) -> Void)?
        self.complete = obj["complete"] as! ((_ result: GeneralCallbackResult) -> Void)?
    }
}
@objc(UTSSDKModulesDCloudUniWebsocketOnSocketOpenCallbackResult)
@objcMembers
public class OnSocketOpenCallbackResult : NSObject, UTSObject {
    public var header: Any!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "header":
                    self.header = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.header = obj["header"] as! Any
    }
}
@objc(UTSSDKModulesDCloudUniWebsocketOnSocketMessageCallbackResult)
@objcMembers
public class OnSocketMessageCallbackResult : NSObject, UTSObject {
    public var data: Any!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
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
        self.data = obj["data"] as! Any
    }
}
public protocol SocketTask {
    func send(_ options: SendSocketMessageOptions)
    func close(_ options: CloseSocketOptions)
    func onOpen(_ callback: @escaping (_ result: OnSocketOpenCallbackResult) -> Void)
    func onClose(_ callback: @escaping (_ result: Any) -> Void)
    func onError(_ callback: @escaping (_ result: GeneralCallbackResult) -> Void)
    func onMessage(_ callback: @escaping (_ result: OnSocketMessageCallbackResult) -> Void)
}
public typealias OnSocketOpenCallback = (_ result: OnSocketOpenCallbackResult) -> Void
@objc(UTSSDKModulesDCloudUniWebsocketOnSocketErrorCallbackResult)
@objcMembers
public class OnSocketErrorCallbackResult : NSObject, UTSObject {
    public var errMsg: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "errMsg":
                    self.errMsg = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.errMsg = obj["errMsg"] as! String
    }
}
public typealias OnSocketErrorCallback = (_ result: OnSocketErrorCallbackResult) -> Void
public typealias SendSocketMessage = (_ options: SendSocketMessageOptions) -> Void
public typealias OnSocketMessageCallback = (_ result: OnSocketMessageCallbackResult) -> Void
public typealias CloseSocket = (_ options: CloseSocketOptions) -> Void
@objc(UTSSDKModulesDCloudUniWebsocketOnSocketCloseCallbackResult)
@objcMembers
public class OnSocketCloseCallbackResult : NSObject, UTSObject {
    public var code: NSNumber!
    public var reason: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "code":
                    self.code = try! utsSubscriptCheckValue(newValue)
                case "reason":
                    self.reason = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.code = obj["code"] as! NSNumber
        self.reason = obj["reason"] as! String
    }
}
public typealias OnSocketCloseCallback = (_ result: OnSocketCloseCallbackResult) -> Void
public var UniWebsocketErrorSubject = "uni-websocket"
public var ConnectUniErrors: Map<ConnectSocketErrorCode, String> = Map([
    [
        600009,
        "invalid URL"
    ]
])
public var SendMessageUniErrors: Map<SendSocketMessageErrorCode, String> = Map([
    [
        10001,
        "The queue memory exceeds 16 MiB and the connection will be closed"
    ],
    [
        10002,
        "webSocket is not connected"
    ],
    [
        602001,
        "websocket system error"
    ]
])
@objc(UTSSDKModulesDCloudUniWebsocketConnectSocketFailImpl)
@objcMembers
public class ConnectSocketFailImpl : UniError, ConnectSocketFail {
    public init(_ errCode: ConnectSocketErrorCode){
        super.init()
        self.errSubject = UniWebsocketErrorSubject
        self.errCode = errCode
        self.errMsg = ConnectUniErrors[errCode] ?? ""
    }
}
@objc(UTSSDKModulesDCloudUniWebsocketSendSocketMessageFailImpl)
@objcMembers
public class SendSocketMessageFailImpl : UniError, SendSocketMessageFail {
    public init(_ errCode: SendSocketMessageErrorCode){
        super.init()
        self.errSubject = UniWebsocketErrorSubject
        self.errCode = errCode
        self.errMsg = SendMessageUniErrors[errCode] ?? ""
    }
}
@objc(UTSSDKModulesDCloudUniWebsocketSimpleSocketTask)
@objcMembers
public class SimpleSocketTask : NSObject, SocketTask {
    private var client: WebsockerClient? = nil
    private var openCallbacks: Array<(_ result: OnSocketOpenCallbackResult) -> Void> = []
    private var closeCallbacks: Array<(_ result: Any) -> Void> = []
    private var errorCallbacks: Array<(_ result: GeneralCallbackResult) -> Void> = []
    private var messageCallbacks: Array<(_ result: OnSocketMessageCallbackResult) -> Void> = []
    public init(_ client: WebsockerClient){
        self.client = client
    }
    public func dispatchOpen(_ options: OnSocketOpenCallbackResult) {
        do {
            var i: NSNumber = 0
            while(i < self.openCallbacks.length){
                var callback = self.openCallbacks[i]
                callback(options)
                i++
            }
        }
    }
    public func dispatchClose(_ options: Any) {
        do {
            var i: NSNumber = 0
            while(i < self.closeCallbacks.length){
                var callback = self.closeCallbacks[i]
                callback(options)
                i++
            }
        }
    }
    public func dispatchError(_ options: GeneralCallbackResult) {
        do {
            var i: NSNumber = 0
            while(i < self.errorCallbacks.length){
                var callback = self.errorCallbacks[i]
                callback(options)
                i++
            }
        }
    }
    public func dispatchMessage(_ options: OnSocketMessageCallbackResult) {
        do {
            var i: NSNumber = 0
            while(i < self.messageCallbacks.length){
                var callback = self.messageCallbacks[i]
                callback(options)
                i++
            }
        }
    }
    public func send(_ options: SendSocketMessageOptions) -> Void {
        if (self.client == nil) {
            var fail = options.fail
            var complete = options.complete
            var result = SendSocketMessageFailImpl(10002)
            fail?(result)
            complete?(result)
            return
        }
        self.client?.send(options)
    }
    public func close(_ options: CloseSocketOptions) -> Void {
        if (self.client == nil) {
            var fail = options.fail
            var complete = options.complete
            var result = GeneralCallbackResult(UTSJSONObject([
                "errMsg": "closeSocket:fail WebSocket is not connected"
            ]))
            fail?(result)
            complete?(result)
            return
        }
        self.client?.close(options)
    }
    public func onOpen(_ callback: @escaping (_ result: OnSocketOpenCallbackResult) -> Void) -> Void {
        self.openCallbacks.push(callback)
    }
    public func onClose(_ callback: @escaping (_ result: Any) -> Void) -> Void {
        self.closeCallbacks.push(callback)
    }
    public func onError(_ callback: @escaping (_ result: GeneralCallbackResult) -> Void) -> Void {
        self.errorCallbacks.push(callback)
    }
    public func onMessage(_ callback: @escaping (_ result: OnSocketMessageCallbackResult) -> Void) -> Void {
        self.messageCallbacks.push(callback)
    }
}
public protocol WebSocketManagerListener {
    func onOpen(_ client: WebsockerClient, _ header: Any)
    func onMessage(_ client: WebsockerClient, _ data: Any)
    func onClose(_ client: WebsockerClient, _ code: NSNumber, _ reason: String)
    func onError(_ client: WebsockerClient, _ msg: String)
}
@objc(UTSSDKModulesDCloudUniWebsocketWebsockerClient)
@objcMembers
public class WebsockerClient : NSObject {
    private var listener: WebSocketManagerListener? = nil
    private var options: ConnectSocketOptions? = nil
    private var websocketDelegate: WebsocketDelegate = WebsocketDelegate()
    private var websocketListener: SimpleWebsocketListener? = nil
    private var websocket: WebSocket? = nil
    public init(_ options: ConnectSocketOptions, _ listener: WebSocketManagerListener){
        self.options = options
        self.listener = listener
    }
    public func connect() {
        var kParam = self.options
        if (kParam != nil) {
            var request = self.createRequest(kParam!)
            if (request == nil) {
                return
            }
            self.websocket = WebSocket(request: request!)
            self.websocket!.callbackQueue = DispatchQueue(label: "io.dcloud.websocket")
            self.websocketListener = SimpleWebsocketListener(self.listener!, self.websocketDelegate, self)
            self.websocket!.delegate = self.websocketListener
            setTimeout({
            () -> Void in
            self.websocket!.connect()
            }, 100)
        }
    }
    public func send(_ options: SendSocketMessageOptions) {
        var success = options.success
        var fail = options.fail
        var complete = options.complete
        if (self.websocketDelegate.websocket == nil) {
            var result = SendSocketMessageFailImpl(10002)
            fail?(result)
            complete?(result)
            return
        }
        if (UTSiOS.instanceof(options.data, ArrayBuffer.self)) {
            var arrayBuffer = options.data as! ArrayBuffer
            self.websocketDelegate.websocket?.write(data: arrayBuffer.toData())
        } else {
            self.websocketDelegate.websocket?.write(string: options.data as! String)
        }
        var result = GeneralCallbackResult(UTSJSONObject([
            "errMsg": "sendSocketMessage:ok"
        ]))
        success?(result)
        complete?(result)
    }
    public func close(_ options: CloseSocketOptions) {
        var success = options.success
        var fail = options.fail
        var complete = options.complete
        if (self.websocketDelegate.websocket == nil) {
            var result = GeneralCallbackResult(UTSJSONObject([
                "errMsg": "closeSocket:fail WebSocket is not connected"
            ]))
            fail?(result)
            complete?(result)
            return
        }
        var code: UInt16 = 1000
        if (options.code != nil) {
            code = options.code!.toUInt16()
        }
        self.websocketDelegate.websocket?.disconnect(closeCode: code)
        var result = GeneralCallbackResult(UTSJSONObject([
            "errMsg": "closeSocket:ok"
        ]))
        success?(result)
        complete?(result)
    }
    private func createRequest(_ options: ConnectSocketOptions) -> URLRequest? {
        var request: URLRequest? = nil
        var url = URL(string: options.url)
        if (url == nil) {
            var option = ConnectSocketFailImpl(600009)
            var listener = options.fail
            listener?(option)
            return nil
        } else {
            request = URLRequest(url: url!)
        }
        var protocols = options.protocols
        if (protocols != nil) {
            var protocolsStr = protocols!.join(",")
            request?.addValue(protocolsStr, forHTTPHeaderField: "Sec-WebSocket-Protocol")
        }
        var header = options.header
        var hasOrigin = false
        if (header != nil) {
            var map = header!.toMap()
            if (map != nil) {
                for entry in resolveUTSKeyIterator(map){
                    var key = entry.key
                    var value = entry.value
                    if (key.caseInsensitiveCompare("Origin") == ComparisonResult.orderedSame) {
                        hasOrigin = true
                    }
                    request?.addValue("""
\(value)
""", forHTTPHeaderField: key)
                }
            }
        }
        if (!hasOrigin) {
            request?.addValue("http://localhost", forHTTPHeaderField: "Origin")
        }
        return request
    }
}
@objc(UTSSDKModulesDCloudUniWebsocketWebSocketManager)
@objcMembers
public class WebSocketManager : NSObject, WebSocketManagerListener {
    private static var instance: WebSocketManager? = nil
    private var socketTasks: [SimpleSocketTask] = []
    private var taskMap: Map<WebsockerClient, SimpleSocketTask> = Map<WebsockerClient, SimpleSocketTask>()
    private var openCallback: OnSocketOpenCallback? = nil
    private var messageCallback: OnSocketMessageCallback? = nil
    private var closeCallback: OnSocketCloseCallback? = nil
    private var errorCallback: OnSocketErrorCallback? = nil
    public static func getInstance() -> WebSocketManager {
        if (self.instance == nil) {
            self.instance = WebSocketManager()
        }
        return self.instance!
    }
    public func connectSocket(_ options: ConnectSocketOptions) -> SocketTask {
        var webscoketClient = WebsockerClient(options, self)
        var task = SimpleSocketTask(webscoketClient)
        self.taskMap.set(webscoketClient, task)
        self.socketTasks.push(task)
        var success = options.success
        var complete = options.complete
        var result = ConnectSocketSuccess(UTSJSONObject([
            "errMsg": "connectSocket:ok"
        ]))
        success?(result)
        complete?(result)
        webscoketClient.connect()
        return task
    }
    public func sendSocketMessage(_ options: SendSocketMessageOptions) -> Void {
        if (self.socketTasks.length > 0) {
            var task = self.socketTasks[0]
            task.send(options)
        } else {
            var fail = options.fail
            var complete = options.complete
            var result = SendSocketMessageFailImpl(10002)
            fail?(result)
            complete?(result)
        }
    }
    public func closeSocket(_ options: CloseSocketOptions) -> Void {
        if (self.socketTasks.length > 0) {
            var task = self.socketTasks[0]
            task.close(options)
        } else {
            var fail = options.fail
            var complete = options.complete
            var result = GeneralCallbackResult(UTSJSONObject([
                "errMsg": "closeSocket:fail WebSocket is not connected"
            ]))
            fail?(result)
            complete?(result)
        }
    }
    public func onSocketOpen(_ callback: @escaping OnSocketOpenCallback) -> Void {
        self.openCallback = callback
    }
    public func onSocketError(_ callback: @escaping OnSocketErrorCallback) -> Void {
        self.errorCallback = callback
    }
    public func onSocketClose(_ callback: @escaping OnSocketCloseCallback) -> Void {
        self.closeCallback = callback
    }
    public func onSocketMessage(_ callback: @escaping OnSocketMessageCallback) -> Void {
        self.messageCallback = callback
    }
    public func getTaskWithClient(_ client: WebsockerClient) -> SimpleSocketTask? {
        return self.taskMap.get(client)
    }
    public func onOpen(_ client: WebsockerClient, _ header: Any) -> Void {
        var task = self.getTaskWithClient(client)
        if (task == nil) {
            return
        }
        var result = OnSocketOpenCallbackResult(UTSJSONObject([
            "header": header
        ]))
        var openCallback = self.openCallback
        if (self.socketTasks.length > 0 && task == self.socketTasks[0] && openCallback != nil) {
            openCallback?(result)
        }
        var simpleTask = task as! SimpleSocketTask
        simpleTask.dispatchOpen(result)
    }
    public func onMessage(_ client: WebsockerClient, _ data: Any) -> Void {
        var task = self.getTaskWithClient(client)
        if (task == nil) {
            return
        }
        var result = OnSocketMessageCallbackResult(UTSJSONObject([
            "data": data
        ]))
        var messageCallback = self.messageCallback
        if (self.socketTasks.length > 0 && (task == self.socketTasks[0]) && messageCallback != nil) {
            messageCallback?(result)
        }
        var simpleTask = task as! SimpleSocketTask
        simpleTask.dispatchMessage(result)
    }
    public func onClose(_ client: WebsockerClient, _ code: NSNumber, _ reason: String) -> Void {
        var task = self.getTaskWithClient(client)
        if (task == nil) {
            return
        }
        var result = OnSocketCloseCallbackResult(UTSJSONObject([
            "code": code,
            "reason": reason
        ]))
        var closeCallback = self.closeCallback
        if (self.socketTasks.length > 0 && task == self.socketTasks[0] && closeCallback != nil) {
            closeCallback?(result)
        }
        var index = self.socketTasks.indexOf(task!)
        self.socketTasks.splice(index, 1)
        var simpleTask = task as! SimpleSocketTask
        simpleTask.dispatchClose(result)
        self.taskMap.delete(client)
    }
    public func onError(_ client: WebsockerClient, _ msg: String) -> Void {
        var task = self.getTaskWithClient(client)
        if (task == nil) {
            return
        }
        var errorCallback = self.errorCallback
        if (self.socketTasks.length > 0 && task == self.socketTasks[0] && errorCallback != nil) {
            var result = OnSocketErrorCallbackResult(UTSJSONObject([
                "errMsg": msg
            ]))
            errorCallback?(result)
        }
        var index = self.socketTasks.indexOf(task!)
        self.socketTasks.splice(index, 1)
        var result = GeneralCallbackResult(UTSJSONObject([
            "errMsg": msg
        ]))
        var simpleTask = task as! SimpleSocketTask
        simpleTask.dispatchError(result)
        self.taskMap.delete(client)
    }
}
@objc(UTSSDKModulesDCloudUniWebsocketWebsocketDelegate)
@objcMembers
public class WebsocketDelegate : NSObject {
    fileprivate var websocket: WebSocketClient? = nil
}
@objc(UTSSDKModulesDCloudUniWebsocketRunnableTask)
@objcMembers
public class RunnableTask : NSObject {
    private var callback: (() -> Void)?
    private var looper: RunLoop? = nil
    public init(_ looper: RunLoop?, _ callback: @escaping () -> Void){
        self.looper = looper
        self.callback = callback
    }
    public func execute() {
        if (self.looper == nil || self.looper!.currentMode == nil) {
            self.callback?()
        } else {
            self.looper?.perform(inModes: [
                RunLoop.Mode.common
            ], block: {
            () -> Void in
            self.callback?()
            })
        }
    }
}
@objc(UTSSDKModulesDCloudUniWebsocketSimpleWebsocketListener)
@objcMembers
private class SimpleWebsocketListener : WebSocketListener {
    private var listener: WebSocketManagerListener? = nil
    private var websocketDelegate: WebsocketDelegate? = nil
    private var client: WebsockerClient? = nil
    private weak var looper: RunLoop? = nil
    public init(_ listener: WebSocketManagerListener, _ delegate: WebsocketDelegate, _ client: WebsockerClient){
        super.init()
        self.listener = listener
        self.websocketDelegate = delegate
        self.client = client
        self.looper = RunLoop.current
    }
    public override func onOpen(_ webSocket: WebSocketClient, _ headers: Map<String, String>) -> Void {
        RunnableTask(self.looper, {
        () -> Void in
        var delegate = self.websocketDelegate
        if (delegate != nil) {
            delegate!.websocket = webSocket
        }
        var client = self.client
        if (client != nil) {
            self.listener?.onOpen(client!, headers)
        }
        }).execute()
    }
    public override func onMessage(_ webSocket: WebSocketClient, _ data: Data) -> Void {
        RunnableTask(self.looper, {
        () -> Void in
        var client = self.client
        if (client != nil) {
            self.listener?.onMessage(client!, ArrayBuffer.fromData(data))
        }
        }).execute()
    }
    public override func onMessage(_ webSocket: WebSocketClient, _ text: String) -> Void {
        RunnableTask(self.looper, {
        () -> Void in
        var client = self.client
        if (client != nil) {
            self.listener?.onMessage(client!, text)
        }
        }).execute()
    }
    public override func onClosed(_ webSocket: WebSocketClient, _ code: Int, _ reason: String) -> Void {
        RunnableTask(self.looper, {
        () -> Void in
        var delegate = self.websocketDelegate
        if (delegate != nil) {
            delegate!.websocket = nil
        }
        var client = self.client
        if (client != nil) {
            self.listener?.onClose(client!, NSNumber.from(code), reason)
        }
        }).execute()
    }
    public override func onPeerClosed(_ webSocket: WebSocketClient) {
        self.onClosed(webSocket, 1000, "CLOSE_NORMAL")
    }
    public override func onCancelled(_ webSocket: WebSocketClient) {
        self.onClosed(webSocket, 1000, "")
    }
    public override func onFailure(_ webSocket: WebSocketClient, _ err: Error?) -> Void {
        RunnableTask(self.looper, {
        () -> Void in
        var delegate = self.websocketDelegate
        if (delegate != nil) {
            delegate!.websocket = nil
        }
        var client = self.client
        if (client != nil) {
            self.listener?.onError(client!, err.debugDescription)
        }
        }).execute()
    }
}
public var connectSocket: ConnectSocket = {
(_ options: ConnectSocketOptions) -> SocketTask in
return WebSocketManager.getInstance().connectSocket(options)
}
public var sendSocketMessage: SendSocketMessage = {
(_ options: SendSocketMessageOptions) -> Void in
return WebSocketManager.getInstance().sendSocketMessage(options)
}
public var closeSocket: CloseSocket = {
(_ options: CloseSocketOptions) -> Void in
return WebSocketManager.getInstance().closeSocket(options)
}
public func onSocketOpen(_ callback: @escaping OnSocketOpenCallback) -> Void {
    return WebSocketManager.getInstance().onSocketOpen(callback)
}
public func onSocketMessage(_ callback: @escaping OnSocketMessageCallback) -> Void {
    return WebSocketManager.getInstance().onSocketMessage(callback)
}
public func onSocketClose(_ callback: @escaping OnSocketCloseCallback) -> Void {
    return WebSocketManager.getInstance().onSocketClose(callback)
}
public func onSocketError(_ callback: @escaping OnSocketErrorCallback) -> Void {
    return WebSocketManager.getInstance().onSocketError(callback)
}
@objc(UTSSDKModulesDCloudUniWebsocketConnectSocketOptionsJSONObject)
@objcMembers
public class ConnectSocketOptionsJSONObject : NSObject {
    public var url: String!
    public var header: UTSJSONObject?
    public var protocols: [String]?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniWebsocketSendSocketMessageOptionsJSONObject)
@objcMembers
public class SendSocketMessageOptionsJSONObject : NSObject {
    public var data: Any!
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
@objc(UTSSDKModulesDCloudUniWebsocketCloseSocketOptionsJSONObject)
@objcMembers
public class CloseSocketOptionsJSONObject : NSObject {
    public var code: NSNumber?
    public var reason: String?
    public var success: UTSCallback?
    public var fail: UTSCallback?
    public var complete: UTSCallback?
}
public func connectSocketByJs(_ options: ConnectSocketOptionsJSONObject) -> Int {
    var ins = connectSocket(ConnectSocketOptions(UTSJSONObject([
        "url": options.url,
        "header": options.header,
        "protocols": options.protocols,
        "success": {
        (_ result: ConnectSocketSuccess) -> Void in
        options.success?(result)
        },
        "fail": {
        (_ result: ConnectSocketFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (_ result: ConnectSocketComplete) -> Void in
        options.complete?(result)
        }
    ])))
    return UTSBridge.registerJavaScriptClassInstance(SocketTaskByJsProxy(ins))
}
public func sendSocketMessageByJs(_ options: SendSocketMessageOptionsJSONObject) -> Void {
    return sendSocketMessage(SendSocketMessageOptions(UTSJSONObject([
        "data": options.data,
        "success": {
        (result: GeneralCallbackResult) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: SendSocketMessageFail) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: Any) -> Void in
        options.complete?(result)
        }
    ])))
}
public func closeSocketByJs(_ options: CloseSocketOptionsJSONObject) -> Void {
    return closeSocket(CloseSocketOptions(UTSJSONObject([
        "code": options.code,
        "reason": options.reason,
        "success": {
        (result: GeneralCallbackResult) -> Void in
        options.success?(result)
        },
        "fail": {
        (result: GeneralCallbackResult) -> Void in
        options.fail?(result)
        },
        "complete": {
        (result: GeneralCallbackResult) -> Void in
        options.complete?(result)
        }
    ])))
}
public func onSocketOpenByJs(_ callback: UTSCallback) -> Void {
    return onSocketOpen({
    (result: OnSocketOpenCallbackResult) -> Void in
    callback(result)
    })
}
public func onSocketMessageByJs(_ callback: UTSCallback) -> Void {
    return onSocketMessage({
    (result: OnSocketMessageCallbackResult) -> Void in
    callback(result)
    })
}
public func onSocketCloseByJs(_ callback: UTSCallback) -> Void {
    return onSocketClose({
    (result: OnSocketCloseCallbackResult) -> Void in
    callback(result)
    })
}
public func onSocketErrorByJs(_ callback: UTSCallback) -> Void {
    return onSocketError({
    (result: OnSocketErrorCallbackResult) -> Void in
    callback(result)
    })
}
@objc(UTSSDKModulesDCloudUniWebsocketSocketTaskByJsProxy)
@objcMembers
public class SocketTaskByJsProxy : NSObject {
    public var __instance: SocketTask
    public init(_ ins: SocketTask){
        __instance = ins
    }
    public func sendByJs(_ options: SendSocketMessageOptionsJSONObject) -> Void {
        return __instance.send(SendSocketMessageOptions(UTSJSONObject([
            "data": options.data,
            "success": {
            (result: GeneralCallbackResult) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: SendSocketMessageFail) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: Any) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func closeByJs(_ options: CloseSocketOptionsJSONObject) -> Void {
        return __instance.close(CloseSocketOptions(UTSJSONObject([
            "code": options.code,
            "reason": options.reason,
            "success": {
            (result: GeneralCallbackResult) -> Void in
            options.success?(result)
            },
            "fail": {
            (result: GeneralCallbackResult) -> Void in
            options.fail?(result)
            },
            "complete": {
            (result: GeneralCallbackResult) -> Void in
            options.complete?(result)
            }
        ])))
    }
    public func onOpenByJs(_ callback: UTSCallback) -> Void {
        return __instance.onOpen({
        (result: OnSocketOpenCallbackResult) -> Void in
        callback(result)
        })
    }
    public func onCloseByJs(_ callback: UTSCallback) -> Void {
        return __instance.onClose({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onErrorByJs(_ callback: UTSCallback) -> Void {
        return __instance.onError({
        (result: GeneralCallbackResult) -> Void in
        callback(result)
        })
    }
    public func onMessageByJs(_ callback: UTSCallback) -> Void {
        return __instance.onMessage({
        (result: OnSocketMessageCallbackResult) -> Void in
        callback(result)
        })
    }
}
@objc(UTSSDKModulesDCloudUniWebsocketIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniWebsocketIndexSwift : NSObject {
    public static func s_connectSocketByJs(_ options: ConnectSocketOptionsJSONObject) -> Int {
        return connectSocketByJs(options)
    }
    public static func s_sendSocketMessageByJs(_ options: SendSocketMessageOptionsJSONObject) -> Void {
        return sendSocketMessageByJs(options)
    }
    public static func s_closeSocketByJs(_ options: CloseSocketOptionsJSONObject) -> Void {
        return closeSocketByJs(options)
    }
    public static func s_onSocketOpenByJs(_ callback: UTSCallback) -> Void {
        return onSocketOpenByJs(callback)
    }
    public static func s_onSocketMessageByJs(_ callback: UTSCallback) -> Void {
        return onSocketMessageByJs(callback)
    }
    public static func s_onSocketCloseByJs(_ callback: UTSCallback) -> Void {
        return onSocketCloseByJs(callback)
    }
    public static func s_onSocketErrorByJs(_ callback: UTSCallback) -> Void {
        return onSocketErrorByJs(callback)
    }
}
