import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_final_project/SERVICES/sp_helper.dart';
import 'package:flutter_course_final_project/VIEW/my_account/widget/top_my_account_item.dart';
import 'package:flutter_course_final_project/VIEW_MODEL/profile_provider.dart';

import '../../../MODEL/user_model.dart';
import '../../../SERVICES/app_imports.dart';
import '../../../VIEW_MODEL/auth_provider.dart';
import '../../auth/screens/login_screen.dart';
import '../../custom_widget/custom_cached_network_image.dart';
import '../../main_screen/screens/main_screen.dart';
import 'my_order_screen.dart';
import 'setting_screen.dart';
import '../widget/my_account_item.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var value = Provider.of<AppProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    var profileProvider = Provider.of<ProfileProvider>(context);

    return Column(
      children: [
        Selector<ProfileProvider, UserModel>(
          builder: (context, x, _) {
            if (x == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: greenColor,
                ),
              );
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
                    onTapItem: () {
                      authProvider.logout();
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
