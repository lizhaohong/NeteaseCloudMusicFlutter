import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';

class CommonButtonWidget extends StatelessWidget {

  double width;

  double height;

  VoidCallback onPressed;

  String content;

  double fontSize;

  CommonButtonWidget({this.width = 250,this.height = 80,@required this.onPressed,this.content = "",
  this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(width),
      height: getWidth(height),
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(getWidth(height) / 2))),
        child: Text(
          content,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}