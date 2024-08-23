import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:views/services/navigation_service.dart';
import 'package:views/services/supabase_services.dart';
import 'package:views/utils/helper.dart';

import '../utils/env.dart';

class ViewsController extends GetxController{
  final TextEditingController textEditingController = TextEditingController(text: "");
  var content = "".obs;
  var loading = false.obs;
  Rx<File?> image = Rx<File?>(null);

  // To pick image to share with view
  void pickImage() async{
    File? file = await pickImageFromGallery();
    if(file!=null){
      image.value=file;
    }
  }

  void post(String userId) async{
    try {
      loading.value = true;
      // Upload Photo and get path
      const uuid=Uuid();
      final dir = "$userId/${uuid.v6()}";
      var imgPath="";
      if(image.value != null && image.value!.existsSync()){
        imgPath = await SupabaseService.SupabaseClientclient.storage
            .from(Env.supabaseimagebucket)
            .upload(dir, image.value!);
      }
      // Save post to db with image path and msg
      await SupabaseService.SupabaseClientclient.from("posts").insert({
        "user_id":userId,
        "content":content.value,
        "image":imgPath.isNotEmpty ? imgPath : null
      });
      loading.value=false;
      Get.find<NavigationService>().currentIndex.value=0;
      resetState();
      showSnackBar("Success", "View added Successfully");
    }on StorageException catch(error){
      resetState();
      loading.value=false;
      showSnackBar("Error", error.message);
    }
    catch(error){
      resetState();
      loading.value=false;
      showSnackBar("Error", "Something went wrong");
    }
    finally{

    }

  }
// to reset add view variables state
void resetState(){
  content.value="";
  image.value=null;
}

  void onClose(){
    textEditingController.dispose();
    super.onClose();
  }
}