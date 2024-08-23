import 'package:get/get.dart';
import 'package:views/routes/route_name.dart';
import 'package:views/services/storage_service.dart';
import 'package:views/services/supabase_services.dart';
import 'package:views/utils/storage_keys.dart';

class SettingController extends GetxController{
  void logout() async{
    // remove user session from local
    StorageService.session.remove(StorageKeys.userSession); // remove session from local storage
    await SupabaseService.SupabaseClientclient.auth.signOut(); // remove session from Supabase
    Get.offAllNamed(RouteNames.Login); // Remove all routes in stack memory and navigate to login page
  }
}