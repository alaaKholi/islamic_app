// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../main_controller.dart';

// class QuranController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   var tabs = [QuranTabs.Surah, QuranTabs.Juz];
//   late TabController tabController;
//   int _selectedIndex = 0;
//   @override
//   void onClose() {
//     // called just before the Controller is deleted from memory
//     tabController.dispose();
//     super.onClose();
//   }

//   @override
//   void onInit() {
//     tabController = TabController(length: tabs.length, vsync: this);
//     super.onInit();
//   }
// }
