import 'package:get/get.dart';
import 'package:note_app/Screen/edit_screen/edit_logic.dart';

class EditNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditNoteController());
  }
}
