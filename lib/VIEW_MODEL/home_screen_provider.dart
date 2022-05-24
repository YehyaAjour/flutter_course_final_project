import 'package:cloud_firestore/cloud_firestore.dart';
import '../MODEL/favourite_item_model.dart';
import '../MODEL/vegetable_category_model.dart';
import '../SERVICES/app_imports.dart';
import '../SERVICES/progress_dialog_utils.dart';
import '../SERVICES/sp_helper.dart';

class HomeScreenProvider extends ChangeNotifier {
  HomeScreenProvider() {
    getHomeData();
    // addProduct();
  }

  List<VegetablesItemModel> vegetablesItemModel = [];
  FavouriteItemModel favouriteItemModel;

  addProduct({
    String uId,
    String name,
    String email,
    String phone,
  }) async {
    ProgressDialogUtils.show();
    VegetablesItemModel vegetablesItemModel = VegetablesItemModel(
        categoryName: 'Root Vegetabels',
        copon: '20',
        details: 'Pick up from organic farms',
        fruitItems: [
          FruitItems(
              name: 'Onion',
              price: '20',
              rate: '4',
              image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Onion_on_White.JPG/1200px-Onion_on_White.JPG',
              desc: 'Organic food, ecological food or biological food are food and drinks',
              isLiked: false,
              product_id: 'd1'),
          FruitItems(
              name: 'Garlic',
              price: '15',
              rate: '5',
              image: 'https://5.imimg.com/data5/SELLER/Default/2020/11/ZY/NB/EM/66520044/single-clove-garlic-500x500.jpg',
              desc: 'Organic food, ecological food or biological food are food and drinks',
              isLiked: false,
              product_id: 'd2'),
          FruitItems(
              name: 'Ginger',
              price: '30',
              rate: '5',
              image: 'https://cdn.britannica.com/19/231119-050-35483892/Indian-ginger-Zingiber-officinale.jpg',
              desc: 'Organic food, ecological food or biological food are food and drinks',
              isLiked: false,
              product_id: 'd3'),

          FruitItems(
              name: 'Corriander',
              price: '50',
              rate: '4',
              image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/A_scene_of_Coriander_leaves.JPG/2560px-A_scene_of_Coriander_leaves.JPG',
              desc: 'It has good taste if cooked into a proper recipe and can prevent cancer, lower cholesterol. Brinjal has no fat and its high',
              isLiked: false,
              product_id: 'd4'),
          FruitItems(
              name: 'Brinjels',
              price: '80',
              rate: '5',
              image: 'https://www.astrogle.com/images/2015/01/brinjal.jpg',
              desc: 'It has good taste if cooked into a proper recipe and can prevent cancer, lower cholesterol. Brinjal has no fat and its high fiber content which makes it suitable for people who wants to shed some weight.',
              isLiked: false,
              product_id: 'd5'),
          FruitItems(
              name: 'Broccoli',
              price: '190',
              rate: '4',
              image: 'https://solidstarts.com/wp-content/uploads/Broccoli_edited-scaled.jpg',
              desc: 'Broccoli is a green vegetable that vaguely  nutritionalPowerhouse of vitamin,fiber and antioxidents.Broccolicontains lutein and  which mayPrevent from stress andcellular damage in yourEyes.',
              isLiked: false,
              product_id: 'd6'),
        ]);
    FirebaseFirestore.instance
        .collection('vegetables')
        .doc('Root Vegetabels')
        .update(vegetablesItemModel.toJson())
        .then((value) {
      ProgressDialogUtils.hide();
    }).catchError((e) {
      ProgressDialogUtils.hide();
    });
  }

  void getHomeData() {
    // ProgressDialogUtils.show();

    FirebaseFirestore.instance.collection('vegetables').get().then((value) {
      value.docs.forEach((element) {
        // الايليمنت هنا عبارة عن محتوى كل دوك بكوليكشن ال vegetables
        print('value.docs.forEach((element)' + element.data().toString());
        vegetablesItemModel.add(VegetablesItemModel.fromJson(element.data()));
      });
      notifyListeners();
      print('getVegetableCategory Successful');
      // ProgressDialogUtils.hide();
    }).catchError((e) {
      print('getVegetableCategory Error ' + e.toString());
      // ProgressDialogUtils.hide();
    });
  }

  Future addToFavourite(
      {String name,
      String imgUrl,
      String details,
      String rate,
      String price,
      bool isLiked}) async {
    ProgressDialogUtils.show();
    String token = SPHelper.spHelper.getToken();
    favouriteItemModel = FavouriteItemModel(
        name: name,
        rate: rate,
        imgUrl: imgUrl,
        details: details,
        price: price,
        like: isLiked);
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-favourite-items");
    return _collectionRef
        .doc(token)
        .collection("items")
        .doc()
        .set(favouriteItemModel.toJson())
        .then((value) {
      ProgressDialogUtils.hide();
    }).catchError((e) {
      ProgressDialogUtils.hide();
    });
  }

  void getFavouriteData() async {
    ProgressDialogUtils.show();
    String token = SPHelper.spHelper.getToken();

    FirebaseFirestore.instance
        .collection("users-favourite-items")
        .doc(token)
        .collection("items")
        .doc()
        .get()
        .then((value) {
      print(value.data());
      favouriteItemModel = FavouriteItemModel.fromJson(value.data());
    });
  }
}
