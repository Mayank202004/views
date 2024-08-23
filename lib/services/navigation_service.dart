import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:views/views/home/home_page.dart';
import 'package:views/views/notification/notifications.dart';
import 'package:views/views/profile/profile.dart';
import 'package:views/views/search/search.dart';
import 'package:views/views/your_view/add_view.dart';

class NavigationService extends GetxService{
  var currentIndex=0.obs;
  var prevIndex= 0.obs;

  List<Widget> pages(){
    return[
      Homepage(),
      const Search(),
      AddView(),
      const Notifications(),
      const Profile(),
    ];
  }

  // Update current index function
  void updateCurrentIndex(int index){
    prevIndex.value = currentIndex.value;
    currentIndex.value = index;
  }

  // Back to previous page
void backToPrevPage(){
    currentIndex.value = prevIndex.value;
}
}