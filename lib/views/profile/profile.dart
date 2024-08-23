import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:views/routes/route_name.dart';
import 'package:views/services/supabase_services.dart';
import 'package:views/widgets/imageAvatar.dart';

import '../../controller/profileController.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ProfileController controller = Get.put(ProfileController());
  final SupabaseService supabaseService = Get.find<SupabaseService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Icon(Icons.language),
          centerTitle: false,
          actions: [IconButton(onPressed: () => Get.toNamed(RouteNames.Settings), icon: const Icon(Icons.sort))],
      ),
      body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 160,
                    collapsedHeight: 160,
                    automaticallyImplyLeading: false,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child:Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(() => Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          supabaseService.currentUser.value!.userMetadata?["name"],
                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                        SizedBox(
                                            width: context.width * 0.70,
                                            child: Text(supabaseService.currentUser.value?.userMetadata?["description"] ?? "This is description of user. The user can add his own description here")),
                                      ],
                                    ),
                                  ),
                                  ImageAvatar(file:controller.image.value,radius: 40,url: supabaseService.currentUser.value?.userMetadata?["image"],),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(child: OutlinedButton(
                                      onPressed: () =>Get.toNamed(RouteNames.EditProfile),
                                      child: const Text("Edit Profile"))),
                                  const SizedBox(width: 20,),
                                  Expanded(child: OutlinedButton(
                                      onPressed: (){}, child: const Text("Share Profile")))
                                ],
                              )
                            ],
                          ),
                    ),
                  ),
                  SliverPersistentHeader(
                    floating: true,
                      pinned: true,
                      delegate: SliverAppBarDeligate(TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Colors.lightBlue[200],
                          tabs: const [
                            Tab(text: "Views",),
                            Tab(text: "Comments",),
                  ])))
                ];
              },
              body: const TabBarView(
                children: [
                  Text("data"),
                  Text("data")
              ],
              ),
          ),
      ),
    );
  }
}


// Sliver Pesistent Header Class
class SliverAppBarDeligate extends SliverPersistentHeaderDelegate{
  final TabBar _tabBar;
  SliverAppBarDeligate(this._tabBar);

  @override
  // TODO: implement maxExtent
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
   return Container(
     color: Colors.black,
     child: _tabBar,
   );

  }

}