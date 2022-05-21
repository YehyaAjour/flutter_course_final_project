import 'package:easy_localization/easy_localization.dart';

import '../../../SERVICES/app_imports.dart';
import '../../auth/widget/default_button.dart';

class ChangeAddressScreen extends StatelessWidget {
  static String routeName = 'ChangeAddressScreen';

  TextEditingController addressController = TextEditingController();

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
          'Change Address'.tr(),
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
              height: 19.h,
            ),
            CustomText(
              'Address'.tr(),
              fontWeight: FontWeight.w800,
              fontSize: 16.sp,
            ),
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Color(0xff69A03A)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff69A03A),
                  ),
                ),
                border: OutlineInputBorder(),
              ),
              minLines: 1,
              maxLines: 7,
              keyboardType: TextInputType.multiline,
              controller: addressController,
            ),
            SizedBox(
              height: 15.h,
            ),
            const Spacer(),
            DefaultButton(title: "CHANGE".tr(),onPressed: (){}),
            SizedBox(
              height: 40.h,
            ),

          ],
        ),
      ),
    );
  }
}
