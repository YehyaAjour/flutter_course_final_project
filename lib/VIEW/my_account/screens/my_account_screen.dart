import 'package:flutter/material.dart';
import 'package:flutter_course_final_project/VIEW/my_account/widget/top_my_account_item.dart';

import '../../../SERVICES/app_imports.dart';
import '../../custom_widget/cashed_network_image_share.dart';
import '../../main_screen/screens/main_screen.dart';
import '../widget/my_account_item.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var value = Provider.of<AppProvider>(context);
    return Column(
      children: [
        TopMyAccountItem(
          profileImgUrl: 'https://media-exp1.licdn.com/dms/image/C5603AQEGpL-pXwsXaQ/profile-displayphoto-shrink_800_800/0/1637263394180?e=1657756800&v=beta&t=iJEYwp8oZA1C7a78aO3Lt6KdnsjiIs_n5wJLrwSr8tw',
          name: "Manish Chutake",
          email:"manishuxuid@gmail.com",
          onEditPressed:(){},
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyAccountItem(
                    labelName: "My Orders",
                    iconData: Icons.shopping_bag,
                    onTapItem: () {}),
                MyAccountItem(
                    labelName: "Favourite",
                    iconData: Icons.favorite,
                    onTapItem: () {
                      value.setIndexScreen(2);
                      print(value.indexScreen);
                    }),
                MyAccountItem(
                    labelName: "Setting",
                    iconData: Icons.settings,
                    onTapItem: () {}),
                MyAccountItem(
                    labelName: "My Cart",
                    iconData: Icons.shopping_cart,
                    onTapItem: () {}),
                MyAccountItem(
                  labelName: "Rate Us",
                  iconData: Icons.star_rate,
                  onTapItem: () {},
                ),
                MyAccountItem(
                  labelName: "Refer a Friend",
                  iconData: Icons.share,
                  onTapItem: () {},
                ),
                MyAccountItem(
                  labelName: "Help ",
                  iconData: Icons.help,
                  onTapItem: () {},
                ),
                MyAccountItem(
                    labelName: "Log Out",
                    iconData: Icons.logout,
                    onTapItem: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
