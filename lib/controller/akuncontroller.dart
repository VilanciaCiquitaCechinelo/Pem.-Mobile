import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:kaiticket/models/akunmodel.dart';

class AkunController extends GetxController {
  var akunModel = AkunModel().obs;

  Future<void> pickImage(ImageSource source) async {
    File? pickedFile = (await ImagePicker().pickImage(source: source)) as File?;
    if (pickedFile != null) {
      akunModel.update((val) {
        val?.imagePath.value = pickedFile.path;
      });
    }
  }
}
