import 'package:custom_text_field/custom_text_field_page/custom_text_field_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      home: CustomTextFieldPage(),
      navigatorKey: Get.key,
    ),
  );
}
