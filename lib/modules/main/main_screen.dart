import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helpers/colors_helper.dart';
import '../../Utils/utils.dart';
import 'main_controller.dart';
import 'pray_times/pray_times_screen.dart';
import 'qibla_compase/qibla_compase.dart';
import 'quran/quran_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final mainController = Get.put(MainController());
  late final _mPages;

  void _onItemTapped(int index) {
    mainController.changeBottomNavigationBar(index);
  }

  @override
  void initState() {
    super.initState();
    _mPages = <Widget>[
      const QuranScreen(),
      const PrayTimesScreen(),
      QiblahCompassScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: mainController,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "${mainController.bottomNavIcon[mainController.currantPageIndex].label}",
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              bottom: mainController.currantPageIndex == 0
                  ? TabBar(
                      tabs: controller.tabs.map((e) => Text(e.name)).toList(),
                      controller: controller.tabController,
                    )
                  : null,
            ),
            body: _mPages[mainController.currantPageIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: mainController.bottomNavIcon,
              selectedLabelStyle:
                  AppTextStyles.getMediumTextStyle(fontSize: 12),
              unselectedLabelStyle: AppTextStyles.getMediumTextStyle(
                  fontSize: 11,
                  colorValue: AssetsColors.color_text_gray_BDBBBB),
              currentIndex: mainController.currantPageIndex,
              selectedItemColor: AssetsColors.color_green_3EC4B5,
              onTap: _onItemTapped,
            ),
          );
        });
  }
}
