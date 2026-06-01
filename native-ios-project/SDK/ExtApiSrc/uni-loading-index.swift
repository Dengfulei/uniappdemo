import CoreFoundation
import DCloudUTSFoundation
import DCloudUniappRuntime
@objc(UTSSDKModulesDCloudUniLoadingNativeLoading)
@objcMembers
public class NativeLoading : NSObject {
    public var element: UniNativeViewElement
    public var spinnerView: SpinnerView? = nil
    public var color: String? = nil
    public var strokeWidth: String? = nil
    public var animationTimingFunction: String? = nil
    public init(_ element: UniNativeViewElement){
        self.element = element
        super.init()
        self.bindView()
        (self.element.parentElement as! UniLoadingElement).setLoadingView(self.spinnerView)
    }
    public func bindView() {
        self.spinnerView = SpinnerView(frame: CGRect.zero)
        if (self.spinnerView != nil) {
            self.element.bindIOSView(self.spinnerView!)
        }
    }
    public func updateIosSpinner(_ iosSpinner: Bool) {
        var iosSpinnerValue: Bool = iosSpinner ?? false
        self.spinnerView?.updateIosSpinnerProp(iosSpinnerValue)
    }
    public func updatePaused(_ paused: Bool) {
        var pausedValue: Bool = paused ?? false
        self.spinnerView?.updatePausedProp(pausedValue)
    }
    public func updateStyle(_ color: String?, _ strokeWidth: String?, _ animationTimingFunction: String?) {
        self.color = color
        self.strokeWidth = strokeWidth
        self.animationTimingFunction = animationTimingFunction
        self.updateUI()
    }
    public func updateUI() {
        var color = UTSiOS.colorWithString(self.color ?? "black")
        if (self.strokeWidth == nil) {
            self.strokeWidth = "medium"
        }
        self.spinnerView?.setAppearance(strokeColor: color, strokeWidth: self.strokeWidth!, animationTimingFunction: self.animationTimingFunction)
    }
    public func destroy() {
        UTSiOS.destroyInstance(self)
    }
}
@objc(UTSSDKModulesDCloudUniLoadingUniLoadingElement)
@objcMembers
public class UniLoadingElement : UniElementImpl {
    private var nativeView: SpinnerView? = nil
    fileprivate func setLoadingView(_ nativeView: SpinnerView?) {
        self.nativeView = nativeView
    }
    public override func getIOSView() -> UIView? {
        var nativeElement = self.firstChild as! UniNativeViewElement
        if (nativeElement == nil) {
            return nil
        } else {
            return nativeElement.getIOSView()
        }
    }
}
@objc(UTSSDKModulesDCloudUniLoadingNativeLoadingByJs)
@objcMembers
public class NativeLoadingByJs : NativeLoading {
    public func bindViewByJs() {
        return self.bindView()
    }
    public func updateIosSpinnerByJs(_ iosSpinner: Bool) {
        return self.updateIosSpinner(iosSpinner)
    }
    public func updatePausedByJs(_ paused: Bool) {
        return self.updatePaused(paused)
    }
    public func updateStyleByJs(_ color: String?, _ strokeWidth: String?, _ animationTimingFunction: String?) {
        return self.updateStyle(color, strokeWidth, animationTimingFunction)
    }
    public func updateUIByJs() {
        return self.updateUI()
    }
    public func destroyByJs() {
        return self.destroy()
    }
}
@objc(UTSSDKModulesDCloudUniLoadingUniLoadingElementByJs)
@objcMembers
public class UniLoadingElementByJs : UniLoadingElement {
    public func setLoadingViewByJs(_ nativeView: SpinnerView?) {
        return self.setLoadingView(nativeView)
    }
    public func getIOSViewByJs() -> UIView? {
        return self.getIOSView()
    }
}
