import 'package:get/get.dart';
import 'package:views/services/supabase_services.dart';

class HomeController extends GetxController{
  var loading=false;

  @override
  void onInit() async{
    await fetchPosts();
    super.onInit();
  }

  // THis function is used to get all the posts from db
  Future<void> fetchPosts() async{
    loading=true;
    final response = await SupabaseService.SupabaseClientclient.from("posts").select(''' 
    id,content,image,created_at,like_count,comment_count,user_id,
    user:user_id (email,metadata)
     ''').order("id",ascending: false);


  }
}