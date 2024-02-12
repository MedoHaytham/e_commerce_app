import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/layout/cubit/cubit.dart';
import 'package:e_commerce_app/layout/cubit/states.dart';
import 'package:e_commerce_app/modules/login%20&%20register/login_screen.dart';
import 'package:e_commerce_app/shared/bloc_observer.dart';
import 'package:e_commerce_app/shared/styles/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
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
    return BlocProvider(
      create: (context) => EcommerceCubit(),
      child: BlocConsumer<EcommerceCubit, EcommerceStates>(
        listener: (context, state) { },
        builder: (context, state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: KmainColor,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              appBarTheme: AppBarTheme(
                color: HexColor('333739'),
                elevation: 0,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: KmainColor,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                bodyText2: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                caption: TextStyle(
                  color: Colors.white60,
                ),
              ),
            ),
            themeMode: EcommerceCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: EcommerceLayout(),
          );
        },
      ),
    );
  }
}
