import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_course_final_project/VIEW/my_account/widget/top_my_account_item.dart';

import '../../../MODEL/user_model.dart';
import '../../../SERVICES/app_imports.dart';
import '../../../VIEW_MODEL/auth_provider.dart';
import 'my_order_screen.dart';
import 'setting_screen.dart';
import '../widget/my_account_item.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var value = Provider.of<AppProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);

    return Column(
      children: [
        Selector<AuthProvider, UserModel>(
          builder: (context, x, _) {
            if (x.name == null) {
              return Container(height: 229.h,color: greenColor,);
            } else {
              return TopMyAccountItem(
                profileImgUrl:x.image,
                name: x.name,
                email: x.email,
                onEditPressed: () {},
              );
            }
          },
          selector: (BuildContext, Provider) {
            return Provider.model;
          },
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyAccountItem(
                    labelName: "My Orders".tr(),
                    iconData: Icons.shopping_bag,
                    onTapItem: () {
                      NavigationHelper.navigationHelper
                          .pushMethod(MyOrderScreen.routeName);
                    }),
                MyAccountItem(
                    labelName: "Favourite".tr(),
                    iconData: Icons.favorite,
                    onTapItem: () {
                      value.setIndexScreen(2);
                      print(value.indexScreen);
                    }),
                MyAccountItem(
                    labelName: "Setting".tr(),
                    iconData: Icons.settings,
                    onTapItem: () {
                      NavigationHelper.navigationHelper.pushMethod(SettingScreen.routeName);
                    }),
                MyAccountItem(
                    labelName: "My Cart".tr(),
                    iconData: Icons.shopping_cart,
                    onTapItem: () {
                      value.setIndexScreen(1);
                      print(value.indexScreen);
                    }),
                MyAccountItem(
                  labelName: "Rate Us".tr(),
                  iconData: Icons.star_rate,
                  onTapItem: () {},
                ),
                MyAccountItem(
                  labelName: "Refer a Friend".tr(),
                  iconData: Icons.share,
                  onTapItem: () {},
                ),
                MyAccountItem(
                  labelName: "Help".tr(),
                  iconData: Icons.help,
                  onTapItem: () {},
                ),
                MyAccountItem(
                    labelName: "Log Out".tr(),
                    iconData: Icons.logout,
                    onTapItem: () async {
                      await  authProvider.logout();
                      value.setIndexScreen(0);
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
