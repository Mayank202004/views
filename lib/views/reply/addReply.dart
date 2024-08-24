import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:views/controller/replyController.dart';
import 'package:views/models/postModel.dart';
import 'package:views/widgets/imageAvatar.dart';

import '../../utils/helper.dart';

class AddReply extends StatelessWidget {
  AddReply({super.key});
  final PostModel post = Get.arguments;
  final ReplyController controller = Get.put(ReplyController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close)),
        title: const Text("Reply"),
        actions: [
          TextButton(onPressed: (){}, child: const Text("Reply"))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width * 0.12,
                  child: ImageAvatar(radius: 20,url: post.user?.metadata?.image,),
                ),
                const SizedBox(width: 10,),
                SizedBox(
                  width: context.width * 0.80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.user!.metadata!.name!,style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text(post.content!),
                      const SizedBox(height: 10,),
                      if(post.image != null)
                        ConstrainedBox(constraints: BoxConstraints(
                            maxHeight: context.height * 0.60,
                            maxWidth: context.width * 0.80
                        ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(getBucketUrl(post.image!),fit: BoxFit.cover,alignment: Alignment.topCenter,),
                          ),
                        ),
                      TextField(
                        autofocus: true,
                        controller: controller.replyController,
                        onChanged: (value) => controller.reply.value = value,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 10,
                        minLines: 1,
                        maxLength: 1000,
                        decoration: InputDecoration(
                            hintText: "Reply to ${post.user!.metadata!.name!}",
                            border: InputBorder.none
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
