import 'package:e_commerce_app/layout/cubit/cubit.dart';
import 'package:e_commerce_app/layout/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/styles/colors.dart';

class EcommerceLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EcommerceCubit(),
      child: BlocConsumer<EcommerceCubit, EcommerceStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          Size size = MediaQuery.of(context).size;
          var cubit = EcommerceCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: Container(
              alignment:Alignment.center,
              height: 360 * 0.155,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow:
                  [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 30,
                      offset: Offset(0, 10),
                    ),
                  ]
              ),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    cubit.changeBottom(index);
                    print(size.width);
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.0422,
                        ),
                        width: size.width * 0.128,
                        height: index == cubit.currentIndex ? 360 * 0.014 : 0,
                        decoration: BoxDecoration(
                            color: KmainColor,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10),
                            )
                        ),
                      ),
                      SvgPicture.asset(
                        cubit.icons[index],
                        width: 360 * 0.076,
                        color: index == cubit.currentIndex ? KmainColor : Colors.black38,
                      ),
                      SizedBox(
                        height: 360 * 0.03,
                      ),
                    ],
                  ),
                ),
                itemCount: cubit.screens.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
