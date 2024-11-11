import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/core/utils/locator_service.dart';
import 'package:project/core/utils/routing.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const BookApp()));
  setupGetIt();
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    kScreenHight = MediaQuery.of(context).size.height;
    kScreenWidth = MediaQuery.of(context).size.width;
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
    );
  }
}
