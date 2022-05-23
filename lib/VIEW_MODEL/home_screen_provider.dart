import 'package:cloud_firestore/cloud_firestore.dart';
import '../MODEL/favourite_item_model.dart';
import '../MODEL/vegetable_category_model.dart';
import '../SERVICES/app_imports.dart';
import '../SERVICES/progress_dialog_utils.dart';
import '../SERVICES/sp_helper.dart';


class HomeScreenProvider extends ChangeNotifier {
  HomeScreenProvider() {
    getHomeData();
  }

  List<VegetablesItemModel> vegetablesItemModel = [];
  FavouriteItemModel favouriteItemModel;

  void getHomeData() {
    // ProgressDialogUtils.show();

    FirebaseFirestore.instance
        .collection('vegetables')
        .get()
        .then((value) {
      value.docs.forEach((
          element) { // الايليمنت هنا عبارة عن محتوى كل دوك بكوليكشن ال vegetables
        print('value.docs.forEach((element)' + element.data().toString());
        vegetablesItemModel.add(
            VegetablesItemModel.fromJson(element.data()));
      });
      notifyListeners();
      print('getVegetableCategory Successful');
      // ProgressDialogUtils.hide();
    }).catchError((e) {
      print('getVegetableCategory Error ' + e.toString());
      // ProgressDialogUtils.hide();
    });
  }

  Future addToFavourite({
    String name,
    String imgUrl,
    String details,
    String rate,
    String price,
    bool isLiked
  }) async {
    ProgressDialogUtils.show();
    String token = SPHelper.spHelper.getToken();
    favouriteItemModel = FavouriteItemModel(name: name,rate: rate,imgUrl: imgUrl,details: details,price: price,like: isLiked);
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-favourite-items");
    return _collectionRef
        .doc(token)
        .collection("items")
        .doc()
        .set(favouriteItemModel.toJson()).then((value) {
      ProgressDialogUtils.hide();
    }).catchError((e){
      ProgressDialogUtils.hide();
    });
  }


  void getFavouriteData() async{
    ProgressDialogUtils.show();
    String token = SPHelper.spHelper.getToken();

    FirebaseFirestore.instance.collection("users-favourite-items")
        .doc(token)
        .collection("items")
        .doc()
        .get().then((value) {
          print(value.data());
          favouriteItemModel = FavouriteItemModel.fromJson(value.data());
    });
  }


}
