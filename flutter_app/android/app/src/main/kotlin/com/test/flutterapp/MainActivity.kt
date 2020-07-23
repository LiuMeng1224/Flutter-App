package com.test.flutterapp

import android.app.Activity
import android.graphics.Color
import android.graphics.Point
import android.os.Build
import android.view.*
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {

    fun setStatus(activity: Activity) {
        if (!isNavigationBarShow(activity)) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
                activity.window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS) //窗口透明的状态栏
                activity.requestWindowFeature(Window.FEATURE_NO_TITLE) //隐藏标题栏
                activity.window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION) //窗口透明的导航栏
            }
        } else {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                activity.window.setStatusBarColor(Color.TRANSPARENT)
            }
        }
    }

    //是否是虚拟按键的设备
    private fun isNavigationBarShow(activity: Activity): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            val display = activity.windowManager.defaultDisplay
            val size = Point()
            val realSize = Point()
            display.getSize(size)
            display.getRealSize(realSize)
            val result = realSize.y != size.y
            realSize.y != size.y
        } else {
            val menu = ViewConfiguration.get(activity).hasPermanentMenuKey()
            val back = KeyCharacterMap.deviceHasKey(KeyEvent.KEYCODE_BACK)
            if (menu || back) {
                false
            } else {
                true
            }
        }
    }

}
