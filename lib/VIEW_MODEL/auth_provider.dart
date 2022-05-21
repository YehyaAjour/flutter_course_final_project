import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_course_final_project/MODEL/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../SERVICES/app_imports.dart';
import '../SERVICES/helper.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;

  setLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  register({
    String userName,
    String email,
    String password,
    String phone,
  }) async {
    try {
      setLoading();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      userCreate(uId: userCredential.user.uid,phone: phone,email: email,name: userName);
      setLoading();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        setLoading();
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        setLoading();
      }
    } catch (e) {
      print(e);
      setLoading();
    }
  }

  login({
    String email,
    String password,
  }) async {
    try {
      setLoading();
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user.email != null) {
        setLoading();
        print(userCredential.user);
        Helper.setToastSucesses(msg: 'تم تسجيل الدخول بنجاح');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setLoading();
        Helper.setToastError(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        setLoading();
        Helper.setToastError(msg: 'Wrong password provided for that user.');
      }
    }
  }

  userCreate({
    String uId,
    String name,
    String email,
    String phone,
  }) async {
    setLoading();
    UserModel userModel =
        UserModel(email: email, name: name, phone: phone, uId: uId);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      setLoading();
    }).catchError((e) {
      setLoading();
    });
  }
}
