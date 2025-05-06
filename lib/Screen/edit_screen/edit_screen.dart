import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/Screen/edit_screen/edit_logic.dart';
import 'package:note_app/components/common_textfield.dart';

class EditNotePage extends StatelessWidget {
  final int noteId;
  final EditNoteController controller = Get.put(EditNoteController());

  EditNotePage({Key? key, required this.noteId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch the note when the page loads
    controller.fetchNote(noteId);

    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Edit Note', style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green, // Set the app bar color
        elevation: 0, // Optional: remove the elevation to make it flat
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20), // Ensure space from top
                Column(
                  children: [
                    CommonTextField(
                      label: 'Title',
                      controller: controller.titleController,
                      onChanged: (val) {},
                    ),
                    const SizedBox(height: 30),
                    CommonTextField(
                      label: 'Body',
                      controller: controller.bodyController,
                      onChanged: (val) {},
                      maxLines: 7,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed:
                          () => controller.saveNote(
                            noteId,
                          ), // Show loader only when saving
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                        ), // Set the text color to white
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(
                          MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.height * 0.06,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
