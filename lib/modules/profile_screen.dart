import 'package:e_commerce_app/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children:
        [
          ProfilePic(
            image: 'assets/images/Camera_Icon.svg',
          ),
          const SizedBox(
            height: 20,
          ),
          ProfileMenu(
            icon: 'assets/images/User_Icon.svg',
            text: 'My account',
            press: ()
            {

            },
          ),
          ProfileMenu(
            icon: 'assets/images/Bell.svg',
            text: 'Notifications',
            press: ()
            {

            },
          ),
          ProfileMenu(
            icon: 'assets/images/Settings.svg',
            text: 'Settings',
            press: ()
            {

            },
          ),
          ProfileMenu(
            icon: 'assets/images/Question_mark.svg',
            text: 'Help Center',
            press: ()
            {

            },
          ),
          ProfileMenu(
            icon: 'assets/images/Log_out.svg',
            text: 'Log Out',
            press: ()
            {

            },
          ),
        ],
      ),
    );
  }

  Widget ProfilePic({
    required String image
  }) => Stack(
    alignment: Alignment.bottomRight,
    children:
    [
      SizedBox(
        width: 115,
        height: 115,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/images/geralt.jpg',
          ),
        ),
      ),
      SizedBox(
        width: 46,
        height: 46,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          elevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(
              color: Colors.white,
            ),
          ),
          color: Color(0xFFF5F6F9),
          onPressed: ()
          {

          },
          child: SvgPicture.asset(image),
        ),
      ),
    ],
  );

  Widget ProfileMenu({
    required String icon,
    required String text,
    required GestureTapCallback press,
  }) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
    child: MaterialButton(
      highlightElevation: 0,
      padding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      color: Color(0xFFF5F6F9),
      onPressed: press,
      child: Row(
        children:
        [
          SvgPicture.asset(
            icon,
            color: KmainColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              text,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    ),
  );
}

