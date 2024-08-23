import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import 'env.dart';

void showSnackBar(String title,String message){
  Get.snackbar(title,message,
  snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.white,
    backgroundColor: const Color(0xff252526),
    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
    snackStyle: SnackStyle.GROUNDED,
    margin: const EdgeInsets.all(0)
  );
}

Future<File?> pickImageFromGallery() async {
  const uid=Uuid();
  final ImagePicker picker = ImagePicker();
  final XFile? file = await picker.pickImage(source: ImageSource.gallery);
  if(file == null) return null;
  final dir = Directory.systemTemp;
  final targetPath = "${dir.absolute.path}/${uid.v6()}.jpg";
  File image = await compressImage(File(file.path), targetPath);
  return image;
}

// Compress file
Future<File> compressImage(File file,String targetpath) async{
  var result = await FlutterImageCompress.compressAndGetFile(file.path, targetpath,quality: 70);
  return File(result!.path);
}

// To get image bucket url
String getBucketUrl(String path){
  return "${Env.supabaseUrl}/storage/v1/object/public/$path";
}