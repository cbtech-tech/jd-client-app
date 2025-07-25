import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarUtil {
  static void showSuccessTop(String message) {
    Get.snackbar(
      'Success',
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
      borderRadius: 10,
      duration: const Duration(seconds: 1),
    );
  }

  static void showSuccessBottom(String message) {
    Get.snackbar(
      'Success',
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      borderRadius: 10,
      duration: const Duration(seconds: 1),
    );
  }

  static void showErrorTop(String message) {
    Get.snackbar(
      'Error',
      message,
      colorText: Colors.white,
      icon: Icon(Icons.error, color: Colors.white),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(12),
      borderRadius: 10,
      duration: const Duration(seconds: 2),
    );
  }

  static void showErrorBottom(String message) {
    Get.snackbar(
      'Error',
      message,
      colorText: Colors.white,
      icon: Icon(Icons.error, color: Colors.white),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      borderRadius: 10,
      duration: const Duration(seconds: 2),
    );
  }
}
