package com.example.driver_app_new

import io.flutter.app.FlutterApplication
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainApplication: FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        FlutterEngine(this).also {
            GeneratedPluginRegistrant.registerWith(it)
        }
    }
}
