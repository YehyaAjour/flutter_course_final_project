import 'package:flutter_course_final_project/VIEW/custom_widget/custom_rates.dart';

import '../../../SERVICES/app_imports.dart';
import '../../custom_widget/cashed_network_image_share.dart';

class MyOrderItem extends StatelessWidget {
  final String imgUrl;
  final String fruitName;
  final Function onRatingChange;
  final String deliveredTime;
  final Function onPressedItem;

   MyOrderItem(
      {this.imgUrl,
      this.fruitName,
      this.deliveredTime,
      this.onPressedItem,
      this.onRatingChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
      child: GestureDetector(
        onTap: onPressedItem,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImageShare(
                  urlImage: imgUrl,
                  heigthNumber: 95,
                  widthNumber: 95,
                  borderNumber: 1,
                ),
                SizedBox(
                  width: 15.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      fruitName,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomRateWrite(onRatingChanged: onRatingChange,size: 20.w,),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomText(
                      'Rate this Product',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal,
                      color: greyTextColor,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    CustomText(
                      deliveredTime,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
                const Spacer(),
                 Icon(Icons.arrow_forward_ios,size: 18.w,)
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
