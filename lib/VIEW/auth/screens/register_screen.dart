import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_course_final_project/VIEW_MODEL/auth_provider.dart';

import '../../../SERVICES/app_imports.dart';
import '../widget/default_button.dart';
import '../widget/default_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = 'RegisterScreen';
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60.h,
          elevation: 0,
          backgroundColor: greenColor,
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          'REGISTER'.tr(),
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        CustomText(
                          'register now to browse our hot offer'.tr(),
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.sp,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        DefaultTextFormField(
                            controller: usernameController,
                            keyboardType: TextInputType.text,
                            validateText: 'UserName Must Not Be Empty'.tr(),
                            labelText: "User Name".tr(),
                            prefix: Icons.person_rounded),
                        SizedBox(
                          height: 10.h,
                        ),
                        DefaultTextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validateText: "Email Address Must Not Be Empty".tr(),
                            labelText: "Email Address".tr(),
                            prefix: Icons.email),
                        SizedBox(
                          height: 10.h,
                        ),
                        DefaultTextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          // isPassword: AppCubit.get(context).isPassword,
                          validateText: "Password  Must Not Be Empty".tr(),
                          labelText: "Password".tr(),
                          prefix: Icons.lock,
                          // suffix: AppCubit.get(context).suffix,
                          // suffixPressed: () {}
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        DefaultTextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validateText: "Phone Must Not Be Empty".tr(),
                            labelText: "Phone".tr(),
                            prefix: Icons.phone),
                        SizedBox(
                          height: 15.h,
                        ),
                        authProvider.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : DefaultButton(
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    authProvider.register(
                                      userName: usernameController.text.trim(),
                                      email: emailController.text.trim(),
                                      phone: phoneController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                  }
                                },
                                title: "REGISTER".tr())
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
