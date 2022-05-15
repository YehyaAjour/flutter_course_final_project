import '../../../SERVICES/app_imports.dart';
import '../../../VIEW_MODEL/global_view_provider.dart';

class LanguageSettingScreen extends StatefulWidget {
  static String routeName = 'LanguageSettingScreen';

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  @override
  Widget build(BuildContext context) {
    var providerLanguages = Provider.of<GlobalViewProvider>(context);
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
          'Language Setting',
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
              height: 14.h,
            ),
            CustomText(
              'Language',
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: greyTextColor,
            ),
            SizedBox(
              height: 27.h,
            ),
            Row(
              children: [
                CustomText(
                  'Language',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      context: context,
                      builder: (context) {
                        return buildSheet();
                      },
                    );
                  },
                  child: CustomText(
                      providerLanguages.current_lang == 'ar'
                          ? 'العربية'
                          : "English (United States)",
                      color: Colors.black,
                      fontSize: 14.sp,
                  ),
                ),
                SizedBox(width: 10.w,),
                Icon(Icons.arrow_forward_ios,size: 18.w,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSheet() {
    var providerLangueges = Provider.of<GlobalViewProvider>(context);
    return StatefulBuilder(
      builder: (thisLowerContext, innerSetState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 75.h,
            ),
            GestureDetector(
              onTap: () {
                providerLangueges.changeLanguage(context, 'ar');
                Navigator.pop(context);
              },
              child: Container(
                color: providerLangueges.current_lang == 'ar'
                    ? Colors.white.withOpacity(0.5)
                    : null,
                width: double.infinity,
                height: 45.h,
                child: Center(
                  child: CustomText(
                    'العربية',
                    fontFamily: 'din',
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                providerLangueges.changeLanguage(context, 'en');
                Navigator.pop(context);
              },
              child: Container(
                color: providerLangueges.current_lang == 'en'
                    ? Colors.white.withOpacity(0.5)
                    : null,
                width: double.infinity,
                height: 45.h,
                child: Center(
                  child: CustomText(
                    'English',
                    fontFamily: 'din',
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        );
      },
    );
  }
}
