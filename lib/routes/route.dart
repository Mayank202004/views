import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:views/routes/route_name.dart';
import 'package:views/views/profile/editProfile.dart';
import 'package:views/views/reply/addReply.dart';
import 'package:views/views/settings/setting.dart';

import '../auth/login.dart';
import '../auth/signup.dart';
import '../views/home.dart';

class Routes{
  static final pages = [
    GetPage(name: RouteNames.Home,page: () => Home()),
    GetPage(name: RouteNames.Login, page: () =>Login()),
    GetPage(name: RouteNames.Signup, page: () =>Signup()),
    GetPage(name: RouteNames.EditProfile, page: () =>Editprofile(),transition: Transition.leftToRight),
    GetPage(name: RouteNames.Settings, page: () =>Setting(),transition: Transition.rightToLeft),
    GetPage(name: RouteNames.AddReply, page: () =>AddReply(),transition: Transition.downToUp),
  ];
}