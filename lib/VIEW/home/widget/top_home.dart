import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_final_project/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../SERVICES/navigator_helper.dart';
import '../../notification/screens/notification_screen.dart';

class TopHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133.h,
      child: Stack(
        children: <Widget>[
          Container(
            color: greenColor,
            width: MediaQuery.of(context).size.width,
            height: 100.0.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Fruit Market",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    NavigationHelper.navigationHelper
                        .pushMethod(NotificationScreen.routeName);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 80.0.h,
            left: 0.0.w,
            right: 0.0.w,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    boxShadow: const[
                      BoxShadow(
                        color:  Color(0x2f000000),
                        offset: Offset(0, 3),
                        blurRadius: 36,
                      ),
                    ],
                    color: Colors.white),
                child:  TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: "Search".tr(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:  BorderSide(
                          color: Color(0xff69A03A),
                        ),
                      ),
                      border: InputBorder.none),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
