import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:views/controller/viewsController.dart';
import 'package:views/services/navigation_service.dart';
import 'package:views/services/supabase_services.dart';
import 'package:views/widgets/imageAvatar.dart';

class AddView extends StatelessWidget {
  AddView({super.key});
  final SupabaseService supabaseService=Get.find<SupabaseService>();
  final ViewsController viewsController = Get.put(ViewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xff242424)))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.find<NavigationService>().backToPrevPage();
                          },
                          icon: const Icon(Icons.close)
                      ),
                      const SizedBox(width: 10,),
                      const Text("Add View",style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Obx(() =>
                      TextButton(
                        onPressed: (){
                          if(viewsController.content.value.isNotEmpty){
                            viewsController.post(Get.find<SupabaseService>().currentUser.value!.id);
                          }
                        },
                        child: viewsController.loading.value ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator.adaptive(),
                        ) : Text("Post",style: TextStyle(fontSize: 15, fontWeight: viewsController.content.value.isNotEmpty ? FontWeight.bold : FontWeight.normal),
                        )
                      ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(
                  width: 5,
                ),
                Obx(()=>ImageAvatar(
                radius: 20,
                url: supabaseService.currentUser.value!.userMetadata?["image"],)
              ),
                const SizedBox(width: 10,),
                SizedBox(
                  width: context.width * 0.80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(()=> Text(
                        supabaseService.currentUser.value!.userMetadata?["name"])
                      ),
                      TextField(
                        autofocus: true,
                        controller: viewsController.textEditingController,
                        onChanged: (value) => viewsController.content.value=value,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 10,
                        minLines: 1,
                        maxLength: 1000,
                        decoration: const InputDecoration(
                          hintText: "Share your views",
                          border: InputBorder.none
                        ),
                      ),
                      GestureDetector(
                          onTap: () => viewsController.pickImage(),
                          child: const Icon(Icons.attach_file)),

                      // To preview selected image
                      Obx(()=>
                          Column(
                            children: [
                              if(viewsController.image.value != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          viewsController.image.value!,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                      Positioned(
                                          right: 10,
                                          top: 10,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white38,
                                            child: IconButton(onPressed:() {viewsController.image.value=null;},icon: const Icon(Icons.close)),
                                      ))
                                    ],
                                  ),
                                ),
                            ],
                          ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ))
    );
  }
}
