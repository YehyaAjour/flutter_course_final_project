import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_course_final_project/MODEL/user_model.dart';
import 'package:flutter_course_final_project/VIEW/auth/screens/login_screen.dart';
import 'package:flutter_course_final_project/VIEW/main_screen/screens/main_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../SERVICES/app_imports.dart';
import '../SERVICES/progress_dialog_utils.dart';
import '../SERVICES/sp_helper.dart';
import '../SERVICES/helper.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider(){
    getUserData();

  }
  UserModel model;

  void getUserData() {
    String token = SPHelper.spHelper.getToken();

    ProgressDialogUtils.show();

    FirebaseFirestore.instance
        .collection('users')
        .doc(token)
        .get()
        .then((value) {
      print(value.data());
      model=UserModel.fromJson(value.data());
      ProgressDialogUtils.hide();
    }).catchError((e) {
      ProgressDialogUtils.hide();
    });
  }

  userCreate({
    String uId,
    String name,
    String email,
    String phone,
  }) async {
    ProgressDialogUtils.show();
    UserModel userModel = UserModel(
        email: email,
        name: name,
        phone: phone,
        uId: uId,
        image:
            'https://media-exp1.licdn.com/dms/image/C5603AQEGpL-pXwsXaQ/profile-displayphoto-shrink_800_800/0/1637263394180?e=1657756800&v=beta&t=iJEYwp8oZA1C7a78aO3Lt6KdnsjiIs_n5wJLrwSr8tw');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      ProgressDialogUtils.hide();
    }).catchError((e) {
      ProgressDialogUtils.hide();
    });
  }

  logout() async {
    try {
      ProgressDialogUtils.show();
      await FirebaseAuth.instance.signOut();
      SPHelper.spHelper.setToken('');
      ProgressDialogUtils.hide();
      NavigationHelper.navigationHelper.pushMethod(LoginScreen.routeName);
      Helper.setToastSucesses(msg: 'تم تسجيل الخروج بنجاح');
    } catch (e) {
      ProgressDialogUtils.hide();
      Helper.setToastError(msg: e.toString());
    }
  }
}
