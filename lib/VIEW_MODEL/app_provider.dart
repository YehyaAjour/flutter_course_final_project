import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  int pageIndex = 0;

  void inBoardingChangePageIndex(int index) {
    pageIndex = index;
    print('yehya'+'$index');
    notifyListeners();
  }


  int indexScreen = 0;
  setIndexScreen(int value) {
    indexScreen = value;
    notifyListeners();
  }

  int categoryIndex = 0;
  setCategoryIndex(int value) {
    categoryIndex = value;
    notifyListeners();
  }

  int itemCount=1;
  increaseFavouriteItemCount(){
    itemCount++;
    notifyListeners();
  }
  decreaseFavouriteItemCount(){
    if(itemCount>0){
      itemCount--;
    }else {return null;}

    notifyListeners();
  }
}
