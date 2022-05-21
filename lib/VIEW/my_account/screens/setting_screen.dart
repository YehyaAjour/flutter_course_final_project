import 'package:easy_localization/easy_localization.dart';

import '../../../SERVICES/app_imports.dart';
import '../widget/my_account_item.dart';
import 'change_address_screen.dart';
import 'language_setting_screen.dart';
import 'notification_setting_screen.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = 'SettingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 60.h,
        elevation: 0,
        backgroundColor: greenColor,
        title: CustomText(
          'Setting'.tr(),
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      body: Column(
        children: [
          // MyAccountItem(
          //     labelName: "Account",
          //     iconData: Icons.account_circle,
          //     onTapItem: () {}),
          MyAccountItem(
              labelName: "Notification".tr(),
              iconData: Icons.notifications,
              onTapItem: () {
                NavigationHelper.navigationHelper
                    .pushMethod(NotificationSettingScreen.routeName);
              }),
          MyAccountItem(
            labelName: "Language".tr(),
            iconData: Icons.language,
            onTapItem: () {
              NavigationHelper.navigationHelper
                  .pushMethod(LanguageSettingScreen.routeName);
            },
          ),
          MyAccountItem(
              labelName: "Change Location".tr(),
              iconData: Icons.edit_location,
              onTapItem: () {
                NavigationHelper.navigationHelper.pushMethod(ChangeAddressScreen.routeName);

              }),
        ],
      ),
    );
  }
}
