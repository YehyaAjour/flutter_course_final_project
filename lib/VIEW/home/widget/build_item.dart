import 'package:flutter_course_final_project/SERVICES/app_imports.dart';
import '../../custom_widget/custom_cached_network_image.dart';
import '../../custom_widget/custom_rates.dart';

class BuildItem extends StatelessWidget {
  final Function onFavouritePressed;
  final Function onTapItem;
  final String imgUrl;
  final String fruitName;
  final String fruitPrice;
  final int fruitRate;
  final bool isLiked;

  const BuildItem({Key key, this.onFavouritePressed, this.onTapItem, this.imgUrl, this.fruitName, this.fruitPrice, this.fruitRate, this.isLiked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w,),
        GestureDetector(
          onTap: onTapItem,
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                height: 143.h,
                width: 118.w,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomCachedNetworkImage(
                      urlImage: imgUrl,
                      heigthNumber: 143,
                      widthNumber: 118,
                      borderNumber: 1,

                    ),

                    Container(
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, right: 5),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: isLiked?Colors.grey:Colors.red,
                              ),
                              onPressed: onFavouritePressed,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 7.5.h,
              ),
              SizedBox(
                width: 118,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRateRead(rate: fruitRate),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomText(
                      fruitName,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomText(
                      "$fruitPrice Per/ kg",
                     fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 5.w,),

      ],
    );
  }
}
