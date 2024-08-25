import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:views/controller/homeController.dart';
import 'package:views/widgets/loading.dart';
import 'package:views/widgets/postCard.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RefreshIndicator(
          onRefresh: () => controller.fetchPosts(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset("assets/images/logo_png.png",width: 40,height: 40,),
                ),
                centerTitle: true,
              ),
              SliverToBoxAdapter(
                child: Obx(()=> controller.loading.value ? const Loading() : ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.posts.length,
                  itemBuilder: (BuildContext context, int index) => PostCard(post: controller.posts[index]),
          
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

