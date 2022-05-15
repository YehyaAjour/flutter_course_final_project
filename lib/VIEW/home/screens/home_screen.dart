import '../../../SERVICES/app_imports.dart';
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
                      'Vegetables',
                      style: TextStyle(
                        fontFamily: "Poppins",
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
                      'Fruits',
                      style: TextStyle(
                        fontFamily: "Poppins",
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
                      'Dry Fruits',
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
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        CustomText(
                          'Organic Fruit',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CustomText(
                          '(20% Off)',
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
                          'Pick up from organic farms',
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
                      itemCount: 4,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => BuildItem(onTapItem: () {
                        NavigationHelper.navigationHelper
                            .pushMethod(FruitDetailScreen.routeName);
                      }),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
