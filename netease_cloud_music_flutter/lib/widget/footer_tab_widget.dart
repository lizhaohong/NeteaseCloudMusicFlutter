import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_text_style.dart';

class FooterTabWidget extends StatelessWidget {
  final String img;
  final String text;
  final VoidCallback onTap;


  FooterTabWidget(this.img, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Image.asset(img, width: ScreenUtil().setWidth(50), height: ScreenUtil().setWidth(50),),
            Space(height: 8),
            Text(text, style: common14White70TextStyle,)
          ],
        ),
      ),
    );
  }
}