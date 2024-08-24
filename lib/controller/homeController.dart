import 'dart:convert';

import 'package:get/get.dart';
import 'package:views/models/postModel.dart';
import 'package:views/services/supabase_services.dart';

class HomeController extends GetxController{
  var loading=false.obs;
RxList<PostModel> posts = RxList<PostModel>();

  @override
  void onInit() async{
    await fetchPosts();
    super.onInit();
  }

  // THis function is used to get all the posts from db
  Future<void> fetchPosts() async{
    loading.value=true;
    final List<dynamic> response = await SupabaseService.SupabaseClientclient.from("posts").select(''' 
    id,content,image,created_at,like_count,comment_count,user_id,
    user:user_id (email,metadata)
     ''').order("id",ascending: false);
    loading.value=false;
    // If response is not empty then convert json to list using Model
    if(response.isNotEmpty){
      posts.value = [for(var item in response) PostModel.fromJson(item)];
    }


  }
}