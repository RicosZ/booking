import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:url_strategy/url_strategy.dart';

import 'constants/colors.dart';
import 'package:get_storage/get_storage.dart';

import 'modules/bindings/home_binding.dart';
import 'modules/views/home_view.dart';
import 'routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  await initializeDateFormatting();
  // setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'คืนสู่เหย้า เรารักเภสัชมอขอ',
      debugShowCheckedModeBanner: false,
      //showPerformanceOverlay: true, //กดเปิดเพื่อดูประสิทธิภาพ ms per frame
      theme: Palette.themeData,
      home: const HomeView(),
      initialRoute: '/home',
      initialBinding: HomeBinding(),
      getPages: AppPage.routes,
      fallbackLocale:
          const Locale('th', 'TH'), //หากไม่มีภาษาที่เรียกใช้ให้มาภาษานี้แทน
    );
  }
}
