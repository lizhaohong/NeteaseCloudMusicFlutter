import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedNetImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double radius;
  final BoxFit fit;

  RoundedNetImage(this.url, {this.width, this.height, this.radius = 10, this.fit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(radius))),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width == null ? null : ScreenUtil().setWidth(width),
        height: height == null ? null : ScreenUtil().setWidth(height),
        fit: fit
      ),
    );
  }
}
