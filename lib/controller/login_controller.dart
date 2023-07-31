import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  GlobalKey<FormState> get formKey => _formKey;

  void onFormSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      isLoading.value = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
      Future.delayed(Duration(seconds: 2), () {
        Get.offNamed("/home");
        isLoading.value = false;
      });
    }
  }
}
