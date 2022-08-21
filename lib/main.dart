import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_app/app/app.dart';
import 'package:islamic_app/modules/main/main_screen.dart';

import 'Helpers/colors_helper.dart';
import 'Helpers/fonts_helper.dart';
import 'app/bindings.dart';
import 'l10n/app_localization.dart';

// @dart=2.9
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Application();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (child, constraint) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: whiteColor,
            primaryColor: AssetsColors.color_green_3EC4B5,
            appBarTheme: AppBarTheme(
              iconTheme: const IconThemeData(color: blackColor),
              elevation: 0.0,
              backgroundColor: whiteColor,
              centerTitle: true,
              titleTextStyle: FontsAppHelper().avenirArabicHeavyFont(),
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Color(0x33FFFFFF),
                // Status bar brightness (optional)
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)xw
              ),
            ),
            tabBarTheme: TabBarTheme(
              labelColor: blueColor,
              labelStyle: FontsAppHelper().avenirArabicMediumFont(),
              unselectedLabelStyle: FontsAppHelper().avenirArabicMediumFont(),
              unselectedLabelColor: const Color(0xff8A8A8F
                  // 0xffBDBBBB,
                  ),
              indicator: const UnderlineTabIndicator(),
            ),
          ),
          initialBinding: Binding(),
          navigatorKey: Application.navigatorKey,
          // set property
          localizationsDelegates: AppLocalization.localizationsDelegates,
          supportedLocales: AppLocalization.all,
          locale: const Locale('ar'),
          // home: const  MainScreen(),
          initialRoute: '/',
          getPages: [
            GetPage(
              name: '/',
              page: () => const MainScreen(),
            ),
          ],

          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
