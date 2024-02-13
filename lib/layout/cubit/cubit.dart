import 'package:e_commerce_app/layout/cubit/states.dart';
import 'package:e_commerce_app/modules/categories_screen.dart';
import 'package:e_commerce_app/modules/home_screen.dart';
import 'package:e_commerce_app/modules/favorite_screen.dart';
import 'package:e_commerce_app/modules/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/cart_screen_bottom.dart';

class EcommerceCubit extends Cubit<EcommerceStates>
{
  EcommerceCubit() : super(EcommerceInitialState());

  static EcommerceCubit get(context) =>  BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens =
  [
    const HomeScreen(),
    const CartScreenBottm(),
    const CategoriesScreen(),
    const ProfileScreen(),
  ];

  List<String> icons =
  [
    'assets/images/shop.svg',
    'assets/images/Shopping_cart.svg',
    'assets/images/compass.svg',
    'assets/images/User_Icon.svg',
  ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(EcommerceChangeBottomState());
  }

  int imageIndex = 0;
  void changeImagePrev(int index)
  {
    imageIndex = index;
    emit(EcommerceChangeImagePrevState());
  }

  int colorIndex = 0;
  void changeColorPrev(int index)
  {
    colorIndex = index;
    emit(EcommerceChangeColorPrevState());
  }

  int numOfItem = 1;

  void plusCounter()
  {
    if(numOfItem < 99)
    {
      numOfItem++;
      emit(PlusCounterState());
    }
  }

  void minusCounter()
  {
    if(numOfItem > 1)
    {
      numOfItem--;
      emit(MinusCounterState());
    }
  }

  bool isReadMore = false;

  void changeReadButton()
  {
    isReadMore = !isReadMore;
    emit(ChangeReadButtonState());
  }

  bool isBottomDark = false;

  void changeDarkModeButton()
  {
    isBottomDark = !isBottomDark;
    emit(ChangeDarkModeButtonState());
  }

  String gender = 'man';
  void changeGenderToMan()
  {
    gender = 'man';
    emit(ChangeManState());
  }

  void changeGenderToWoman()
  {
    gender = 'woman';
    emit(ChangeWomanState());
  }

}
