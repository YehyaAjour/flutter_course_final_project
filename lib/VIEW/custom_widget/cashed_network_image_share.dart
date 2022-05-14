import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CachedNetworkImageShare extends StatelessWidget {
  final String urlImage;
  final double widthNumber;
  final double heigthNumber;
  final double borderNumber;
  final BoxFit fit;

  CachedNetworkImageShare(
      {this.urlImage, this.heigthNumber, this.widthNumber, this.borderNumber,
      this.fit});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      imageBuilder: (context, imageProvider) => Container(
        width: ScreenUtil().setWidth(widthNumber),
        height: ScreenUtil().setHeight(heigthNumber),
        decoration: BoxDecoration(
          borderRadius:borderNumber == 0 ?null: BorderRadius.circular(10.r),
          shape: borderNumber == 0 ? BoxShape.circle : BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => ClipRRect(
        borderRadius: BorderRadius.circular(borderNumber.r),
        child: SkeletonAnimation(
          borderRadius: BorderRadius.circular(borderNumber.r),
          shimmerColor: Colors.grey,
          child: Container(
            width: ScreenUtil().setWidth(widthNumber),
            height: ScreenUtil().setHeight(heigthNumber),
            decoration: BoxDecoration(
              shape: borderNumber == 0 ? BoxShape.circle : BoxShape.rectangle,
              color: Colors.grey[300],
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: ScreenUtil().setWidth(widthNumber),
        height: ScreenUtil().setHeight(heigthNumber),
        decoration: BoxDecoration(
          shape: borderNumber == 0 ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
