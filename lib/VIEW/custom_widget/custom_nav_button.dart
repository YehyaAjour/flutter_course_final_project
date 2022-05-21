import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../VIEW_MODEL/app_provider.dart';
import '../../style.dart';
import 'custom_image.dart';
import 'custom_text.dart';


class CustomNavBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var value = Provider.of<AppProvider>(context);
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.white,
      currentIndex: value.indexScreen,
      onTap: value.setIndexScreen,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      items: [
        BottomNavigationBarItem(
          activeIcon: Column(
            children: [
              CustomSvgImage(
                imageName: 'home',
                height: 24.h,
                width: 24.w,
                color: greenColor,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                "Home".tr(),
                fontSize: 14.sp,
                color: greenColor,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
          icon: Column(
            children: [
              CustomSvgImage(
                imageName: 'home',
                height: 24.h,
                width: 24.w,
                color: borderColor,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                "Home".tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: borderColor,
              )
            ],
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          activeIcon: Column(
            children: [
              CustomSvgImage(
                imageName: 'shopping_cart',
                height: 21.h,
                width: 21.w,
                color: greenColor,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                "Shopping cart".tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: greenColor,
              )
            ],
          ),
          icon: Column(
            children: [
              CustomSvgImage(
                imageName: 'shopping_cart',
                height: 21.h,
                width: 21.w,
                color: borderColor,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                "Shopping cart".tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: borderColor,
              )
            ],
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          activeIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgImage(
                imageName: 'favorite',
                height: 24.h,
                width: 24.w,
                color: greenColor,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                "Favourite".tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: greenColor,
              )
            ],
          ),
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgImage(
                imageName: 'favorite',
                height: 24.h,
                width: 24.w,
                color: borderColor,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                "Favourite".tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: borderColor,
              )
            ],
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          activeIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgImage(
                imageName: 'account',
                height: 24.h,
                width: 24.w,
                color: greenColor,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                "My Account".tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: greenColor,
              )
            ],
          ),
          icon: Column(
            children: [
              CustomSvgImage(
                imageName: 'account',
                height: 24.h,
                width: 24.w,
                color: borderColor,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                "My Account".tr(),
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: borderColor,
              )
            ],
          ),
          label: "",
        ),
      ],
    );
  }
}
