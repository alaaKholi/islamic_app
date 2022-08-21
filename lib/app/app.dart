import 'package:flutter/cupertino.dart';

class Application {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Application instance = Application();
  static const pageSize = 20;
  // static Future<SharedPreferences> sharedPreferences =
  //     SharedPreferences.getInstance();

  // static SharedPreferences? staticSharedPreferences;

  // Application() {
    
  // }

  // void init() async {
  //   staticSharedPreferences ??= await sharedPreferences;
  // }
}
