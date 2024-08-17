import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:views/routes/route_name.dart';

import '../auth/login.dart';
import '../auth/signup.dart';
import '../views/home.dart';

class Routes{
  static final pages = [
    GetPage(name: RouteNames.Home,page: () => Home()),
    GetPage(name: RouteNames.Login, page: () =>Login()),
    GetPage(name: RouteNames.Signup, page: () =>Signup()),
  ];
}