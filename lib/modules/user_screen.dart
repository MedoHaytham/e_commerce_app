import 'package:e_commerce_app/layout/cubit/cubit.dart';
import 'package:e_commerce_app/layout/cubit/states.dart';
import 'package:e_commerce_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class UserScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EcommerceCubit(),
      child: BlocConsumer<EcommerceCubit, EcommerceStates>(
        listener: (context, state) { },
        builder: (context, state)
        {
          var cubit = EcommerceCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              leadingWidth: 70,
              title: Text(
                'Account',
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    height: 50,
                    decoration: BoxDecoration(
                      color: KmainColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () { },
                      icon: Icon(
                        Ionicons.checkmark,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    const SizedBox(
                      height: 20,
                    ),
                    EditItem(
                      title: 'Photo',
                      widget: Column(
                        children:
                        [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(
                                'assets/images/geralt.jpg',
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            style: TextButton.styleFrom(
                              foregroundColor: KmainColor,
                            ),
                            child: const Text(
                              'Upload Image',
                            ),
                          ),
                        ],
                      ),
                    ),
                    EditItem(
                      title: 'Name',
                      widget: TextField(
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: KmainColor
                                )
                            )
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    EditItem(
                      title: 'Gender',
                      widget: Row(
                        children:
                        [
                          InkWell(
                            onTap: ()
                            {
                              cubit.changeGenderToMan();
                            },
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: cubit.gender == 'man' ? KmainColor : Colors.grey.shade200,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Ionicons.male_outline,
                                color: cubit.gender == 'man' ? Colors.white : Colors.black,
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: ()
                            {
                              cubit.changeGenderToWoman();
                            },
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: cubit.gender == 'woman' ? KmainColor : Colors.grey.shade200,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Ionicons.female_outline,
                                color: cubit.gender == 'woman' ? Colors.white : Colors.black,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    EditItem(
                      title: 'Date of birth',
                      widget: TextField(
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: KmainColor
                            )
                          )
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    EditItem(
                      title: 'Email',
                      widget: TextField(
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: KmainColor
                                )
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget EditItem({
    required String title,
    required Widget widget
  }) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
    [
      Expanded(
        flex: 2,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      const SizedBox(
        width: 30,
      ),
      Expanded(
        flex: 4,
        child: widget,
      ),
    ],
  );
}
