
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_final_project/VIEW_MODEL/app_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'SERVICES/cache_helper.dart';
import 'SERVICES/navigator_helper.dart';
import 'VIEW/auth/screens/login_screen.dart';
import 'VIEW/auth/screens/register_screen.dart';
import 'VIEW/fruit_detail/screens/fruit_detail_screen.dart';
import 'VIEW/main_screen/screens/main_screen.dart';
import 'VIEW/on_boarding/screens/on_boarding_screen.dart';
import 'VIEW/splash/splash_screen.dart';
import 'VIEW_MODEL/global_view_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('ar', 'en'),
      saveLocale: false,
      useOnlyLangCode: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider<GlobalViewProvider>(create: (context) => GlobalViewProvider(),),
          ChangeNotifierProvider<AppProvider>(create: (context) => AppProvider(),),
        ],
        child: MaterialApp(
          builder: (context, child) {
            return child;
          },
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationHelper.navigationHelper.navigatorKey,
          title: 'Ecommerce Fruit App',
          home: SplashScreen(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            MainScreen.routeName: (context) => MainScreen(),
            FruitDetailScreen.routeName: (context) => FruitDetailScreen(),
          },
        ),
      ),

      designSize: const Size(375,812),
    );
  }
}


