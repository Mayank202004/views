
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends GetxService{
  static final SupabaseClientclient = Supabase.instance.client;
}