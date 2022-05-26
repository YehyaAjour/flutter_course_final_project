import 'dart:async';
import '../../SERVICES/app_imports.dart';
import '../../SERVICES/sp_helper.dart';
import '../../VIEW_MODEL/home_screen_provider.dart';
import '../main_screen/screens/main_screen.dart';
import '../on_boarding/screens/on_boarding_screen.dart';


class SplashScreen extends StatefulWidget {
  static String routeName = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var delay = Duration(seconds: 3);

    Future.delayed(delay, () {
      if (SPHelper.spHelper.getToken() == '' ||
          SPHelper.spHelper.getToken() == null) {
        NavigationHelper.navigationHelper
            .pushReplacmentMethod(OnBoardingScreen.routeName);
      } else {
        Provider.of<HomeScreenProvider>(context,listen: false);
        NavigationHelper.navigationHelper
            .pushReplacmentMethod(MainScreen.routeName);
      }
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
