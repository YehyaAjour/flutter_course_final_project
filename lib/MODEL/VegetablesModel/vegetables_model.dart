class VegetablesModel {

  String discount;
  String fruit_type;
  String hint;

  VegetablesModel( this.discount, this.fruit_type, this.hint);

  VegetablesModel.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    fruit_type = json['fruit_type'];
    hint = json['hint'];
  }
  Map<String, dynamic> toMap() {
    return {
      "discount": discount,
      "fruit_type": fruit_type,
      "hint": hint,

    };
  }
}
