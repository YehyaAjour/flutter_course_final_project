class VegetablesItemModel {
  String categoryName;
  String copon;
  String details;
  List<FruitItems> fruitItems;

  VegetablesItemModel(
      {this.categoryName, this.copon, this.details, this.fruitItems});

  VegetablesItemModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    copon = json['copon'];
    details = json['details'];
    if (json['fruit_items'] != null) {
      fruitItems = new List<FruitItems>();
      json['fruit_items'].forEach((v) {
        fruitItems.add(new FruitItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    data['copon'] = this.copon;
    data['details'] = this.details;
    if (this.fruitItems != null) {
      data['fruit_items'] = this.fruitItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FruitItems {
  String image;
  String name;
  String price;
  String rate;
  bool isLiked;

  FruitItems({this.image, this.name, this.price, this.rate, this.isLiked});

  FruitItems.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    price = json['price'];
    rate = json['rate'];
    isLiked = json['is_liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    data['rate'] = this.rate;
    data['is_liked'] = this.isLiked;
    return data;
  }
}
