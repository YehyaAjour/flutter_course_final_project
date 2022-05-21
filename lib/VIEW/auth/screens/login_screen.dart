import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_course_final_project/VIEW/auth/screens/register_screen.dart';
import 'package:flutter_course_final_project/VIEW/auth/widget/default_text_form_field.dart';
import '../../../SERVICES/app_imports.dart';
import '../../../VIEW_MODEL/auth_provider.dart';
import '../widget/default_button.dart';


class LoginScreen extends StatelessWidget {
  static String routeName = 'LoginScreen';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);

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
                      validateText: "Email Address Must Not Be Empty".tr(),
                      labelText: "Email Address".tr(),
                      prefix: Icons.email),
                  SizedBox(
                    height: 15.h,
                  ),
                  DefaultTextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      // isPassword: AppCubit.get(context).isPassword,
                      validateText: "Password  Must Not Be Empty".tr(),
                      labelText: "Password".tr(),
                      prefix: Icons.lock,
                      // suffix: AppCubit.get(context).suffix,
                      suffixPressed: () {
                        // AppCubit.get(context).changePasswordVisability();
                      }),
                  SizedBox(
                    height: 30.h,
                  ),
                  authProvider.isLoading?const Center(child: CircularProgressIndicator()):DefaultButton(
                      title: 'LOGIN'.tr(),
                      onPressed: () {
                        authProvider.login(email: emailController.text.trim(),password: passwordController.text.trim());
                        // NavigationHelper.navigationHelper
                        //     .pushMethod(MainScreen.routeName);
                      }),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        "Dont Have An Account? ".tr(),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      TextButton(
                        onPressed: () {
                          NavigationHelper.navigationHelper
                              .pushMethod(RegisterScreen.routeName);
                        },
                        child: CustomText(
                          "Register Now".tr(),
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
