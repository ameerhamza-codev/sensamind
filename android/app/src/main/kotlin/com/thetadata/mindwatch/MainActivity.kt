package com.thetadata.mindwatch

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import android.content.ContentResolver;
import android.content.Context;
import android.media.RingtoneManager;
import android.os.Bundle;

import java.util.TimeZone;

import io.flutter.plugin.common.MethodChannel;


class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(flutterEngine.getDartExecutor(), "sensamind/notifications").setMethodCallHandler { call, result ->
            if ("getTimeZoneName" == call.method) {
                result.success(TimeZone.getDefault().getID())
            }
        }

    }
}
