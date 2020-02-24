import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';

class EmptyWidget extends StatelessWidget {

  double width;

  double height;

  EmptyWidget({this.width = 10, this.height = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(width),
      height: getWidth(height),
    );
  }
}