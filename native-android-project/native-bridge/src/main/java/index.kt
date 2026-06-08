@file:Suppress("UNCHECKED_CAST", "USELESS_CAST", "INAPPLICABLE_JVM_NAME", "UNUSED_ANONYMOUS_PARAMETER", "SENSELESS_COMPARISON", "NAME_SHADOWING", "UNNECESSARY_NOT_NULL_ASSERTION")
package uts.sdk.modules.nativeBridge
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Build
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
open class NativeBridgeOptions (
    @JsonNotNull
    open var methodName: String,
    @JsonNotNull
    open var data: String,
) : UTSObject()
open class NativeBridgeMessage (
    @JsonNotNull
    open var methodName: String,
    @JsonNotNull
    open var data: String,
) : UTSObject()
typealias OpenNativeBridge = (options: NativeBridgeOptions) -> Unit
typealias NativeBridgeMessageCallback = (message: NativeBridgeMessage) -> Unit
typealias OnNativeBridgeMessage = (callback: NativeBridgeMessageCallback) -> Unit
typealias OffNativeBridgeMessage = () -> Unit
val nativeBridgeAndroidAction = "com.dcloud.uniappdemo.NATIVE_BRIDGE"
val uniAppXMessageAndroidAction = "com.dcloud.uniappdemo.UNI_APP_X_MESSAGE"
val nativeBridgeExtraMethodName = "methodName"
val nativeBridgeExtraData = "data"
val nativeBridgeMethodProductDetail = "productDetail"
val nativeProductDetailActivity = "com.dcloud.uniappdemo.ProductDetailActivity"
open class NativeBridgeMessageReceiver : BroadcastReceiver {
    constructor(){}
    override fun onReceive(context: Context, intent: Intent) {
        val action = intent.getAction()
        if (action == null || !action.equals(uniAppXMessageAndroidAction)) {
            return
        }
        val methodName = intent.getStringExtra(nativeBridgeExtraMethodName) ?: ""
        val data = intent.getStringExtra(nativeBridgeExtraData) ?: ""
        val message = NativeBridgeMessage(methodName = methodName, data = data)
        NativeBridgeMessageManager.listener?.invoke(message)
    }
}
open class NativeBridgeMessageManager {
    companion object {
        var listener: NativeBridgeMessageCallback? = null
        var receiver: BroadcastReceiver? = null
        fun openNativeActivity(options: NativeBridgeOptions): Boolean {
            val activity = UTSAndroid.getUniActivity()
            if (activity == null) {
                return false
            }
            try {
                val intent = Intent(nativeBridgeAndroidAction)
                intent.setPackage(activity.getPackageName())
                intent.setClassName(activity, nativeProductDetailActivity)
                intent.putExtra(nativeBridgeExtraMethodName, options.methodName)
                intent.putExtra(nativeBridgeExtraData, options.data)
                activity.startActivity(intent)
                return true
            }
             catch (error: Throwable) {
                console.log("native-bridge android open failed: " + error)
                return false
            }
        }
        fun open(options: NativeBridgeOptions) {
            if (options.methodName == nativeBridgeMethodProductDetail) {
                if (!this.openNativeActivity(options)) {
                    console.log("native-bridge android productDetail fallback data: " + options.data)
                }
                return
            }
            console.log("native-bridge android ignored methodName: " + options.methodName)
        }
        fun addListener(callback: NativeBridgeMessageCallback) {
            val activity = UTSAndroid.getUniActivity()
            if (activity == null) {
                console.log("native-bridge android register receiver failed: activity is null")
                return
            }
            this.removeListener()
            this.listener = callback
            this.receiver = NativeBridgeMessageReceiver()
            val filter = IntentFilter(uniAppXMessageAndroidAction)
            if (Build.VERSION.SDK_INT >= 33) {
                activity.registerReceiver(this.receiver, filter, Context.RECEIVER_EXPORTED)
            } else {
                activity.registerReceiver(this.receiver, filter)
            }
        }
        fun removeListener() {
            val activity = UTSAndroid.getUniActivity()
            if (activity != null && this.receiver != null) {
                try {
                    activity.unregisterReceiver(this.receiver!!)
                }
                 catch (error: Throwable) {
                    console.log("native-bridge android unregister receiver failed: " + error)
                }
            }
            this.listener = null
            this.receiver = null
        }
    }
}
val openNativeBridge: OpenNativeBridge = fun(options: NativeBridgeOptions) {
    NativeBridgeMessageManager.open(options)
}
val onNativeBridgeMessage: OnNativeBridgeMessage = fun(callback: NativeBridgeMessageCallback) {
    NativeBridgeMessageManager.addListener(callback)
}
val offNativeBridgeMessage: OffNativeBridgeMessage = fun() {
    NativeBridgeMessageManager.removeListener()
}
