import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/model/mv_model.dart';
import 'package:netease_cloud_music_flutter/model/new_album_model.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';

class MVListWidget extends StatelessWidget {
  Data mvData;

  MVListWidget({@required this.mvData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipRRect(
                  child: CachedNetworkImage(imageUrl: mvData?.cover ?? ""),
                  borderRadius: BorderRadius.circular(getWidth(10)),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Image.asset("images/icon_triangle.png", width: 50, height: 50),
                )
              ],
            ),
          ),
          Space(height: 5),
          Text(mvData.name, maxLines: 1, overflow: TextOverflow.ellipsis),
          Space(height: 2),
          Text(mvData.artistName, maxLines: 1, overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}