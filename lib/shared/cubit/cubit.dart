
import 'package:e_commerce_app/shared/cubit/states.dart';
import 'package:e_commerce_app/shared/network/local/cache_helper.dart';
import 'package:e_commerce_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  /////vars
  bool isDark = false;

  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(EcommerceChangeModeState());
    } else {
      isDark = !isDark;
      cacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(EcommerceChangeModeState());
      });
    }
  }
}
