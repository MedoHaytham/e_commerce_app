import 'dart:io';
import 'package:e_commerce_app/shared/bloc_observer.dart';
import 'package:e_commerce_app/shared/cubit/cubit.dart';
import 'package:e_commerce_app/shared/cubit/states.dart';
import 'package:e_commerce_app/shared/network/local/cache_helper.dart';
import 'package:e_commerce_app/shared/styles/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:window_manager/window_manager.dart';
import 'layout/e_commerce_layout.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await cacheHelper.init();
  bool? isDark = cacheHelper.getData(key: 'isDark');
  try {

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
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {

  final bool? isDark;

  const MyApp({super.key, 
    this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) { },
        builder: (context, state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
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
              colorScheme: ColorScheme.light(
                background: Colors.white,
                primary: KmainColor,
                secondary: Colors.black38,
                onSecondary: const Color(0xFFF5F6F9),
                onSurface: Colors.black.withOpacity(0.15),
              ),
              textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                titleMedium: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
                titleSmall: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                bodyMedium: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                bodySmall: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
            darkTheme: ThemeData(
              appBarTheme: AppBarTheme(
                color: HexColor('333739'),
                elevation: 0,
                centerTitle: true,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: KmainColor,
              colorScheme: ColorScheme.dark(
                background: HexColor('333739'),
                primary: Colors.white,
                secondary: Colors.grey,
                onSecondary:  Colors.grey.shade600,
                onSurface: const Color(0xFFDADADA).withOpacity(0.15),
              ),
              textTheme: TextTheme(
                titleLarge: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                titleMedium: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
                titleSmall: TextStyle(
                  fontSize: 16,
                  color: Colors.white60
                ),
                bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                bodyMedium: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                bodySmall: TextStyle(
                  color: Colors.white60,
                ),
              ),
            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const EcommerceLayout(),
          );
        },
      ),
    );
  }
}
