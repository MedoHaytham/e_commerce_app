import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  bool isUpperCase = true,
  double radius = 20,
  double height = 56,
  required Function function,
  required String text,

}) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    color: KmainColor,
    borderRadius: BorderRadius.circular(radius),
  ),
  child: MaterialButton(
    onPressed: (){
      function();
    },
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

Widget defaultTextButton({
  required Function function,
  required String text,
}) => TextButton(
  onPressed: ()
  {
    function();
  },
  child: Text(text.toUpperCase()),
);

Widget defaultFormField({

  required String labelText,
  required TextEditingController controller,
  required TextInputType type,
  IconData? prefix,
  Function? validate,
  IconData? suffix,
  bool isPassword = false,
  Function ?suffixPressed,
  Function ?onTap,
  Function ?onChange,

}) => TextFormField(
    keyboardType: type,
    controller: controller,
    obscureText:  isPassword,
    validator: (s)
    {
      return validate!(s);
    },
  decoration: InputDecoration(
      border: InputBorder.none,
      hintText: labelText,
      prefixIcon: Icon(
          prefix,
      ),
      suffixIcon: suffix != null ? IconButton(
        icon: Icon(
          suffix,
        ),
        onPressed: ()
        {
          suffixPressed!();
        },
      ) : null
  ),
  onTap: ()
  {
    onTap!();
  },

  onChanged:(value)
  {
    onChange!(value);
  },
);


Widget customFormField({
  required String hintText,
  required TextEditingController controller,
  required TextInputType type,
  IconData? prefix,
  Function? validate,
  IconData? suffix,
  bool isPassword = false,
  Function ?suffixPressed,
  Function ?onTap,
  Function ?onChange,
})=> Container(
  width: double.infinity,
  height: 70,
  margin: const EdgeInsets.symmetric(
  horizontal: 20, vertical: 20,
  ),
  padding: const EdgeInsets.symmetric(
    vertical: 6,
  ),
  decoration: BoxDecoration(
  border: Border.all(
  color: KmainColor, width: 1
  ),
  boxShadow: const [
  BoxShadow(
      color: KmainColor,
      blurRadius: 10,
      offset: Offset(1, 1),
    ),
  ],
    color: Colors.white,
    borderRadius: const BorderRadius.all(
    Radius.circular(20),
  ),
),
  child: Container(
    margin: const EdgeInsets.only(left: 10),
    child: TextFormField(
      keyboardType: type,
      controller: controller,
      obscureText:  isPassword,
      validator: (s)
      {
        return validate!(s);
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null ? IconButton(
            icon: Icon(
              suffix,
            ),
            onPressed: ()
            {
              suffixPressed!();
            },
          ) : null
      ),
      onTap: ()
      {
        onTap!();
      },

      onChanged:(value)
      {
        onChange!(value);
      },
    ),
  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.symmetric(
    horizontal:20,
  ),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);


void navigateTo(context, widget,) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinsh(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
  (route) => false,
);

void showToast({
  required String msg,
  required ToastStates state,
}) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}