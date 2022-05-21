import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_final_project/VIEW/custom_widget/custom_image.dart';
import 'package:flutter_course_final_project/VIEW/custom_widget/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style.dart';

class BoardingItem extends StatelessWidget {
  final String imageName;
  final String title;
  final String details;

  const BoardingItem({this.imageName, this.title, this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPngImage(imageName: imageName,height: 210.h,width: 272.w,fit: BoxFit.contain),
        SizedBox(height: 48.h,),
        CustomText(title.tr(),fontSize: 20.sp,fontWeight: FontWeight.w800,),
        SizedBox(height: 16.h,),
        CustomText(details.tr(),fontSize: 15.sp,fontWeight: FontWeight.normal,color: greyColor,),

      ],
    );
  }
}
