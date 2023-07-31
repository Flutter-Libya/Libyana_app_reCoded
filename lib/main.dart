import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.auth,
      getPages: AppRoutes.routes,
    );
  }
}
