import '../../../SERVICES/app_imports.dart';

class NotificationSettingScreen extends StatelessWidget {
  static String routeName = 'NotificationSettingScreen';

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
          'Notification Setting',
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
             SizedBox(height: 17.h,),
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: greenColor,
                  size: 40.w,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'My Account',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    CustomText(
                      'You will receive daily updates',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: greyTextColor,
                    ),
                  ],
                ),
                Spacer(),
                Switch(value: true, onChanged: (value){},activeColor: greenColor,),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: greenColor,
                  size: 40.w,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'Pramotional Notifications',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    CustomText(
                      'You will receive daily updates',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: greyTextColor,
                    ),
                  ],
                ),
               const Spacer(),
                Switch(value: false, onChanged: (value){},activeColor: greenColor,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
