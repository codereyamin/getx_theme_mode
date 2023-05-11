import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    _getThemeStatus();
    super.onInit();
  }

  RxBool isLightTheme = false.obs;
  GetStorage box = GetStorage();

  saveThemeStatus() async {
    await box.write("theme", isLightTheme.value);
  }

  _getThemeStatus() async {
    final value = await box.read("theme");
    isLightTheme.value = value ?? false;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }
}
