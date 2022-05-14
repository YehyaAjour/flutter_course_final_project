

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../SERVICES/app_imports.dart';
import '../../auth/screens/login_screen.dart';
import '../widget/boarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = 'OnBoardingScreen';
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 54.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () {
                  NavigationHelper.navigationHelper.pushMethod(LoginScreen.routeName);
                },
                child: CustomText(
                  'Skip',
                  color: greyColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
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
                      details: 'Explore  top organic fruits & grab them'),
                  BoardingItem(
                      imageName: 'Delivery_on_way',
                      title: 'Delivery on the way',
                      details: 'Explore  top organic fruits & grab them'),
                  BoardingItem(
                      imageName: 'Delivery_Arrived',
                      title: 'Delivery Arrived',
                      details: 'Explore  top organic fruits & grab them'),
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
                child: CustomText('Next',
                    color: whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
              ):TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(greenColor)),
                onPressed: () {
                  NavigationHelper.navigationHelper.pushMethod(LoginScreen.routeName);
                },
                child: CustomText('Get Started',
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
}
