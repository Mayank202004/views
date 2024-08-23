import 'dart:io';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:views/services/supabase_services.dart';
import 'package:views/utils/helper.dart';

import '../utils/env.dart';

class ProfileController extends GetxController{
  var loading = false.obs;
  Rx<File?> image = Rx<File?>(null);

  //Update User
  Future<void> updateProfile(String userid,String description) async{
    try{
      loading.value=true;
      var uploadedPath="";
      if(image.value !=null && image.value!.existsSync()){
        final String dir = "$userid/profile.jpg";
        var path = await SupabaseService.SupabaseClientclient.storage.from(Env.supabaseimagebucket).upload(dir, image.value! , fileOptions: const FileOptions(upsert: true));
        uploadedPath=path;
      }

      // Update User Profile
      await SupabaseService.SupabaseClientclient.auth.updateUser(UserAttributes(data: {
        "description":description,
        "image":uploadedPath.isNotEmpty ? uploadedPath : null
      }));
      loading.value=false;
      Get.back();
      showSnackBar("Success", "Profile Updated Successfully!");
    }on StorageException catch(error){
      showSnackBar("Error", error.message);
    } on AuthException catch(error){
      showSnackBar("Error", error.message);
    } catch(error){
      showSnackBar("Error", "Something went wrong");
    }
  }



  // pick image
void pickImage() async{
  File? file = await pickImageFromGallery();
  if(file!= null) image.value=file;
}
}