import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/model/play_list_detail_model.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_text_style.dart';
import 'package:netease_cloud_music_flutter/widget/rounded_net_image.dart';
import 'package:netease_cloud_music_flutter/widget/tag_widget.dart';

class PlayListDescDialog extends StatelessWidget {
  final PlaylistDetail _data;

  PlayListDescDialog(this._data);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: '${_data.coverImgUrl}?param=200y200',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 30,
                sigmaX: 30,
              ),
              child: Container(
                color: Colors.black38,
              ),
            ),
            SafeArea(
              bottom: false,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: ScreenUtil().setWidth(40),
                    top: ScreenUtil().setWidth(10),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: ScreenUtil().setWidth(60),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(100)),
                      child: Column(
                        children: <Widget>[
                          Space(height: 150),
                          Align(
                            alignment: Alignment.topCenter,
                            child: RoundedNetImage(
                              '${_data.coverImgUrl}?param=200y200',
                              width: 400,
                              height: 400,
                            ),
                          ),
                        Space(height: 40),
                          Text(
                            _data.name,
                            textAlign: TextAlign.center,
                            style: mWhiteBoldTextStyle,
                            softWrap: true,
                          ),
                        Space(height: 40),
                          Image.asset(
                            'images/icon_line_1.png',
                            width: Application.screenWidth * 3 / 4,
                          ),
                        Space(height: 20),
                          _data.tags.isEmpty
                              ? Container()
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '标签：',
                                      style: common14WhiteTextStyle,
                                    ),
                                    ..._data.tags
                                        .map((t) => TagWidget(t))
                                        .toList()
                                  ],
                                ),
                          _data.tags.isEmpty ? Container() : Space(height: 40),
                          Text(
                            _data.description,
                            style: common14WhiteTextStyle,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
