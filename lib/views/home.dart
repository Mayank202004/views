import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:views/services/navigation_service.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final NavigationService navigationService = Get.put(NavigationService());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: NavigationBar(
              selectedIndex: navigationService.currentIndex.value,
              onDestinationSelected: (value) =>
                  navigationService.updateCurrentIndex(value),
              destinations: const<Widget>[
                NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    label: "Home",
                    selectedIcon: Icon(Icons.home_filled),),
                NavigationDestination(
                  icon: Icon(Icons.search_outlined),
                  label: "Search",
                  selectedIcon: Icon(Icons.search),),
                NavigationDestination(
                  icon: Icon(Icons.add_outlined),
                  label: "Add",
                  selectedIcon: Icon(Icons.add),),
                NavigationDestination(
                  icon: Icon(Icons.favorite_outlined),
                  label: "Notification",
                  selectedIcon: Icon(Icons.favorite),),
                NavigationDestination(
                  icon: Icon(Icons.person_2_outlined),
                  label: "Profile",
                  selectedIcon: Icon(Icons.person_2),),
              ]
          ),
          body: AnimatedSwitcher(
            duration: const Duration(microseconds: 500),
            child: navigationService.pages()[navigationService.currentIndex.value],
          ),
        )
    );
  }


}