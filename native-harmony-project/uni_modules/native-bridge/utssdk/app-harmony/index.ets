import Want from '@ohos.app.ability.Want';
import commonEventManager from '@ohos.commonEventManager';
import { UTSObject, UTSHarmony, UTS } from "@dcloudio/uni-app-x-runtime";
class NativeBridgeOptions extends UTSObject {
    methodName!: string;
    data!: string;
}
class NativeBridgeMessage extends UTSObject {
    methodName!: string;
    data!: string;
}
type OpenNativeBridge = (options: NativeBridgeOptions) => void;
type NativeBridgeMessageCallback = (message: NativeBridgeMessage) => void;
type OnNativeBridgeMessage = (callback: NativeBridgeMessageCallback) => void;
type OffNativeBridgeMessage = () => void;
const uniAppXMessageHarmonyEvent = 'com.dcloud.uniappdemo.UNI_APP_X_MESSAGE';
const nativeBridgeHarmonyAbilityName = 'ProductDetailAbility';
const nativeBridgeMethodProductDetail = 'productDetail';
const nativeBridgeMethodProductNameTap = 'productNameTap';
class NativeBridgeMessageManager {
    static listener: NativeBridgeMessageCallback | null = null;
    static subscriber: commonEventManager.CommonEventSubscriber | null = null;
    static openNativeAbility(options: NativeBridgeOptions): boolean {
        try {
            const context = UTSHarmony.getUIAbilityContext();
            const want = new Want();
            want.bundleName = context.applicationInfo.name;
            want.abilityName = nativeBridgeHarmonyAbilityName;
            want.parameters = {
                methodName: options.methodName,
                data: options.data
            };
            context.startAbility(want).catch((error: Error)=>{
                UTS.console.log(`native-bridge harmony open failed: ${error}`);
                if (options.methodName == nativeBridgeMethodProductDetail) {
                    UTS.console.log(`native-bridge harmony productDetail fallback data: ${options.data}`);
                }
            });
            return true;
        } catch (error) {
            UTS.console.log(`native-bridge harmony open failed: ${error}`);
            return false;
        }
    }
    static open(options: NativeBridgeOptions) {
        if (options.methodName == nativeBridgeMethodProductDetail) {
            if (!NativeBridgeMessageManager.openNativeAbility(options)) {
                UTS.console.log(`native-bridge harmony productDetail fallback data: ${options.data}`);
            }
            return;
        }
        UTS.console.log(`native-bridge harmony ignored methodName: ${options.methodName}`);
    }
    static addListener(callback: NativeBridgeMessageCallback) {
        NativeBridgeMessageManager.removeListener();
        NativeBridgeMessageManager.listener = callback;
        const subscribeInfo = {
            events: [
                uniAppXMessageHarmonyEvent
            ]
        } as commonEventManager.CommonEventSubscribeInfo;
        commonEventManager.createSubscriber(subscribeInfo).then((subscriber: commonEventManager.CommonEventSubscriber)=>{
            NativeBridgeMessageManager.subscriber = subscriber;
            commonEventManager.subscribe(subscriber, (error, eventData: commonEventManager.CommonEventData)=>{
                if (error != null) {
                    UTS.console.log(`native-bridge harmony subscribe failed: ${error}`);
                    return;
                }
                NativeBridgeMessageManager.handleReceiveMessage(eventData);
            });
        }).catch((error: Error)=>{
            UTS.console.log(`native-bridge harmony create subscriber failed: ${error}`);
        });
    }
    static removeListener() {
        if (NativeBridgeMessageManager.subscriber != null) {
            commonEventManager.unsubscribe(NativeBridgeMessageManager.subscriber!, (error)=>{
                if (error != null) {
                    UTS.console.log(`native-bridge harmony unsubscribe failed: ${error}`);
                }
            });
        }
        NativeBridgeMessageManager.subscriber = null;
        NativeBridgeMessageManager.listener = null;
    }
    static handleReceiveMessage(eventData: commonEventManager.CommonEventData) {
        const data = eventData.data ?? '';
        const message = {
            methodName: nativeBridgeMethodProductNameTap,
            data
        } as NativeBridgeMessage;
        NativeBridgeMessageManager.listener?.(message);
    }
}
const openNativeBridge: OpenNativeBridge = (options: NativeBridgeOptions)=>{
    NativeBridgeMessageManager.open(options);
};
const onNativeBridgeMessage: OnNativeBridgeMessage = (callback: NativeBridgeMessageCallback)=>{
    NativeBridgeMessageManager.addListener(callback);
};
const offNativeBridgeMessage: OffNativeBridgeMessage = ()=>{
    NativeBridgeMessageManager.removeListener();
};
export { openNativeBridge as openNativeBridge };
export { onNativeBridgeMessage as onNativeBridgeMessage };
export { offNativeBridgeMessage as offNativeBridgeMessage };
