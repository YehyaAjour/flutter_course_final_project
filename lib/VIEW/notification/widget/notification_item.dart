import '../../../SERVICES/app_imports.dart';
import '../../custom_widget/cashed_network_image_share.dart';

class NotificationItem extends StatelessWidget {
final String imgUrl;
final String notificationTitle;
final String notificationBody;
final String notificationTime;
final Function onPressedMoreAction;

  const NotificationItem({Key key, this.imgUrl, this.notificationTitle, this.notificationBody, this.notificationTime, this.onPressedMoreAction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImageShare(
              urlImage:
              imgUrl,
              heigthNumber: 75,
              widthNumber: 75,
              borderNumber: 1,
            ),
            SizedBox(
              width: 15.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  notificationTitle,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomText(
                  notificationBody,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: greyTextColor,
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomText(
                  notificationTime,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
                onTap: onPressedMoreAction,
                child: const Icon(Icons.more_vert))
          ],
        ),
        const Divider(),
      ],
    );
  }
}
