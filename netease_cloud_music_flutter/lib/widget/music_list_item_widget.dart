import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/model/music.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_text_style.dart';
import 'package:netease_cloud_music_flutter/widget/rounded_net_image.dart';

class MusicListItemWidget extends StatelessWidget {
  final MusicData _data;
  final VoidCallback onTap;

  MusicListItemWidget(this._data, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: Application.screenWidth,
        height: ScreenUtil().setWidth(120),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _data.index == null && _data.picUrl == null
                ? Container()
                : Space(height: 15,),
            _data.picUrl == null
                ? Container()
                : RoundedNetImage(
                    '${_data.picUrl}?param=150y150',
                    width: 100,
                    height: 100,
                    radius: 5,
                  ),
            _data.index == null
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(60),
                    height: ScreenUtil().setWidth(50),
                    child: Text(
                      _data.index.toString(),
                      style: mGrayTextStyle,
                    ),
                  ),
            _data.index == null && _data.picUrl == null
                ? Container()
                : Space(height: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _data.songName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: commonTextStyle,
                  ),
                  Space(height: 10),
                  Text(
                    _data.artists,
                    style: smallGrayTextStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: _data.mvid == 0
                  ? Container()
                  : IconButton(
                      icon: Icon(Icons.play_circle_outline),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
            ),
            Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
