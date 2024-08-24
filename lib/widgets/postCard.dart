import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:views/models/postModel.dart';
import 'package:views/routes/route_name.dart';
import 'package:views/utils/helper.dart';
import 'package:views/widgets/imageAvatar.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width * 0.12,
                child: ImageAvatar(radius: 30,url: post.user?.metadata?.image,),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                width: context.width * 0.80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(post.user!.metadata!.name!,style: const TextStyle(fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            const Text("9 hours Ago"),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz)),
                          ],
                        )
                      ],
                    ),
                    Text(post.content!),
                    const SizedBox(height: 10,),
                    if(post.image!=null)
                      ConstrainedBox(constraints: BoxConstraints(
                        maxHeight: context.height * 0.60,
                        maxWidth: context.width * 0.80
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(getBucketUrl(post.image!),fit: BoxFit.cover,alignment: Alignment.topCenter,),
                      ),
                      ),
                    Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
                        IconButton(onPressed: (){
                          Get.toNamed(RouteNames.AddReply,arguments: post);
                        }, icon: Icon(Icons.chat_bubble_outline)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.send_outlined)),
                      ],
                    ),
                    Row(
                      children: [
                        Text("${post.commentCount} replies"),
                        const SizedBox(width: 10,),
                        Text("${post.likeCount} likes"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            color: Color(0xff242424),
          )
        ],
      ),
    );
  }
}
