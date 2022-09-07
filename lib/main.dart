import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/utils/theme.dart';
import 'package:flutter_eccommerce/view/loading/loading.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: AppTheme.themeData(lightTheme),
      darkTheme: AppTheme.themeData(darkTheme),
      home: LoadingView(),
    ),
  );
}
