

import '../../../SERVICES/app_imports.dart';
import '../../cart_screen.dart';
import '../../custom_widget/custom_nav_button.dart';
import '../../favourite/screens/favourite_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../my_account/screens/my_account_screen.dart';

class MainScreen extends StatefulWidget {
  static String routeName = 'MainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var value = Provider.of<AppProvider>(context);
    return Scaffold(
        key: _scaffoldKey,
        body: PageNav.widgetOptions[value.indexScreen],
        bottomNavigationBar: SizedBox(height:60.h, child: CustomNavBottom()));
  }
}

class PageNav {
  static List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    const CartScreen(),
    FavouriteScreen(),
    MyAccountScreen(),
  ];
}
