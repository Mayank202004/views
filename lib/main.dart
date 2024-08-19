import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:views/routes/route.dart';
import 'package:views/routes/route_name.dart';
import 'package:views/services/storage_service.dart';
import 'package:views/services/supabase_services.dart';
import 'package:views/themes/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  Get.put(SupabaseService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      getPages: Routes.pages,
      initialRoute: StorageService.userSession != null ? RouteNames.Home : RouteNames.Login,
    );
  }
}

