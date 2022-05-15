

import 'package:flutter/material.dart';
import 'package:flutter_course_final_project/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rating_bar/rating_bar.dart';

class CustomRateRead extends StatelessWidget {
  final num rate;
  final double size;

  CustomRateRead({this.rate = 0, this.size});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: RatingBar.readOnly(
            size: size ?? 15.r,
            initialRating: rate.toDouble(),
            isHalfAllowed: true,
            maxRating: 5,
            halfFilledIcon: FontAwesomeIcons.starHalfAlt,
            filledIcon: Icons.star,
            emptyIcon: Icons.star,
            emptyColor: borderColor,
            halfFilledColor: rateColor,
            filledColor: rateColor,
          ),
        ),
      ],
    );
  }
}

class CustomRateWrite extends StatelessWidget {
  Function onRatingChanged;
  double size;
  CustomRateWrite({this.onRatingChanged, this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: RatingBar(
          onRatingChanged: (rating) => onRatingChanged(rating),
          size: size ?? 40.r,
          initialRating: 0,
          isHalfAllowed: true,
          halfFilledIcon: Icons.star,
          filledIcon: Icons.star,
          emptyIcon: Icons.star,
          emptyColor: borderColor,
          halfFilledColor: rateColor,
          filledColor: rateColor,
        ),
      ),
    );
  }
}
