

import 'package:easy_localization/easy_localization.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../SERVICES/app_imports.dart';
import '../../../VIEW_MODEL/global_view_provider.dart';
import '../../auth/screens/login_screen.dart';
import '../widget/boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = 'OnBoardingScreen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var providerLanguages = Provider.of<GlobalViewProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 54.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      context: context,
                      builder: (context) {
                        return buildSheet();
                      },
                    );
                  },
                  child: CustomText(
                    providerLanguages.current_lang == 'ar'
                        ? 'العربية'
                        : "English (United States)",
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    NavigationHelper.navigationHelper
                        .pushReplacmentMethod(LoginScreen.routeName);
                  },
                  child: CustomText(
                    'Skip'.tr(),
                    color: greyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 79.h,
            ),
            SizedBox(
              height: 340.h,
              child: PageView(
                controller: pageController,
                children: const [
                  BoardingItem(
                      imageName: 'E_Shopping',
                      title: 'E Shopping',
                      details: 'Explore top organic fruits & grab them'),
                  BoardingItem(
                      imageName: 'Delivery_on_way',
                      title: 'Delivery on the way',
                      details: 'Get your order by speed delivery'),
                  BoardingItem(
                      imageName: 'Delivery_Arrived',
                      title: 'Delivery Arrived',
                      details: 'Order is arrived at your Place'),
                ],
                onPageChanged: (x) {
                  Provider.of<AppProvider>(context,listen: false).inBoardingChangePageIndex(x);
                  print( Provider.of<AppProvider>(context,listen: false).pageIndex);
                },

              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const WormEffect(
                activeDotColor: greenColor,
              ),
            ),
            SizedBox(
              height: 90.h,
            ),
            SizedBox(
              width: 146.w,
              height: 48.h,
              child:Provider.of<AppProvider>(context,listen: true).pageIndex!=2?TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenColor)),
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(microseconds: 1000),
                      curve: Curves.bounceInOut);

                },
                child: CustomText('Next'.tr(),
                    color: whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
              ):TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenColor)),
                onPressed: () {
                  NavigationHelper.navigationHelper.pushReplacmentMethod(LoginScreen.routeName);
                },
                child: CustomText('Get Started'.tr(),
                    color: whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget buildSheet() {
    var providerLangueges = Provider.of<GlobalViewProvider>(context);
    return StatefulBuilder(
      builder: (thisLowerContext, innerSetState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 75.h,
            ),
            GestureDetector(
              onTap: () {
                providerLangueges.changeLanguage(context, 'ar');
                Navigator.pop(context);
              },
              child: Container(
                color: providerLangueges.current_lang == 'ar'
                    ? Colors.white.withOpacity(0.5)
                    : null,
                width: double.infinity,
                height: 45.h,
                child: Center(
                  child: CustomText(
                    'العربية',
                    fontFamily: 'din',
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                providerLangueges.changeLanguage(context, 'en');
                Navigator.pop(context);
              },
              child: Container(
                color: providerLangueges.current_lang == 'en'
                    ? Colors.white.withOpacity(0.5)
                    : null,
                width: double.infinity,
                height: 45.h,
                child: Center(
                  child: CustomText(
                    'English',
                    fontFamily: 'din',
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        );
      },
    );
  }

}
