import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:views/controller/homeController.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),),
      body: const Center(
        child: Text("This is home"),
      ),
    );
  }
}
