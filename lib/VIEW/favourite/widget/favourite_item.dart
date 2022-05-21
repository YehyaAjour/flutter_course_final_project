import 'package:easy_localization/easy_localization.dart';

import '../../../SERVICES/app_imports.dart';
import '../../custom_widget/custom_cached_network_image.dart';
import '../../custom_widget/custom_rates.dart';

class FavouriteItem extends StatelessWidget {
  final String fruitImageUrl;
  final String fruitName;
  final String fruitPrice;
  final String fruitDetails;
  final String fruitRate;
  final Function onPressedAdd;

  const FavouriteItem(
      {Key key,
      this.fruitImageUrl,
      this.fruitName,
      this.fruitPrice,
      this.fruitDetails,
      this.fruitRate,
      this.onPressedAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<AppProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        children: [
          Row(
            children: [
              CustomCachedNetworkImage(
                urlImage: fruitImageUrl,
                widthNumber: 95,
                heigthNumber: 95,
                borderNumber: 10,
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            fruitName,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          CustomText(
                            fruitPrice,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomText(
                        fruitDetails,
                        fontSize: 10.sp,
                        color: greyTextColor,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomRateRead(rate: int.parse(fruitRate)),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: GestureDetector(
                                    onTap: () {
                                      value.decreaseFavouriteItemCount();
                                    },
                                    child: const Icon(Icons.remove)),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              CustomText(
                                value.itemCount.toString(),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w800,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Container(
                                height: 25.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: GestureDetector(
                                    onTap: () {
                                      value.increaseFavouriteItemCount();
                                    },
                                    child: const Icon(Icons.add)),
                              ),
                            ],
                          ),
                          TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(orangeColor)),
                            onPressed: onPressedAdd,
                            child: CustomText('Add'.tr(),
                                color: whiteColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
