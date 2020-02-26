import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double kPlaySongWidgetHeight = 80;

class PlayingSongWidget extends StatefulWidget {

  @override
  State createState() => _PlayingSongWidgetState();
}

class _PlayingSongWidgetState extends State <PlayingSongWidget> {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: kPlaySongWidgetHeight,
        width: ScreenUtil.screenWidth,
        color: Colors.transparent,
      ),
    );
  }
}