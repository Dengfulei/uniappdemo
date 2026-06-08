package com.dcloud.uniappdemo

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.view.Gravity
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import org.json.JSONObject

private const val NATIVE_BRIDGE_EXTRA_METHOD_NAME = "methodName"
private const val NATIVE_BRIDGE_EXTRA_DATA = "data"
private const val UNI_APP_X_MESSAGE_ANDROID_ACTION = "com.dcloud.uniappdemo.UNI_APP_X_MESSAGE"

class ProductDetailActivity : Activity() {
    private var productData: String = ""
    private var productName: String = "商品详情"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        productData = intent.getStringExtra(NATIVE_BRIDGE_EXTRA_DATA).orEmpty()
        val product = runCatching { JSONObject(productData) }.getOrNull()
        productName = product?.optString("name")?.takeIf { it.isNotBlank() } ?: productName

        val root = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setBackgroundColor(Color.rgb(246, 241, 232))
            setPadding(dp(24), dp(32), dp(24), dp(24))
        }

        val title = TextView(this).apply {
            text = productName
            textSize = 28f
            setTextColor(Color.rgb(32, 48, 45))
        }

        val price = TextView(this).apply {
            text = "¥${product?.optString("price", "--") ?: "--"}"
            textSize = 22f
            setTextColor(Color.rgb(163, 74, 48))
            setPadding(0, dp(10), 0, 0)
        }

        val desc = TextView(this).apply {
            text = product?.optString("desc", "来自 uni-app x 的商品数据") ?: "来自 uni-app x 的商品数据"
            textSize = 16f
            setTextColor(Color.rgb(67, 79, 75))
            setPadding(0, dp(18), 0, dp(18))
        }

        val meta = TextView(this).apply {
            val tag = product?.optString("tag", "未分类") ?: "未分类"
            val sold = product?.optInt("sold", 0) ?: 0
            text = "$tag / 已售 $sold"
            textSize = 14f
            setTextColor(Color.rgb(112, 92, 64))
        }

        val sendBack = Button(this).apply {
            text = "发送消息给 uni-app x"
            setOnClickListener {
                sendProductNameTapMessage()
                finish()
            }
        }

        val back = Button(this).apply {
            text = "返回"
            setOnClickListener { finish() }
        }

        root.addView(title, LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT)
        root.addView(price, LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT)
        root.addView(desc, LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT)
        root.addView(meta, LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT)
        root.addView(sendBack, buttonLayoutParams())
        root.addView(back, buttonLayoutParams())
        setContentView(root)
    }

    private fun sendProductNameTapMessage() {
        val result = JSONObject()
            .put("name", productName)
            .put("source", "ProductDetailActivity")
            .put("product", productData)
            .toString()

        val intent = Intent(UNI_APP_X_MESSAGE_ANDROID_ACTION)
            .setPackage(packageName)
            .putExtra(NATIVE_BRIDGE_EXTRA_METHOD_NAME, "productNameTap")
            .putExtra(NATIVE_BRIDGE_EXTRA_DATA, result)

        sendBroadcast(intent)
    }

    private fun buttonLayoutParams(): LinearLayout.LayoutParams {
        return LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        ).apply {
            gravity = Gravity.CENTER_HORIZONTAL
            topMargin = dp(18)
        }
    }

    private fun dp(value: Int): Int {
        return (value * resources.displayMetrics.density).toInt()
    }
}
