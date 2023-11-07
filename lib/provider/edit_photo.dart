// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class EditImageUploadProvider extends ChangeNotifier {
  String newImagePath = '';   

  void setNewImage(String image){
    newImagePath=image;
    notifyListeners();
  }

  Future<void> uploadImage(BuildContext context, String path, String name) async {
    final storage = firebase_storage.FirebaseStorage.instance;
    final ref = storage.ref().child('$name.jpg');
    final file = File(path);
    final uploadTask = ref.putFile(file);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Dialog(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20.0),
              Text("Uploading Image..."),
            ],
          ),
        ),
      ),
    ); 

    final snapshot = await uploadTask.whenComplete(() {});
    if (snapshot.state == firebase_storage.TaskState.success) {
      final downloadUrl = await ref.getDownloadURL();
      setNewImage(downloadUrl);
      notifyListeners();      
    } 

    Navigator.pop(context);        
  }

  void clearVariable() {
    newImagePath = '';    
    notifyListeners();
  }

  void pickImageFromGallery(BuildContext context, String name) async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery,imageQuality: 15);
    if (pickedImage != null) {
      await uploadImage(context, pickedImage.path, name);
    }    
  }

  void captureImageFromCamera(BuildContext context, String name) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 15);
    if (pickedImage != null) {
      await uploadImage(context, pickedImage.path, name);
    }    
  }
}
