import 'dart:async';

import '../../SERVICES/app_imports.dart';
import '../on_boarding/screens/on_boarding_screen.dart';


class SplashScreen extends StatefulWidget {
  static String routeName = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      NavigationHelper.navigationHelper.pushMethod(OnBoardingScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomPngImage(
              imageName: 'mix_fruit_png_11',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover),
          Center(
            child: CustomText(
              "Fruit Market",
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 42.sp,
            ),
          ),
        ],
      ),
    );
  }
}
