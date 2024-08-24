import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReplyController extends GetxController{
  final TextEditingController replyController = TextEditingController(text: "");
  var loading = false.obs;
  var reply = "".obs;

  @override
  void onCLose(){
    replyController.dispose();
        super.onClose();
  }
}