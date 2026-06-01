import deviceInfo from '@ohos.deviceInfo';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import pasteboard from '@ohos.pasteboard';
import { UTSObject, UTS } from "@dcloudio/uni-app-x-runtime";
class NativeDemoInfo extends UTSObject {
    platform!: string;
    deviceName!: string;
    systemName!: string;
    systemVersion!: string;
    model!: string;
    timestamp!: string;
}
type GetNativeDemoInfo = () => NativeDemoInfo;
type CopyNativeDemoText = (text: string) => boolean;
class NativeAlbumResult extends UTSObject {
    action!: string;
    message!: string;
    mediaType!: string;
}
type NativeAlbumCallback = (result: NativeAlbumResult) => void;
type OpenNativeAlbum = (callback: NativeAlbumCallback) => boolean;
const getNativeDemoInfo: GetNativeDemoInfo = (): NativeDemoInfo =>{
    return {
        platform: 'HarmonyOS',
        deviceName: `${deviceInfo.brand} ${deviceInfo.productModel}`,
        systemName: 'HarmonyOS',
        systemVersion: deviceInfo.osFullName,
        model: deviceInfo.productModel,
        timestamp: `${Date.now()}`
    } as NativeDemoInfo;
};
const copyNativeDemoText: CopyNativeDemoText = (text: string): boolean =>{
    try {
        const data = pasteboard.createPlainTextData(text);
        pasteboard.getSystemPasteboard().setDataSync(data);
        return true;
    } catch (error) {
        UTS.console.log(`native demo harmony copy failed: ${error}`);
        return false;
    }
};
const openNativeAlbum: OpenNativeAlbum = (callback: NativeAlbumCallback): boolean =>{
    try {
        const picker = new photoAccessHelper.PhotoViewPicker();
        const options = new photoAccessHelper.PhotoSelectOptions();
        options.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        options.maxSelectNumber = 1;
        picker.select(options).then((result: photoAccessHelper.PhotoSelectResult)=>{
            const uri = result.photoUris.length > 0 ? result.photoUris[0] : '';
            callback({
                action: uri == '' ? 'cancel' : 'selected',
                message: uri == '' ? '已取消选择' : '已从 HarmonyOS 系统相册选择资源',
                mediaType: uri
            } as NativeAlbumResult);
        }).catch((error: Error)=>{
            callback({
                action: 'cancel',
                message: `HarmonyOS 系统相册选择失败：${error}`,
                mediaType: ''
            } as NativeAlbumResult);
        });
        callback({
            action: 'opened',
            message: '已打开 HarmonyOS 系统相册',
            mediaType: 'image/*'
        } as NativeAlbumResult);
        return true;
    } catch (error) {
        callback({
            action: 'unavailable',
            message: `HarmonyOS 系统相册打开失败：${error}`,
            mediaType: ''
        } as NativeAlbumResult);
        return false;
    }
};
export { getNativeDemoInfo as getNativeDemoInfo };
export { copyNativeDemoText as copyNativeDemoText };
export { openNativeAlbum as openNativeAlbum };
