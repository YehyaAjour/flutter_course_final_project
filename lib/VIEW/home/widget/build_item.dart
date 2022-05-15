import 'package:flutter/material.dart';
import 'package:flutter_course_final_project/VIEW/custom_widget/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../custom_widget/custom_cached_network_image.dart';
import '../../custom_widget/custom_rates.dart';

class BuildItem extends StatelessWidget {
  final Function onFavouritePressed;
  final Function onTapItem;
  final Color favouriteColor;


  BuildItem(
      {this.onFavouritePressed, this.favouriteColor,this.onTapItem});

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
                      urlImage: 'https://images.news18.com/ibnlive/uploads/2022/03/watermelon.jpg',
                      heigthNumber: 143,
                      widthNumber: 118,
                      borderNumber: 1,

                    ),

                    Container(
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, right: 5),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: favouriteColor,
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
                    CustomRateRead(rate: 4),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomText(
                      "Strawberry",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CustomText(
                      "300 Per/ kg",
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
