import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_course_final_project/VIEW_MODEL/home_screen_provider.dart';

import '../../../MODEL/vegetable_category_model.dart';
import '../../../SERVICES/app_imports.dart';
import '../../../VIEW_MODEL/profile_provider.dart';
import '../../fruit_detail/screens/fruit_detail_screen.dart';
import '../widget/build_item.dart';
import '../widget/top_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var value = Provider.of<AppProvider>(context);
    return Column(
      children: [
        TopHome(),
        SizedBox(
          height: 25.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  value.setCategoryIndex(0);
                },
                child: Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: value.categoryIndex == 0
                        ? orangeColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      'Vegetables'.tr(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        color:
                            value.categoryIndex == 0 ? Colors.white : greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: () {
                  value.setCategoryIndex(1);
                },
                child: Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: value.categoryIndex == 1
                        ? orangeColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      'Fruits'.tr(),
                      style: TextStyle(
                        fontSize: 15.sp,
                        color:
                            value.categoryIndex == 1 ? Colors.white : greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: () {
                  value.setCategoryIndex(2);
                },
                child: Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: value.categoryIndex == 2
                        ? orangeColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      'Dry Fruits'.tr(),
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15.sp,
                        color:
                            value.categoryIndex == 2 ? Colors.white : greyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: Consumer<HomeScreenProvider>(builder: (context, value, child) {
            return value.vegetablesItemModel == null || value.vegetablesItemModel.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(color: greenColor,),
                  )
                : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
              children: value.vegetablesItemModel.map((e) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            CustomText(
                              e.categoryName,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomText(
                              '(${e.copon}% Off)',
                              fontWeight: FontWeight.bold,
                              color: greenColor,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          children: [
                            CustomText(
                              e.details,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 230.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: e.fruitItems.length,
                          itemBuilder: (context, index) {
                            return BuildItem(
                              onTapItem: () {
                                NavigationHelper.navigationHelper
                                    .pushMethod(
                                    FruitDetailScreen.routeName);
                              },
                              imgUrl:e.fruitItems[index].image,
                              fruitRate:
                              int.parse(e.fruitItems[index].rate),
                              fruitPrice: e.fruitItems[index].price,
                              fruitName: e.fruitItems[index].name,
                              isLiked: e.fruitItems[index].isLiked,
                            );
                        },),
                      ),
                    ],
                  );
              }).toList(),
            ),
                );
          }),
        )
      ],
    );
  }
}
