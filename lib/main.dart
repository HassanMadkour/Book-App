import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/constants.dart';
import 'package:project/core/utils/functions/hive_setup.dart';
import 'package:project/core/utils/functions/locator_service.dart';
import 'package:project/core/utils/routing.dart';
import 'package:project/core/utils/simple_bloc_observer.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await hiveSetup();

  runApp(
          // DevicePreview(builder: (context) =>
          const BookApp())
      // )
      ;
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
