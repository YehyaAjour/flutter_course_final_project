import '../../../SERVICES/app_imports.dart';
import '../../custom_widget/cashed_network_image_share.dart';

class TopMyAccountItem extends StatelessWidget {
final String profileImgUrl;
final String name;
final String email;
final Function onEditPressed;

  const TopMyAccountItem({Key key, this.profileImgUrl, this.name, this.email, this.onEditPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 229.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: greenColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CachedNetworkImageShare(
                urlImage:
                profileImgUrl,
                widthNumber: 85,
                heigthNumber: 85,
                borderNumber: 0,
                //circle
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                name,
                color: Colors.white,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                email,
                color: Colors.white,
                fontSize: 12.sp,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 40.h ,),
              GestureDetector(
                onTap: onEditPressed,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: CustomSvgImage(
                    imageName: 'edit',
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
