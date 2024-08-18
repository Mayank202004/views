import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:views/routes/route_name.dart';
import 'package:views/services/storage_service.dart';
import 'package:views/services/supabase_services.dart';
import 'package:views/utils/helper.dart';
import 'package:views/utils/storage_keys.dart';

class AuthController extends GetxController{

  // Signup
  Future<void> signup(String name,String email,String password) async{
    try{
      final AuthResponse data = await SupabaseService.SupabaseClientclient.auth.signUp(
          email: email,
          password: password,
          data: {
            "name":name
          }
      );
      if(data.user!=null){
        StorageService.session.write(StorageKeys.userSession,data.session!.toJson());
        Get.offAllNamed(RouteNames.Home);
      }
    } on AuthException catch(error){
      showSnackBar("Error", error.message);
    }
  }


  // Login
Future<void> login(String email,String password) async{
    try{
      final AuthResponse response = await SupabaseService.SupabaseClientclient.auth.signInWithPassword(
          email: email,
          password: password);
      if(response.user!=null){
        StorageService.session.write(StorageKeys.userSession,response.session!.toJson());
        Get.offAllNamed(RouteNames.Home);
      }
    } on AuthException catch(error){
      showSnackBar("Error", error.message);
    }
}
}