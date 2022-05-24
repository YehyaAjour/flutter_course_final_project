import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_course_final_project/VIEW/fruit_detail/widget/fruit_detail_item.dart';

import '../../../SERVICES/app_imports.dart';
import '../../../VIEW_MODEL/cart_provider.dart';
import '../../custom_widget/custom_cached_network_image.dart';

class FruitDetailScreen extends StatelessWidget {
  static String routeName = 'FruitDetailScreen';
  final String imgUrl;
  final String name;
  final String price;
  final String pdID;
  final String desc;

  const FruitDetailScreen({Key key, this.imgUrl, this.name, this.price,this.pdID,this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        elevation: 0,
        backgroundColor: greenColor,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: CustomText(
          'Details'.tr(),
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      body:  SingleChildScrollView(
        child: FruitDetailItem(
          imgUrl:
              imgUrl,
          fruitName: name,
          fruitDetail: desc,
          fruitNutritionList: ['fat','Potassium','Selenium','Vitamin B9','Vitamin A','Vitamin K','Zinc','Phosphorous'],
          price: price,
          onBuyNowPressed: (){
           bool added = cart.addItem(
              imgurl: imgUrl,
              name:name,
              desc:  desc,
              price: double.parse(price),
              quantitiy: 1,
              pdtid:pdID,
            );
           if(added){
             Navigator.pop(context);
             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Done Added Successfully')));
           }
          },
        ),
      ),
    );
  }
}
