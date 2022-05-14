import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_final_project/VIEW/auth/screens/register_screen.dart';
import 'package:flutter_course_final_project/VIEW/auth/widget/default_text_form_field.dart';
import 'package:flutter_course_final_project/VIEW/custom_widget/custom_image.dart';
import 'package:flutter_course_final_project/VIEW/custom_widget/custom_text.dart';
import 'package:flutter_course_final_project/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../SERVICES/navigator_helper.dart';
import '../../main_screen/screens/main_screen.dart';
import '../widget/default_button.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'LoginScreen';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomPngImage(
                    imageName: 'login',
                    width: 180.w,
                    height: 130.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    'FRUIT MARKET',
                    color: greenColor,
                    fontSize: 35.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  DefaultTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validateText: "Email Address Must Not Be Empty",
                      labelText: "Email Address",
                      prefix: Icons.email),
                  SizedBox(
                    height: 15.h,
                  ),
                  DefaultTextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      // isPassword: AppCubit.get(context).isPassword,
                      validateText: "Password  Must Not Be Empty",
                      labelText: "Password",
                      prefix: Icons.lock,
                      // suffix: AppCubit.get(context).suffix,
                      suffixPressed: () {
                        // AppCubit.get(context).changePasswordVisability();
                      }),
                  SizedBox(
                    height: 30.h,
                  ),
                  DefaultButton(
                      title: 'LOGIN',
                      onPressed: () {
                        NavigationHelper.navigationHelper
                            .pushMethod(MainScreen.routeName);
                      }),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        "Dont Have An Account? ",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      TextButton(
                        onPressed: () {
                          NavigationHelper.navigationHelper
                              .pushMethod(RegisterScreen.routeName);
                        },
                        child: CustomText(
                          "Register Now",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: greenColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
