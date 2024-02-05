import 'package:e_commerce_app/modules/login%20&%20register/login_cubit.dart';
import 'package:e_commerce_app/modules/login%20&%20register/login_states.dart';
import 'package:e_commerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/e_commerce_layout.dart';
import '../../shared/fade_animation.dart';
import '../home_screen.dart';
import '../../shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state)
        {

          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: myGradient,
              ),
              child: Column(
                children:
                [
                  Container(
                      margin: const EdgeInsets.only(top: 90),
                      child: const FadeAnimation(
                        2,
                        Image(
                          image: AssetImage('assets/images/buy.png'),
                        ),
                      )
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)
                              )
                          ),
                          margin: const EdgeInsets.only(top: 40),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  // color: Colors.red,
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(left: 22, bottom: 20),
                                    child: const FadeAnimation(
                                      2,
                                      Row(
                                        children: [
                                          Text(
                                            "",
                                            style: TextStyle(
                                                fontSize: 35,
                                                color: Colors.black87,
                                                letterSpacing: 2,
                                                fontFamily: "Lobster"),
                                          ),
                                          Text(
                                            'Login',
                                            style: TextStyle(
                                              fontSize: 35,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                                FadeAnimation(
                                  2,
                                  customFormField(
                                      hintText: 'Email',
                                      controller: emailController,
                                      type: TextInputType.text,
                                      prefix: Icons.email_outlined,
                                      validate: (String value)
                                      {
                                        if(value.isEmpty)
                                        {
                                          return 'Please enter your email';
                                        }
                                      }
                                  ),
                                ),
                                FadeAnimation(
                                  2,
                                  customFormField(
                                      hintText: 'Password',
                                      controller: passwordController,
                                      type: TextInputType.text,
                                      prefix: Icons.lock_outline,
                                      isPassword: cubit.isPassword,
                                      suffix: cubit.isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                      suffixPressed: ()
                                      {
                                        cubit.changePasswordVisibility();
                                      },
                                      validate: (String value)
                                      {
                                        if(value.isEmpty)
                                        {
                                          return 'Please enter your password';
                                        }
                                      }
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                FadeAnimation(
                                  2,
                                  ElevatedButton(
                                    onPressed: ()
                                    {
                                      if(formKey.currentState!.validate())
                                      {
                                        navigateAndFinsh(context,EcommerceLayout());
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.purpleAccent,
                                      shadowColor: Colors.purpleAccent,
                                      elevation: 18,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                    ),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors:
                                          [
                                            Colors.purpleAccent,
                                            Colors.deepPurpleAccent,
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                FadeAnimation(
                                  2,

                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "if you don't have account you can ",
                                          style: TextStyle(
                                              color: Colors.black54, fontSize: 15),
                                        ),
                                        TextButton(
                                          onPressed: ()
                                          {

                                          },
                                          child: const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              color: Colors.purple,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
