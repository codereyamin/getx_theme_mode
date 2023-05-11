import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(
          //   child: TextButton(
          //       onPressed: () {
          //         print("ok");

          //         Get.changeTheme(Get.isDarkMode == true ? ThemeData.light() : ThemeData.dark());
          //       },
          //       child: Text('Change Theme')),
          // )

          Center(
            child: ObxValue(
              (data) => Switch(
                value: controller.isLightTheme.value,
                onChanged: (val) {
                  controller.isLightTheme.value = val;
                  Get.changeThemeMode(
                    controller.isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                  );
                  controller.saveThemeStatus();
                },
              ),
              false.obs,
            ),
          ),
        ],
      ),
    );
  }
}
