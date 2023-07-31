import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/home_page.dart';

class RegistrationController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  GlobalKey<FormState> get formKey => _formKey;

  void onFormSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      isLoading.value = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
      Future.delayed(Duration(seconds: 2), () {
        Get.to(HomePage());
        isLoading.value = false;
      });
    }
  }
}
