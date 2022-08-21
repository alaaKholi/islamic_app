import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:islamic_app/utils/utils.dart';

import '../../Helpers/assets_helper.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int currantPageIndex = 0;
  var bottomNavIcon = [
    BottomNavigationBarItem(
      label: Utils.getString().quran,
      icon: SvgPicture.asset(
        AssetsHelper.ic_tab_quran_svg,
        height: 30,
        width: 10,
      ),
      activeIcon: SvgPicture.asset(
        AssetsHelper.ic_tab_quran_svg,
        height: 30,
        width: 10,
      ),
    ),
    BottomNavigationBarItem(
      label: Utils.getString().pray,
      icon: SvgPicture.asset(
        AssetsHelper.ic_tab_pray_svg,
        height: 30,
        width: 10,
      ),
      activeIcon: SvgPicture.asset(
        AssetsHelper.ic_tab_pray_svg,
        fit: BoxFit.fill,
        height: 30,
        width: 10,
      ),
    ),
    BottomNavigationBarItem(
      label: Utils.getString().qibla,
      icon: SvgPicture.asset(
        AssetsHelper.ic_tab_kabba_svg,
        height: 30,
        width: 10,
      ),
      activeIcon: SvgPicture.asset(
        AssetsHelper.ic_tab_kabba_svg,
        fit: BoxFit.fill,
        height: 30,
        width: 10,
      ),
    )
  ];

  changeBottomNavigationBar(int value) {
    currantPageIndex = value;
    update();
  }

  var tabs = [QuranTabs.Surah, QuranTabs.Juz];
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    tabController.dispose();
    super.onClose();
  }
}

enum QuranTabs {
  Surah,
  Juz,
}
