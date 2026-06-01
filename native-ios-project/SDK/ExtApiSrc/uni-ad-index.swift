@_implementationOnly import DCUniAdFoundation
import DCloudUTSFoundation
import DCloudUniappRuntime
import Foundation
import UIKit
@objc(UTSSDKModulesDCloudUniAdUrlCallbackOptions)
@objcMembers
public class UrlCallbackOptions : NSObject, UTSObject {
    public var userId: String?
    public var extra: String?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "userId":
                    self.userId = try! utsSubscriptCheckValueIfPresent(newValue)
                case "extra":
                    self.extra = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.userId = obj["userId"] as! String?
        self.extra = obj["extra"] as! String?
    }
}
@objc(UTSSDKModulesDCloudUniAdCreateInterstitialAdOptions)
@objcMembers
public class CreateInterstitialAdOptions : NSObject, UTSObject {
    public var adpid: String!
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "adpid":
                    self.adpid = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.adpid = obj["adpid"] as! String
    }
}
@objc(UTSSDKModulesDCloudUniAdCreateRewardedVideoAdOptions)
@objcMembers
public class CreateRewardedVideoAdOptions : NSObject, UTSObject {
    public var adpid: String!
    public var urlCallback: UrlCallbackOptions?
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "adpid":
                    self.adpid = try! utsSubscriptCheckValue(newValue)
                case "urlCallback":
                    self.urlCallback = try! utsSubscriptCheckValueIfPresent(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.adpid = obj["adpid"] as! String
        self.urlCallback = obj["urlCallback"] as! UrlCallbackOptions?
    }
}
public protocol RewardedVideoAd : IVideoAd, IRewardedVideoAd {
}
public protocol InterstitialAd {
    func show() -> UTSPromise<Any>
    func load() -> UTSPromise<Any>
    func destroy()
    func onLoad(_ callback: @escaping AdCallBackEvent)
    func offLoad(_ callback: @escaping AdCallBackEvent)
    func onError(_ callback: @escaping AdErrorCallBackEvent)
    func offError(_ callback: @escaping AdErrorCallBackEvent)
    func onClose(_ callback: @escaping AdCallBackEvent)
    func offClose(_ callback: @escaping AdCallBackEvent)
    func onAdClicked(_ callback: @escaping AdCallBackEvent)
}
public protocol IVideoAd {
    func show() -> UTSPromise<Any>
    func load() -> UTSPromise<Any>
    func destroy()
    func onLoad(_ callback: @escaping AdCallBackEvent)
    func offLoad(_ callback: @escaping AdCallBackEvent)
    func onError(_ callback: @escaping AdErrorCallBackEvent)
    func offError(_ callback: @escaping AdErrorCallBackEvent)
    func onClose(_ callback: @escaping AdCloseCallBackEvent)
    func offClose(_ callback: @escaping AdCloseCallBackEvent)
    func onAdClicked(_ callback: @escaping AdCallBackEvent)
}
public protocol IRewardedVideoAd {
    func onVerify(_ callback: @escaping AdVerifyCallBackEvent)
}
@objc(UTSSDKModulesDCloudUniAdVideoAdClose)
@objcMembers
public class VideoAdClose : NSObject, UTSObject {
    public var isEnded: Bool = false
    public subscript(_ key: String) -> Any? {
        get {
            return utsSubscriptGetValue(key)
        }
        set {
            switch(key){
                case "isEnded":
                    self.isEnded = try! utsSubscriptCheckValue(newValue)
                default:
                    break
            }
        }
    }
    public override init() {
        super.init()
    }
    public init(_ obj: UTSJSONObject) {
        self.isEnded = obj["isEnded"] as! Bool
    }
}
public typealias RewardedVideoAdClose = VideoAdClose
public typealias UniAdErrorCode = NSNumber
public protocol IUniAdError : IUniError {
    var errCode: UniAdErrorCode { get set }
}
public typealias AdCallBackEvent = (_ result: Any) -> Void
public typealias AdCloseCallBackEvent = (_ result: RewardedVideoAdClose) -> Void
public typealias AdErrorCallBackEvent = (_ result: IUniAdError) -> Void
public typealias AdVerifyCallBackEvent = (_ result: UTSJSONObject) -> Void
public typealias CreateRewardedVideoAd = (_ option: CreateRewardedVideoAdOptions) -> RewardedVideoAd
public typealias CreateInterstitialAd = (_ option: CreateInterstitialAdOptions) -> InterstitialAd
public var UniError_CreateRewardedVideoAd = "uni-createRewardedVideoAd"
public var UniError_CreateInterstitialAd = "uni-createInterstitialAd"
public var UniError_AdComponent = ""
@objc(UTSSDKModulesDCloudUniAdUniAdErrorImpl)
@objcMembers
public class UniAdErrorImpl : UniError, IUniAdError {
    public init(_ errCode: UniAdErrorCode, _ errorMsg: String, _ causeError: UniAggregateError?){
        super.init()
        self.errCode = errCode
        self.errMsg = errorMsg
        self.cause = causeError
    }
}
@objc(UTSSDKModulesDCloudUniAdUniAdSourceError)
@objcMembers
public class UniAdSourceError : SourceError {
    public var platform: String
    public var slotId: String
    public init(_ code: NSNumber, _ message: String, _ platform: String, _ slotId: String){
        self.platform = platform
        self.slotId = slotId
        super.init()
        self.code = code
        self.message = message
    }
}
public protocol RewardAdListener {
    func _onShowError(_ code: NSNumber, _ message: String, _ detail: UniAggregateError?)
    func _onClick()
    func _onClose(_ result: Bool)
    func _onShow()
    func _onLoad()
    func _onLoadError(_ code: NSNumber, _ message: String, _ detail: UniAggregateError?)
    func _onVerify(_ result: UTSJSONObject)
}
@objc(UTSSDKModulesDCloudUniAdRewardVideoAdImpl)
@objcMembers
public class RewardVideoAdImpl : NSObject, RewardedVideoAd, RewardAdListener {
    private var option: CreateRewardedVideoAdOptions
    private var rewardAd: RewardVideoAdObj? = nil
    private var loadResolve: ((_ result: Any) -> Void)? = nil
    private var loadReject: ((_ result: Any) -> Void)? = nil
    private var showResolve: ((_ result: Any) -> Void)? = nil
    private var showReject: ((_ result: Any) -> Void)? = nil
    public var closeCB: AdCloseCallBackEvent? = nil
    public var clickCB: AdCallBackEvent? = nil
    public var loadCB: AdCallBackEvent? = nil
    public var errorCB: AdErrorCallBackEvent? = nil
    public var verifyCB: AdVerifyCallBackEvent? = nil
    public init(_ option: CreateRewardedVideoAdOptions){
        self.option = option
        super.init()
        self.createAd()
        self.setAdListener()
    }
    public func load() -> UTSPromise<Any> {
        return UTSPromise<Any>({
        (_ resolve, _ reject) -> Void in
        self.loadResolve = resolve
        self.loadReject = reject
        self.loadAd()
        })
    }
    public func show() -> UTSPromise<Any> {
        return UTSPromise<Any>({
        (_ resolve, _ reject) -> Void in
        self.showResolve = resolve
        self.showReject = reject
        self.showAd()
        })
    }
    public func destroy() {
        self.destroyAd()
    }
    public func onClose(_ callback: @escaping AdCloseCallBackEvent) -> Void {
        self.closeCB = callback
    }
    public func offClose(_ callback: @escaping AdCloseCallBackEvent) -> Void {
        self.closeCB = nil
    }
    public func onAdClicked(_ callback: @escaping AdCallBackEvent) -> Void {
        self.clickCB = callback
    }
    public func onLoad(_ callback: @escaping AdCallBackEvent) -> Void {
        self.loadCB = callback
    }
    public func offLoad(_ callback: @escaping AdCallBackEvent) -> Void {
        self.loadCB = nil
    }
    public func onError(_ callback: @escaping AdErrorCallBackEvent) -> Void {
        self.errorCB = callback
    }
    public func offError(_ callback: @escaping AdErrorCallBackEvent) -> Void {
        self.errorCB = nil
    }
    public func onVerify(_ callback: @escaping AdVerifyCallBackEvent) -> Void {
        self.verifyCB = callback
    }
    private func createAd() {
        self.rewardAd = RewardVideoAdObj(self.option)
    }
    private func setAdListener() {
        self.rewardAd?.setAdListener(self)
    }
    private func loadAd() {
        self.rewardAd?.load()
    }
    private func showAd() {
        self.rewardAd?.show()
    }
    private func destroyAd() {
        if (self.rewardAd != nil) {
            self.rewardAd = nil
        }
    }
    public func _onVerify(_ result: UTSJSONObject) -> Void {
        if (self.verifyCB != nil) {
            self.verifyCB!(result)
        }
    }
    public func _onShow() -> Void {
        if (self.showResolve != nil) {
            self.showResolve!(UTSJSONObject([:]))
            self.showResolve = nil
        }
    }
    public func _onClose(_ result: Bool) -> Void {
        var res = RewardedVideoAdClose(UTSJSONObject([
            "isEnded": result
        ]))
        if (self.closeCB != nil) {
            self.closeCB!(res)
        }
    }
    public func _onClick() -> Void {
        if (self.clickCB != nil) {
            self.clickCB!(UTSJSONObject([:]))
        }
    }
    public func _onShowError(_ code: NSNumber, _ message: String, _ detail: UniAggregateError?) -> Void {
        var error = UniAdErrorImpl(code, message, detail)
        error.errSubject = UniError_CreateRewardedVideoAd
        if (self.errorCB != nil) {
            self.errorCB!(error)
        }
        if (self.showReject != nil) {
            self.showReject!(error)
            self.showReject = nil
        }
    }
    public func _onLoadError(_ code: NSNumber, _ message: String, _ detail: UniAggregateError?) -> Void {
        var error = UniAdErrorImpl(code, message, detail)
        error.errSubject = UniError_CreateRewardedVideoAd
        if (self.errorCB != nil) {
            self.errorCB!(error)
        }
        if (self.loadReject != nil) {
            self.loadReject!(error)
            self.loadReject = nil
        }
    }
    public func _onLoad() -> Void {
        if (self.loadCB != nil) {
            self.loadCB!(UTSJSONObject([:]))
        }
        if (self.loadResolve != nil) {
            self.loadResolve!(UTSJSONObject([:]))
            self.loadResolve = nil
        }
    }
}
@objc(UTSSDKModulesDCloudUniAdRewardVideoAdObj)
@objcMembers
private class RewardVideoAdObj : NSObject, DCUniRewardVideoAdDelegate {
    private var ad: DCUniRewardedVideoAd? = nil
    private var option: CreateRewardedVideoAdOptions
    private var adCallback: RewardAdListener? = nil
    private var isVideoPlayEnd = false
    public init(_ option: CreateRewardedVideoAdOptions){
        self.option = option
    }
    public func setAdListener(_ impl: RewardAdListener) -> Void {
        self.adCallback = impl
    }
    public func load() {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.ad = DCUniRewardedVideoAd(slotID: self.option.adpid)
        if (self.option.urlCallback != nil) {
            var serverOptions = DCUniServerSideVerificationOptions()
            if (self.option.urlCallback!.userId != nil) {
                serverOptions.userIdentifier = self.option.urlCallback!.userId
            }
            if (self.option.urlCallback!.extra != nil) {
                serverOptions.extra = self.option.urlCallback!.extra
            }
            self.ad!.adOptions = serverOptions
        }
        self.ad!.delegate = self
        self.ad!.loadData()
        })
    }
    public func show() {
        if (Thread.isMainThread) {
            self.ad?.show(fromRootViewController: UTSiOS.getCurrentViewController())
        } else {
            DispatchQueue.main.async(execute: {
            () -> Void in
            self.ad?.show(fromRootViewController: UTSiOS.getCurrentViewController())
            })
        }
    }
    public func rewardVideoAdDidLoad(_ rewardVideoAd: DCUniRewardedVideoAd) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onLoad()
        })
    }
    public func rewardVideoAdDidLoad(_ rewardVideoAd: DCUniRewardedVideoAd, didFailWithError error: Error) {
        var array: Array<UTSError> = []
        if (error != nil) {
            var loadError: NSError = error as! NSError
            var userInfo: Map<String, Any> = loadError.userInfo
            if (userInfo.has("detail")) {
                var details: Array<Any> = userInfo.get("detail") as! Array<Any>
                do {
                    var i: NSNumber = 0
                    while(i < details.length){
                        var object: Map<String, Any> = details[i] as! Map<String, Any>
                        var slotId: String = object.get("id") as! String
                        var platform: String = object.get("p") as! String
                        var message: String = object.get("msg") as! String
                        var code: NSNumber = object.get("code") as! NSNumber
                        array.push(UniAdSourceError(code, message, platform, slotId))
                        i++
                    }
                }
            }
            DispatchQueue.main.async(execute: {
            () -> Void in
            self.adCallback?._onLoadError(NSNumber.from(loadError.code), loadError.localizedDescription, UniAggregateError(array))
            })
        }
    }
    public func rewardVideoAdDidVisible(_ rewardVideoAd: DCUniRewardedVideoAd) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onShow()
        })
    }
    public func rewardVideoAdDidPlayFinish(_ rewardVideoAd: DCUniRewardedVideoAd, didFailWithError error: Error?) {
        if (error != nil) {
            var showError: NSError = error as! NSError
            var codeNumber: NSNumber = NSNumber.from(showError.code)
            DispatchQueue.main.async(execute: {
            () -> Void in
            self.adCallback?._onShowError(codeNumber, showError.localizedDescription, nil)
            })
        } else {
            self.isVideoPlayEnd = true
        }
    }
    public func rewardVideoAdDidClicked(_ rewardVideoAd: DCUniRewardedVideoAd) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onClick()
        })
    }
    public func rewardVideoAdDidClose(_ rewardVideoAd: DCUniRewardedVideoAd) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onClose(self.isVideoPlayEnd)
        })
    }
    public func rewardVideoAdDidShowFailed(_ rewardVideoAd: DCUniRewardedVideoAd, error: Error) {
        var showError: NSError = error as! NSError
        var codeNumber: NSNumber = NSNumber.from(showError.code)
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onShowError(codeNumber, showError.localizedDescription, nil)
        })
    }
    public func rewardVideoAd(_ rewardVideoAd: DCUniRewardedVideoAd, reward: DCUniAdRewardInfo) {
        self.isVideoPlayEnd = true
        var rewardInfo: UTSJSONObject = UTSJSONObject([
            "provider": reward.provider
        ])
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onVerify(rewardInfo)
        })
    }
}
public protocol InterstitialAdListener {
    func _onShowError(_ code: NSNumber, _ message: String, _ detail: UniAggregateError?)
    func _onClick()
    func _onClose(_ result: Bool)
    func _onShow()
    func _onLoad()
    func _onLoadError(_ code: NSNumber, _ message: String, _ detail: UniAggregateError?)
}
@objc(UTSSDKModulesDCloudUniAdInterstitialAdImpl)
@objcMembers
public class InterstitialAdImpl : NSObject, InterstitialAd, InterstitialAdListener {
    private var option: CreateInterstitialAdOptions
    private var interstitialAd: InterstitialAdObj? = nil
    private var loadResolve: ((_ result: Any) -> Void)? = nil
    private var loadReject: ((_ result: Any) -> Void)? = nil
    private var showResolve: ((_ result: Any) -> Void)? = nil
    private var showReject: ((_ result: Any) -> Void)? = nil
    public var closeCB: AdCallBackEvent? = nil
    public var clickCB: AdCallBackEvent? = nil
    public var loadCB: AdCallBackEvent? = nil
    public var errorCB: AdErrorCallBackEvent? = nil
    public init(_ option: CreateInterstitialAdOptions){
        self.option = option
        super.init()
        self.createAd()
        self.setAdListener()
    }
    public func load() -> UTSPromise<Any> {
        return UTSPromise<Any>({
        (_ resolve, _ reject) -> Void in
        self.loadResolve = resolve
        self.loadReject = reject
        self.loadAd()
        })
    }
    public func show() -> UTSPromise<Any> {
        return UTSPromise<Any>({
        (_ resolve, _ reject) -> Void in
        self.showResolve = resolve
        self.showReject = reject
        self.showAd()
        })
    }
    public func destroy() {
        self.destroyAd()
    }
    public func onClose(_ callback: @escaping AdCallBackEvent) -> Void {
        self.closeCB = callback
    }
    public func offClose(_ callback: @escaping AdCallBackEvent) -> Void {
        self.closeCB = nil
    }
    public func onAdClicked(_ callback: @escaping AdCallBackEvent) -> Void {
        self.clickCB = callback
    }
    public func onLoad(_ callback: @escaping AdCallBackEvent) -> Void {
        self.loadCB = callback
    }
    public func offLoad(_ callback: @escaping AdCallBackEvent) -> Void {
        self.loadCB = nil
    }
    public func onError(_ callback: @escaping AdErrorCallBackEvent) -> Void {
        self.errorCB = callback
    }
    public func offError(_ callback: @escaping AdErrorCallBackEvent) -> Void {
        self.errorCB = nil
    }
    private func createAd() {
        self.interstitialAd = InterstitialAdObj(self.option)
    }
    private func setAdListener() {
        self.interstitialAd?.setAdListener(self)
    }
    private func loadAd() {
        self.interstitialAd?.load()
    }
    private func showAd() {
        self.interstitialAd?.show()
    }
    private func destroyAd() {
        if (self.interstitialAd != nil) {
            self.interstitialAd = nil
        }
    }
    public func _onShow() -> Void {
        if (self.showResolve != nil) {
            self.showResolve!(UTSJSONObject([:]))
            self.showResolve = nil
        }
    }
    public func _onClose(_ result: Bool) -> Void {
        if (self.closeCB != nil) {
            self.closeCB!(UTSJSONObject([:]))
        }
    }
    public func _onClick() -> Void {
        if (self.clickCB != nil) {
            self.clickCB!(UTSJSONObject([:]))
        }
    }
    public func _onShowError(_ code: NSNumber, _ message: String, _ detail: UniAggregateError?) -> Void {
        var error = UniAdErrorImpl(code, message, detail)
        error.errSubject = UniError_CreateInterstitialAd
        if (self.errorCB != nil) {
            self.errorCB!(error)
        }
        if (self.showReject != nil) {
            self.showReject!(error)
            self.showReject = nil
        }
    }
    public func _onLoadError(_ code: NSNumber, _ message: String, _ detail: UniAggregateError?) -> Void {
        var error = UniAdErrorImpl(code, message, detail)
        error.errSubject = UniError_CreateInterstitialAd
        if (self.errorCB != nil) {
            self.errorCB!(error)
        }
        if (self.loadReject != nil) {
            self.loadReject!(error)
            self.loadReject = nil
        }
    }
    public func _onLoad() -> Void {
        if (self.loadCB != nil) {
            self.loadCB!(UTSJSONObject([:]))
        }
        if (self.loadResolve != nil) {
            self.loadResolve!(UTSJSONObject([:]))
            self.loadResolve = nil
        }
    }
}
@objc(UTSSDKModulesDCloudUniAdInterstitialAdObj)
@objcMembers
private class InterstitialAdObj : NSObject, DCUniInterstitialAdDelegate {
    private var ad: DCUniInterstitialAd? = nil
    private var option: CreateInterstitialAdOptions
    private var adCallback: InterstitialAdListener? = nil
    private var isVideoPlayEnd = false
    public init(_ option: CreateInterstitialAdOptions){
        self.option = option
    }
    public func setAdListener(_ impl: InterstitialAdListener) -> Void {
        self.adCallback = impl
    }
    public func load() {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.ad = DCUniInterstitialAd(slotID: self.option.adpid)
        self.ad!.delegate = self
        self.ad!.loadData()
        })
    }
    public func show() {
        if (Thread.isMainThread) {
            self.ad?.show(fromRootViewController: UTSiOS.getCurrentViewController())
        } else {
            DispatchQueue.main.async(execute: {
            () -> Void in
            self.ad?.show(fromRootViewController: UTSiOS.getCurrentViewController())
            })
        }
    }
    public func interstitialAdDidLoad(_ interstitialAd: DCUniInterstitialAd) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onLoad()
        })
    }
    public func interstitialAd(_ interstitialAd: DCUniInterstitialAd, didFailWithError error: Error?) {
        var array: Array<UTSError> = []
        if (error != nil) {
            var loadError: NSError = error as! NSError
            var userInfo: Map<String, Any> = loadError.userInfo
            if (userInfo.has("detail")) {
                var details: Array<Any> = userInfo.get("detail") as! Array<Any>
                do {
                    var i: NSNumber = 0
                    while(i < details.length){
                        var object: Map<String, Any> = details[i] as! Map<String, Any>
                        var slotId: String = object.get("id") as! String
                        var platform: String = object.get("p") as! String
                        var message: String = object.get("msg") as! String
                        var code: NSNumber = object.get("code") as! NSNumber
                        array.push(UniAdSourceError(code, message, platform, slotId))
                        i++
                    }
                }
            }
            DispatchQueue.main.async(execute: {
            () -> Void in
            self.adCallback?._onLoadError(NSNumber.from(loadError.code), loadError.localizedDescription, UniAggregateError(array))
            })
        }
    }
    public func interstitialAdDidVisible(_ interstitialAd: DCUniInterstitialAd) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onShow()
        })
    }
    public func interstitialAdDidPlayFinish(_ interstitialAd: DCUniInterstitialAd, didFailWithError error: Error?) {
        if (error != nil) {
            var showError: NSError = error as! NSError
            var codeNumber: NSNumber = NSNumber.from(showError.code)
            DispatchQueue.main.async(execute: {
            () -> Void in
            self.adCallback?._onShowError(codeNumber, showError.localizedDescription, nil)
            })
        } else {
            self.isVideoPlayEnd = true
        }
    }
    public func interstitialAdDidClicked(_ interstitialAd: DCUniInterstitialAd) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onClick()
        })
    }
    public func interstitialAdDidClose(_ interstitialAd: DCUniInterstitialAd) {
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onClose(self.isVideoPlayEnd)
        })
    }
    public func interstitialAdDidShowFailed(_ interstitialAd: DCUniInterstitialAd, error: Error) {
        var showError: NSError = error as! NSError
        var codeNumber: NSNumber = NSNumber.from(showError.code)
        DispatchQueue.main.async(execute: {
        () -> Void in
        self.adCallback?._onShowError(codeNumber, showError.localizedDescription, nil)
        })
    }
}
@objc(AdComponent)
@objcMembers
public class AdComponent : UTSComponent<UIView> {
    public var adpid: String = ""
    private var currentView: UIView? = nil
    private var feedAdImpl: TemplateFeedAdImpl? = nil
    private var isLoading = false
    public override func created() {
        self.feedAdImpl = TemplateFeedAdImpl(self)
    }
    public override func NVLoad() -> UIView {
        self.currentView = UIView()
        return self.currentView!
    }
    public override func NVLoaded() {
        self.load()
    }
    public override func unmounted() {}
    public func load() {
        if (self.isLoading == false) {
            self.isLoading = true
        } else {
            return
        }
        var adWidth = NSNumber.from(self.calculatedFrame.size.width)
        var adHeight = NSNumber.from(self.calculatedFrame.size.height)
        if (adWidth <= 0) {
            adWidth = NSNumber.from(UIScreen.main.bounds.size.width)
        }
        if (adHeight <= 0) {
            adHeight = adWidth
        }
        self.feedAdImpl!.loadAd(self.adpid, CGSize(width: adWidth.toDouble(), height: adHeight.toDouble()))
    }
    public override func __$$init() {
        self.__$$watch("adpid", {
        (__newValue, __oldValue) -> Void in
        var newValue = UTSiOS.convertString(__newValue)
        var oldValue = UTSiOS.convertString(__oldValue)
        if (self.adpid == "" || newValue != oldValue) {
            self.adpid = newValue
            self.isLoading = false
        }
        })
    }
}
@objc
public protocol AdElement : JSExport {
}
@objc(AdElementImpl)
@objcMembers
public class AdElementImpl : UniElementImpl, AdElement {
    public var targetComponent: AdComponent {
        get {
            return self.component as! AdComponent
        }
    }
}
@objc(AdComponentRegister)
@objcMembers
public class AdComponentRegister : NSObject {
    public static func registerComponent() {
        UniSDKEngine.shared.registerUniComponent(type: "ad", nodeClazz: AdElementImpl.constructor, componentCls: AdComponent.self)
        UniSDKEngine.shared.registerExtComponent(type: "ad")
    }
}
@objc(UTSSDKModulesDCloudUniAdTemplateFeedAdImpl)
@objcMembers
private class TemplateFeedAdImpl : NSObject, DCUniAdNativeAdsManagerDelegate, DCUniAdNativeAdDelegate {
    private var component: AdComponent
    private var adManager: DCUniAdNativeAdsManager? = nil
    private var currentNativeAd: DCUniAdNativeAd? = nil
    private var adView: DCUniAdSpotVideoView? = nil
    private var viewSize: CGSize? = nil
    public init(_ component: AdComponent){
        self.component = component
        super.init()
        self.adView = DCUniAdSpotVideoView()
    }
    public func loadAd(_ slotID: String, _ size: CGSize) {
        self.viewSize = size
        self.adManager = DCUniAdNativeAdsManager(slotID: slotID)
        self.adManager!.delegate = self
        self.adManager!.adSize = CGSize(width: size.width, height: 0.0)
        self.adManager!.loadAdData(withCount: 1)
    }
    private func loadNativeAd(_ nativeAd: DCUniAdNativeAd) {
        self.currentNativeAd = nativeAd
        self.currentNativeAd!.delegate = self
        self.currentNativeAd!.viewController = UTSiOS.getCurrentViewController()
        if (nativeAd.isExpress) {
            self.currentNativeAd!.render()
            self.component.view.addSubview(self.currentNativeAd!.expressView!)
        } else if (nativeAd.data?.adMode == DCUniAdMediatedNativeAdMode.video && self.adView != nil) {
            self.adView!.frame = CGRectMake(0, 0, self.viewSize!.width, self.viewSize!.height)
            self.adView!.refreshUI(with: nativeAd)
            self.adView!.closeBlock = {
            () -> Void in
            self.component.__$$emit("close")
            }
            self.component.view.addSubview(self.adView!)
        }
    }
    public func nativeAdsManagerSuccess(toLoad adsManager: DCUniAdNativeAdsManager, nativeAds nativeAdDataArray: [DCUniAdNativeAd]) {
        do {
            var i: NSNumber = 0
            while(i < nativeAdDataArray.length){
                var nativeAd: DCUniAdNativeAd = nativeAdDataArray[i] as! DCUniAdNativeAd
                if (i == 0) {
                    self.loadNativeAd(nativeAd)
                }
                i++
            }
        }
    }
    public func nativeAdsManager(_ adsManager: DCUniAdNativeAdsManager, didFailWithError error: Error) {
        if (error != nil) {
            var array: Array<Any> = []
            var loadError: NSError = error as! NSError
            var userInfo: Map<String, Any> = loadError.userInfo
            if (userInfo.has("detail")) {
                var details: Array<Any> = userInfo.get("detail") as! Array<Any>
                do {
                    var i: NSNumber = 0
                    while(i < details.length){
                        var object: Map<String, Any> = details[i] as! Map<String, Any>
                        var slotId: String = object.get("id") as! String
                        var platform: String = object.get("p") as! String
                        var message: String = object.get("msg") as! String
                        var code: NSNumber = object.get("code") as! NSNumber
                        var causeMap = Map<String, Any>()
                        causeMap.set("platform", platform)
                        causeMap.set("slotId", slotId)
                        causeMap.set("message", message)
                        causeMap.set("code", code)
                        array.push(causeMap)
                        i++
                    }
                }
            }
            var errorMap = Map<String, Any>()
            errorMap.set("errCode", NSNumber.from(loadError.code))
            errorMap.set("errMsg", loadError.localizedDescription)
            errorMap.set("cause", array)
            errorMap.set("errSubject", UniError_AdComponent)
            var params = Map<String, Any>()
            params.set("detail", errorMap)
            self.component.__$$emit("error", params)
        }
    }
    public func nativeAdDidClick(_ nativeAd: DCUniAdNativeAd) {
        self.component.__$$emit("clicked")
    }
    public func nativeAd(_ nativeAd: DCUniAdNativeAd, dislikeWithReason filterWords: [DCUniAdDislikeWords]) {
        self.component.__$$emit("close")
        self.component.setStyleHeight(height: 0.0)
        self.component.remove()
        self.currentNativeAd = nil
    }
    public func nativeAdExpressViewRenderFail(_ nativeAd: DCUniAdNativeAd, error: Error) {
        var showError: NSError = error as! NSError
        var errorMap = Map<String, Any>()
        errorMap.set("errCode", NSNumber.from(showError.code))
        errorMap.set("errMsg", showError.localizedDescription)
        errorMap.set("errSubject", UniError_AdComponent)
        var params = Map<String, Any>()
        params.set("detail", errorMap)
        self.component.__$$emit("error", params)
        self.currentNativeAd = nil
    }
    public func nativeAdExpressViewRenderSuccess(_ nativeAd: DCUniAdNativeAd) {
        self.component.__$$emit("load")
        var height = nativeAd.expressView?.frame.size.height ?? 0.0
        self.component.setStyleHeight(height: Float(height))
    }
    public func nativeAd(_ nativeAd: DCUniAdNativeAd, playerStatusChanged status: DCUniAdMediaPlayerStatus) {
        if (nativeAd.isExpress == false && nativeAd.data?.adMode == DCUniAdMediatedNativeAdMode.video && self.adView != nil) {
            if (status == DCUniAdMediaPlayerStatus.started) {
                self.adView!.startCountdown()
            } else if (status == DCUniAdMediaPlayerStatus.paused) {
                self.adView!.pauseCountdown()
            } else if (status == DCUniAdMediaPlayerStatus.resume) {
                self.adView!.resumeCountdown()
            } else if (status == DCUniAdMediaPlayerStatus.error) {
                self.adView!.close()
            }
        }
    }
}
public var createRewardedVideoAd: CreateRewardedVideoAd = {
(_ option: CreateRewardedVideoAdOptions) -> RewardedVideoAd in
var rewardVideoAd = RewardVideoAdImpl(option)
return rewardVideoAd
}
public var createInterstitialAd: CreateInterstitialAd = {
(_ option: CreateInterstitialAdOptions) -> InterstitialAd in
var interstitialAd = InterstitialAdImpl(option)
return interstitialAd
}
@objc(UTSSDKModulesDCloudUniAdCreateInterstitialAdOptionsJSONObject)
@objcMembers
public class CreateInterstitialAdOptionsJSONObject : NSObject {
    public var adpid: String!
}
@objc(UTSSDKModulesDCloudUniAdCreateRewardedVideoAdOptionsJSONObject)
@objcMembers
public class CreateRewardedVideoAdOptionsJSONObject : NSObject {
    public var adpid: String!
    public var urlCallback: UrlCallbackOptions?
}
public func createRewardedVideoAdByJs(_ option: CreateRewardedVideoAdOptionsJSONObject) -> Int {
    var ins = createRewardedVideoAd(CreateRewardedVideoAdOptions(UTSJSONObject([
        "adpid": option.adpid,
        "urlCallback": option.urlCallback
    ])))
    return UTSBridge.registerJavaScriptClassInstance(RewardedVideoAdByJsProxy(ins))
}
public func createInterstitialAdByJs(_ option: CreateInterstitialAdOptionsJSONObject) -> Int {
    var ins = createInterstitialAd(CreateInterstitialAdOptions(UTSJSONObject([
        "adpid": option.adpid
    ])))
    return UTSBridge.registerJavaScriptClassInstance(InterstitialAdByJsProxy(ins))
}
@objc(UTSSDKModulesDCloudUniAdInterstitialAdByJsProxy)
@objcMembers
public class InterstitialAdByJsProxy : NSObject {
    public var __instance: InterstitialAd
    public init(_ ins: InterstitialAd){
        __instance = ins
    }
    public func showByJs(utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        __instance.show().then({
        (res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func loadByJs(utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        __instance.load().then({
        (res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func destroyByJs() -> Void {
        return __instance.destroy()
    }
    public func onLoadByJs(_ callback: UTSCallback) -> Void {
        return __instance.onLoad({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offLoadByJs(_ callback: UTSCallback) -> Void {
        return __instance.offLoad({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onErrorByJs(_ callback: UTSCallback) -> Void {
        return __instance.onError({
        (result: IUniAdError) -> Void in
        callback(result)
        })
    }
    public func offErrorByJs(_ callback: UTSCallback) -> Void {
        return __instance.offError({
        (result: IUniAdError) -> Void in
        callback(result)
        })
    }
    public func onCloseByJs(_ callback: UTSCallback) -> Void {
        return __instance.onClose({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offCloseByJs(_ callback: UTSCallback) -> Void {
        return __instance.offClose({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onAdClickedByJs(_ callback: UTSCallback) -> Void {
        return __instance.onAdClicked({
        (result: Any) -> Void in
        callback(result)
        })
    }
}
@objc(UTSSDKModulesDCloudUniAdRewardedVideoAdByJsProxy)
@objcMembers
public class RewardedVideoAdByJsProxy : NSObject {
    public var __instance: RewardedVideoAd
    public init(_ ins: RewardedVideoAd){
        __instance = ins
    }
    public func showByJs(utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        __instance.show().then({
        (res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func loadByJs(utsCompletionHandler: @escaping (_ res: Any?, _ err: Any?) -> Void) {
        __instance.load().then({
        (res) -> Void in
        utsCompletionHandler(res, nil)
        }).catch({
        (err) -> Void in
        utsCompletionHandler(nil, err)
        })
    }
    public func destroyByJs() -> Void {
        return __instance.destroy()
    }
    public func onLoadByJs(_ callback: UTSCallback) -> Void {
        return __instance.onLoad({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func offLoadByJs(_ callback: UTSCallback) -> Void {
        return __instance.offLoad({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onErrorByJs(_ callback: UTSCallback) -> Void {
        return __instance.onError({
        (result: IUniAdError) -> Void in
        callback(result)
        })
    }
    public func offErrorByJs(_ callback: UTSCallback) -> Void {
        return __instance.offError({
        (result: IUniAdError) -> Void in
        callback(result)
        })
    }
    public func onCloseByJs(_ callback: UTSCallback) -> Void {
        return __instance.onClose({
        (result: RewardedVideoAdClose) -> Void in
        callback(result)
        })
    }
    public func offCloseByJs(_ callback: UTSCallback) -> Void {
        return __instance.offClose({
        (result: RewardedVideoAdClose) -> Void in
        callback(result)
        })
    }
    public func onAdClickedByJs(_ callback: UTSCallback) -> Void {
        return __instance.onAdClicked({
        (result: Any) -> Void in
        callback(result)
        })
    }
    public func onVerifyByJs(_ callback: UTSCallback) -> Void {
        return __instance.onVerify({
        (result: UTSJSONObject) -> Void in
        callback(result)
        })
    }
}
@objc(UTSSDKModulesDCloudUniAdIndexSwift)
@objcMembers
public class UTSSDKModulesDCloudUniAdIndexSwift : NSObject {
    public static func s_createRewardedVideoAdByJs(_ option: CreateRewardedVideoAdOptionsJSONObject) -> Int {
        return createRewardedVideoAdByJs(option)
    }
    public static func s_createInterstitialAdByJs(_ option: CreateInterstitialAdOptionsJSONObject) -> Int {
        return createInterstitialAdByJs(option)
    }
}
