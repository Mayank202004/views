import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:views/routes/route_name.dart';
import 'package:views/services/storage_service.dart';
import 'package:views/services/supabase_services.dart';
import 'package:views/utils/helper.dart';
import 'package:views/utils/storage_keys.dart';

class AuthController extends GetxController{
  var signupLoading = false.obs;
  var loginLoading = false.obs;

  // Signup
  Future<void> signup(String name,String email,String password) async{
    try{
      signupLoading.value=true;
      final AuthResponse data = await SupabaseService.SupabaseClientclient.auth.signUp(
          email: email,
          password: password,
          data: {
            "name":name
          }
      );
      signupLoading.value=false;
      if(data.user!=null){
        StorageService.session.write(StorageKeys.userSession,data.session!.toJson());
        Get.offAllNamed(RouteNames.Home);
      }
    } on AuthException catch(error){
      signupLoading.value=false; // Turn off loading in case of exception
      showSnackBar("Error", error.message);
    }
  }


  // Login
Future<void> login(String email,String password) async{
    try{
      loginLoading.value=true;
      final AuthResponse response = await SupabaseService.SupabaseClientclient.auth.signInWithPassword(
          email: email,
          password: password);
      loginLoading.value=false;
      if(response.user!=null){
        StorageService.session.write(StorageKeys.userSession,response.session!.toJson());
        Get.offAllNamed(RouteNames.Home);
      }
    } on AuthException catch(error){
      loginLoading.value=false;
      showSnackBar("Error", error.message);
    }
}
}