import 'package:e_commerce_app/layout/cubit/cubit.dart';
import 'package:e_commerce_app/layout/cubit/states.dart';
import 'package:e_commerce_app/modules/user_screen.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:e_commerce_app/shared/cubit/cubit.dart';
import 'package:e_commerce_app/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget
{
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => EcommerceCubit(),
      child: BlocConsumer<EcommerceCubit, EcommerceStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = EcommerceCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Profile',
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    const Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AccountItem(
                      image: 'assets/images/geralt.jpg',
                      press: ()
                      {
                        navigateTo(context, const UserScreen());
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SettingsItem(
                      title: 'Language',
                      icon: Icons.language_outlined,
                      value: 'English',
                      press: ()
                      {

                      },
                    ),
                    SettingsItem(
                      title: 'Notifications',
                      icon: Icons.notifications_on_outlined,
                      press: ()
                      {

                      },
                    ),
                    SettingsItem(
                      title: 'Help Center',
                      icon: Icons.help_outline,
                      press: ()
                      {

                      },
                    ),
                    SettingsSwitch(
                      title: 'Dark Mode',
                      icon: Icons.brightness_2_outlined,
                      isDark: AppCubit.get(context).isDark,
                      context: context,
                      onTap: (isDark)
                      {
                        EcommerceCubit.get(context).changeDarkModeButton();
                        AppCubit.get(context).changeAppMode();
                      },
                      press: ()
                      {
                        EcommerceCubit.get(context).changeDarkModeButton();
                        AppCubit.get(context).changeAppMode();
                      },
                    ),
                    SettingsItem(
                      title: 'Log out',
                      icon: Icons.logout_outlined,
                      press: ()
                      {

                      },
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

  Widget AccountItem({
    required String image,
    required GestureTapCallback press,
  }) => InkWell(
    onTap: press,
    child: SizedBox(
      width: double.infinity,
      child: Row(
        children:
        [
          SizedBox(
            width: 70,
            height: 70,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                image,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            'User Name',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    ),
  );

  Widget SettingsItem({
    required String title,
    required IconData icon,
    required GestureTapCallback press,
    String? value,
  })=> InkWell(
    onTap: press,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children:
          [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF5F6F9),
              ),
              child: Icon(
                icon,
                color: KmainColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            if(value != null)
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    ),
  );

  Widget SettingsSwitch({
    required String title,
    required IconData icon,
    required bool isDark,
    required BuildContext context,
    required Function(bool isDark) onTap,
    required GestureTapCallback press,
  })=> InkWell(
    onTap: press,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children:
          [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF5F6F9),
              ),
              child: Icon(
                icon,
                color: KmainColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              isDark ? 'On': 'Off',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            CupertinoSwitch(
              value: isDark,
              onChanged: onTap,
            ),
          ],
        ),
      ),
    ),
  );

}

