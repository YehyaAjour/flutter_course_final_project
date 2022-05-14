



import '../../../SERVICES/app_imports.dart';
import '../widget/default_button.dart';
import '../widget/default_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var usernameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        elevation: 0,
        backgroundColor: greenColor,
        leading: BackButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
        )),
      body: Column(
        children: [
          SizedBox(height: 100.h,),
          Padding(
            padding:  EdgeInsets.all(16.0.w),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'REGISTER',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      CustomText(
                        'register now to browse our hot offer',
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
                          validateText: 'UserName Must Not Be Empty',
                          labelText: "User Name",
                          prefix: Icons.person_rounded),
                      SizedBox(
                        height: 10.h,
                      ),
                      DefaultTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validateText: "Email Address Must Not Be Empty",
                          labelText: "Email Address",
                          prefix: Icons.email),
                      SizedBox(
                        height: 10.h,
                      ),
                      DefaultTextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          // isPassword: AppCubit.get(context).isPassword,
                          validateText: "Password  Must Not Be Empty",
                          labelText: "Password",
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
                          validateText: "Email Address Must Not Be Empty",
                          labelText: "Phone",
                          prefix: Icons.phone),
                      SizedBox(
                        height: 15.h,
                      ),
                      DefaultButton(
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                            }
                          },
                          title: "REGISTER")
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
