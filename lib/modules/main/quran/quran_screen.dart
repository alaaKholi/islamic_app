import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/modules/main/main_controller.dart';
import 'package:islamic_app/modules/main/quran/quran_controller.dart';
import 'package:islamic_app/modules/main/quran/tabs/juz_tab_widget.dart';
import 'package:islamic_app/modules/main/quran/tabs/surah_tab_widget.dart';
import 'package:quran/quran.dart' as quran;

class QuranScreen extends GetView<MainController> {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(controller: controller.tabController, children: const [SurahTabWidget(),JuzTabWidget()]);
  }
}
