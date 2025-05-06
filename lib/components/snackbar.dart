import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showCustomSnackbar(String title, String message) {
  Get.snackbar(
    
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.white, // Ensure background is white
    colorText: Colors.black, // Set text color to black for contrast
    borderRadius: 10, // Optional: Add border radius
    margin: const EdgeInsets.all(8), // Optional: Add margin around the snackbar
    animationDuration: const Duration(milliseconds: 300), // Optional: Customize animation duration
    duration: const Duration(seconds: 2), // Duration the snackbar stays visible
    boxShadows: [ // Optional: Add shadow for better visibility
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
     titleText: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), // Custom title style
    ),
    messageText: Text(
      message,
      style: TextStyle(color: Colors.black), // Custom message style
    ),
  );
}
