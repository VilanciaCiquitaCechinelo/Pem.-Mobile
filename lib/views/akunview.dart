import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaiticket/controller/akuncontroller.dart';

class AkunPage extends StatelessWidget {
  final AkunController controller = Get.put(AkunController());

  void _showImagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Sumber Gambar'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await controller.pickImage(ImageSource.gallery);
                Get.back(); // Tutup dialog setelah memilih gambar dari galeri
              },
              child: Text('Galeri'),
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.pickImage(ImageSource.camera);
                Get.back(); // Tutup dialog setelah memilih gambar dari kamera
              },
              child: Text('Kamera'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
                  () => controller.akunModel.value.imagePath.value.isEmpty
                  ? Text('Pilih gambar terlebih dahulu')
                  : Image.file(
                File(controller.akunModel.value.imagePath.value),
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showImagePickerDialog(context);
              },
              child: Text('Pilih Gambar'),
            ),
          ],
        ),
      ),
    );
  }
}
