package uts.sdk.modules.nativeDemo

import android.app.Activity
import android.content.Intent
import android.os.Bundle

class NativeAlbumProxyActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val intent = Intent(Intent.ACTION_GET_CONTENT).apply {
            type = "image/*"
            addCategory(Intent.CATEGORY_OPENABLE)
        }
        startActivityForResult(Intent.createChooser(intent, "选择图片"), albumRequestCode)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == albumRequestCode && resultCode == RESULT_OK && data?.data != null) {
            sendAlbumResult("selected", "已从 Android 系统相册选择资源", "${data.data}")
        } else {
            sendAlbumResult("cancel", "已取消选择", "")
        }
        albumCallback = null
        finish()
    }
}
