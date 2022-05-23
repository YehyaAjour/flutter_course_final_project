class FavouriteItemModel {
  String imgUrl;
  String name;
  String details;
  String rate;
  String price;
  bool like;

  FavouriteItemModel(
      {this.imgUrl, this.name, this.details, this.rate, this.price, this.like});

  FavouriteItemModel.fromJson(Map<String, dynamic> json) {
    imgUrl = json['img_url'];
    name = json['name'];
    details = json['details'];
    rate = json['rate'];
    price = json['price'];
    like = json['like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img_url'] = this.imgUrl;
    data['name'] = this.name;
    data['details'] = this.details;
    data['rate'] = this.rate;
    data['price'] = this.price;
    data['like'] = this.like;
    return data;
  }
}
