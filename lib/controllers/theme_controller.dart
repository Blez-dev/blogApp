import 'dart:ui'; // needed for PlatformDispatcher
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController with WidgetsBindingObserver {
  var isDark = true.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    final brightness = PlatformDispatcher.instance.platformBrightness;
    _updateTheme(brightness);
  }

  @override
  void didChangePlatformBrightness() {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    _updateTheme(brightness);
    super.didChangePlatformBrightness();
  }

  void _updateTheme(Brightness brightness) {
    isDark.value = (brightness == Brightness.dark);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }



  void toggleTheme() {
    isDark.value = !isDark.value;
    // apply the theme change in GetMaterialApp
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}



