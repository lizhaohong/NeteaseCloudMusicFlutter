import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_text_style.dart';
import 'package:netease_cloud_music_flutter/widget/empty_widget.dart';

class NetErrorWidget extends StatelessWidget {
  final VoidCallback callback;

  NetErrorWidget({@required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: Alignment.center,
        height: getWidth(200),
        child: Column(
          children: <Widget>[
            Icon(Icons.error_outline, size: getWidth(80)),
            EmptyWidget(height: getWidth(15)),
            Text("点击重新请求", style: commonTextStyle)
          ],    
        ),
      ),
    ); 
  }
}