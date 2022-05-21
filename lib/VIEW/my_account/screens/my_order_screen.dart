import 'package:easy_localization/easy_localization.dart';

import '../../../SERVICES/app_imports.dart';
import '../widget/my_order_item.dart';

class MyOrderScreen extends StatelessWidget {
  static String routeName = 'MyOrderScreen';

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
          'My Orders'.tr(),
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 14.h,),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
              return MyOrderItem(
                  imgUrl:
                  'https://images.news18.com/ibnlive/uploads/2022/03/watermelon.jpg',
                  fruitName: 'Broccoli',
                  onRatingChange: () {},
                  deliveredTime: 'Delivered on 24 Feb 2021.',
                  onPressedItem: () {});
            },),
          ),
        ],
      ),
    );
  }
}
