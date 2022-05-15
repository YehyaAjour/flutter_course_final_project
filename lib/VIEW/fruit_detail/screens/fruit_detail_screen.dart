import 'package:flutter_course_final_project/VIEW/fruit_detail/widget/fruit_detail_item.dart';

import '../../../SERVICES/app_imports.dart';
import '../../custom_widget/custom_cached_network_image.dart';

class FruitDetailScreen extends StatelessWidget {
  static String routeName = 'FruitDetailScreen';

  @override
  Widget build(BuildContext context) {
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
          'Details',
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      body:  SingleChildScrollView(
        child: FruitDetailItem(
          imgUrl:
              'https://solidstarts.com/wp-content/uploads/when-can-babies-eat-watermelon.jpg',
          fruitName: 'Broccoli',
          fruitDetail:
              'Broccoli is a green vegetable that vaguely  nutritional Powerhouse of vitamin,fiber and antioxidents.Broccoli contains lutein and  which mayPrevent from stress and',
          fruitNutritionList: ['fat','Potassium','Selenium','Vitamin B9','Vitamin A','Vitamin K','Zinc','Phosphorous'],
          price: '190',
          onBuyNowPressed: (){},
        ),
      ),
    );
  }
}
