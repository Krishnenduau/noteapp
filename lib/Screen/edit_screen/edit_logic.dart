import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:note_app/Api/api.dart';
import 'dart:convert';

import 'package:note_app/components/snackbar.dart';

class EditNoteController extends GetxController {
  var isLoading = false.obs;

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  // Fetch the note by ID
  Future<void> fetchNote(int id) async {
    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse('${ApiConstants.editNote}/$id'), // Correct the URL
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // Set text with selection to preserve cursor
        titleController
          ..text = jsonData['title']
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: jsonData['title'].length),
          );

        bodyController
          ..text = jsonData['body']
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: jsonData['body'].length),
          );
      }
    } catch (e) {
      // You can remove error display here if you don't want to show errors
    } finally {
      isLoading.value = false;
    }
  }

  // Update the note using PUT request
  Future<void> saveNote(int id) async {
    try {
      isLoading.value = true;
      final response = await http.put(
        Uri.parse('${ApiConstants.editNote}/$id'), // Correct the URL
        body: {
          'title': titleController.text, // Correct reference
          'body': bodyController.text, // Correct reference
        },
      );

      if (response.statusCode == 200) {
        showCustomSnackbar('Success', 'Note saved successfully!');
      }
    } catch (e) {
      // You can remove error display here if you don't want to show errors
    } finally {
      isLoading.value = false;
    }
  }
}
