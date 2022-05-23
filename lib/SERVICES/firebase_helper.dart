import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_course_final_project/SERVICES/sp_helper.dart';

class FirebaseHelper{
  FirebaseHelper._();
  static FirebaseHelper firebaseHelper = FirebaseHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String orderCollectionName = 'Orders';

  addOrderToFireStore(
      {Map orders, String price,bool isAccepted=false,bool delivered=false}) async {
    List itemsCart =[];
    orders.forEach((key, value) {
      itemsCart.add({
        'ProductName':value.name,
        'ProductPrice':value.price,
        'ProductQuantity':value.quantity,
      });
    });
    String orderId =firestore.collection(orderCollectionName).doc().id;
    await firestore
        .collection(orderCollectionName)
        .doc(orderId)
        .set({
      'UserId':SPHelper.spHelper.getToken()??'',
      'UserName':SPHelper.spHelper.getToken()??'',
      'OrderId':orderId,
      'Order':FieldValue.arrayUnion(itemsCart),
      'Total Price':price,
      'IsAccepted':isAccepted,
      'IsDelivered':delivered,
    });
  }
}