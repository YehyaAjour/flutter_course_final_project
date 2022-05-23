import '../../../SERVICES/app_imports.dart';
import '../../custom_widget/custom_cached_network_image.dart';

class FruitDetailItem extends StatelessWidget {
  final String imgUrl;
  final String fruitName;
  final String fruitDetail;
  final List<String> fruitNutritionList;
  final String price;
  final Function onBuyNowPressed;

  const FruitDetailItem(
      {Key key,
      this.imgUrl,
      this.fruitName,
      this.fruitDetail,
      this.fruitNutritionList,
      this.price,
      this.onBuyNowPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.h,
          ),
          CustomCachedNetworkImage(
            urlImage: imgUrl,
            widthNumber: double.infinity,
            heigthNumber: 176.h,
            borderNumber: 10,
          ),
          SizedBox(
            height: 18.h,
          ),
          CustomText(
            fruitName,
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
          ),
          SizedBox(
            height: 11.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0.w),
            child: CustomText(
              fruitDetail,
              color: greyTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          CustomText(
            'Nutrition',
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w800,
          ),
          SizedBox(
            height: 11.h,
          ),
          Column(
            children: fruitNutritionList.map((e) {
              return Row(
                children: [
                  const Icon(Icons.circle, color: greyTextColor, size: 7),
                  SizedBox(
                    width: 13.w,
                  ),
                  CustomText(
                    e,
                    color: greyTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              );
            }).toList(),
          ),
          SizedBox(
            height: 56.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                '$price Per/ kg',
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: 40.h,
                width: 148.w,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(greenColor)),
                  onPressed: onBuyNowPressed,
                  child: CustomText('Buy Now',
                      color: whiteColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
