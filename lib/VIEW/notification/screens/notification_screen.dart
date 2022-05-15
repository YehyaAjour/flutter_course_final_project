import '../../../SERVICES/app_imports.dart';
import '../../custom_widget/cashed_network_image_share.dart';
import '../widget/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = 'NotificationScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        elevation: 0,
        backgroundColor: greenColor,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: CustomText(
          'Notification',
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            CustomText(
              'Today',
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return NotificationItem(
                      imgUrl:
                          'https://images.news18.com/ibnlive/uploads/2022/03/watermelon.jpg',
                      notificationTitle: 'Buy 1kg Get 200gm Free',
                      notificationBody:
                          'Buy 1 Get 1 Free for small sizes Until Feb 27,2021',
                      notificationTime: 'Few minutes ago',
                      onPressedMoreAction: () {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
