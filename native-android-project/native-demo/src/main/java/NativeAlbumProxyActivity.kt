package uts.sdk.modules.nativeDemo

import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.Intent
import android.os.Bundle
import android.provider.MediaStore

class NativeAlbumProxyActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        try {
            val intent = createImagePickerIntent()
            startActivityForResult(Intent.createChooser(intent, "选择图片"), albumRequestCode)
        } catch (error: ActivityNotFoundException) {
            sendAlbumResult("unavailable", "未找到可用的系统相册应用", "")
            albumCallback = null
            finish()
        } catch (error: Throwable) {
            sendAlbumResult("unavailable", "Android 系统相册打开失败：$error", "")
            albumCallback = null
            finish()
        }
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

    private fun createImagePickerIntent(): Intent {
        if (android.os.Build.VERSION.SDK_INT >= 33) {
            return Intent(MediaStore.ACTION_PICK_IMAGES).apply {
                type = "image/*"
            }
        }

        return Intent(Intent.ACTION_GET_CONTENT).apply {
            type = "image/*"
            addCategory(Intent.CATEGORY_OPENABLE)
        }
    }
}
