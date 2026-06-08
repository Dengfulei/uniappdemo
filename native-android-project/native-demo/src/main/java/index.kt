@file:Suppress("UNCHECKED_CAST", "USELESS_CAST", "INAPPLICABLE_JVM_NAME", "UNUSED_ANONYMOUS_PARAMETER", "SENSELESS_COMPARISON", "NAME_SHADOWING", "UNNECESSARY_NOT_NULL_ASSERTION")
package uts.sdk.modules.nativeDemo
import android.app.Activity
import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.widget.Toast
import io.dcloud.uniapp.*
import io.dcloud.uniapp.extapi.*
import io.dcloud.uniapp.framework.*
import io.dcloud.uniapp.runtime.*
import io.dcloud.uniapp.vue.*
import io.dcloud.uniapp.vue.shared.*
import io.dcloud.uts.*
import io.dcloud.uts.Map
import io.dcloud.uts.Set
import io.dcloud.uts.UTSAndroid
import kotlin.properties.Delegates
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Deferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.async
open class NativeDemoInfo (
    @JsonNotNull
    open var platform: String,
    @JsonNotNull
    open var deviceName: String,
    @JsonNotNull
    open var systemName: String,
    @JsonNotNull
    open var systemVersion: String,
    @JsonNotNull
    open var model: String,
    @JsonNotNull
    open var timestamp: String,
) : UTSObject()
typealias GetNativeDemoInfo = () -> NativeDemoInfo
typealias CopyNativeDemoText = (text: String) -> Boolean
open class NativeAlbumResult (
    @JsonNotNull
    open var action: String,
    @JsonNotNull
    open var message: String,
    @JsonNotNull
    open var mediaType: String,
) : UTSObject()
typealias NativeAlbumCallback = (result: NativeAlbumResult) -> Unit
typealias OpenNativeAlbum = (callback: NativeAlbumCallback) -> Boolean
val albumRequestCode: Int = 35453
var albumCallback: NativeAlbumCallback? = null
var activityResultCallback: ((requestCode: Int, resultCode: Int, data: Intent?) -> Unit)? = null
val getNativeDemoInfo: GetNativeDemoInfo = fun(): NativeDemoInfo {
    return NativeDemoInfo(platform = "Android", deviceName = "" + Build.MANUFACTURER + " " + Build.MODEL, systemName = "Android", systemVersion = Build.VERSION.RELEASE, model = Build.MODEL, timestamp = "" + Date.now())
}
val copyNativeDemoText: CopyNativeDemoText = fun(text: String): Boolean {
    val context = UTSAndroid.getAppContext()
    if (context == null) {
        return false
    }
    val clipboard = context.getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
    clipboard.setPrimaryClip(ClipData.newPlainText("uni-app x native demo", text))
    Toast.makeText(context, "Android UTS 插件已调用", Toast.LENGTH_SHORT).show()
    return true
}
fun sendAlbumResult(action: String, message: String, mediaType: String) {
    albumCallback?.invoke(NativeAlbumResult(action = action, message = message, mediaType = mediaType))
}
fun registerAlbumResultCallback() {
    activityResultCallback = null
}
val openNativeAlbum: OpenNativeAlbum = fun(callback: NativeAlbumCallback): Boolean {
    val activity = UTSAndroid.getUniActivity()
    if (activity == null) {
        callback(NativeAlbumResult(action = "unavailable", message = "当前 Android Activity 不可用", mediaType = ""))
        return false
    }
    try {
        albumCallback = callback
        registerAlbumResultCallback()
        val intent = Intent(activity, NativeAlbumProxyActivity::class.java)
        activity.startActivity(intent)
        callback(NativeAlbumResult(action = "opened", message = "已打开 Android 系统相册", mediaType = "image/*"))
        return true
    }
     catch (error: Throwable) {
        if (activityResultCallback != null) {
            UTSAndroid.offAppActivityResult(activityResultCallback)
            activityResultCallback = null
        }
        albumCallback = null
        callback(NativeAlbumResult(action = "unavailable", message = "Android 系统相册打开失败：" + error, mediaType = ""))
        return false
    }
}
