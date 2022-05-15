import 'package:flutter_course_final_project/VIEW/custom_widget/custom_cached_network_image.dart';

import '../../../SERVICES/app_imports.dart';
import '../../custom_widget/custom_rates.dart';
import '../widget/favourite_item.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 60.h,
          elevation: 0,
          backgroundColor: greenColor,
          title: CustomText(
            'Favourite',
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return FavouriteItem(
                fruitImageUrl:
                    'https://media.istockphoto.com/photos/grape-dark-grape-grapes-with-leaves-isolated-with-clipping-path-full-picture-id803721418?k=20&m=803721418&s=612x612&w=0&h=U2vUEoYYZD6xdYJc-2dhZpa1EvIxkXdiUaAlE-Kexn4=',
                fruitName: 'Grapes',
                fruitPrice: '160 Per/ kg',
                fruitDetails: 'Pick up from organic farms',
                fruitRate: '4',
                onPressedAdd: () {},
              );
            },
          ),
        )
      ],
    );
  }
}
