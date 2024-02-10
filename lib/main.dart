import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/modules/login%20&%20register/login_screen.dart';
import 'package:e_commerce_app/shared/bloc_observer.dart';
import 'package:e_commerce_app/shared/styles/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'layout/e_commerce_layout.dart';

void main(){


  try {
    WidgetsFlutterBinding.ensureInitialized();
    if(Platform.isWindows)
    {
      WindowManager.instance.setMinimumSize(
        const Size(450, 760),
      );
    }
  } catch (e) {
    if (kIsWeb) {
      //running on web
    }
  }

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: KmainColor,
          unselectedItemColor: Colors.grey,
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      home: EcommerceLayout(),
    );
  }
}
