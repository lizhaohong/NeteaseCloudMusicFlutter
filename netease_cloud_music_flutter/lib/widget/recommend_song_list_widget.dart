import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/model/recommend_song_model.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/number_utils.dart';

class RecommendSongListWidget extends StatelessWidget {

  Recommend recommend;

  RecommendSongListWidget({@required this.recommend});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(200),
        child: Column(
      children: <Widget>[
        Container(
          child: Stack(
            alignment: Alignment(0, 0),
            children: <Widget>[
              ClipRRect(
                child: CachedNetworkImage(imageUrl: recommend?.picUrl ?? ""),
                borderRadius: BorderRadius.circular(getWidth(10)),
              ),
              Positioned(
                right: 0,
                top: 5,
                child: Row(
                  children: <Widget>[
                    Image.asset("images/icon_triangle.png", width: getWidth(25), height: getWidth(25)),
                    Space(width: 5),
                    Text("${NumberUtils.amountConversion(recommend.playcount)}", style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    )),
                    Space(width: 5),
                  ],
                ),
              )
            ],
          ),
        ),
        Space(height: 5),
        Text(recommend.name, maxLines: 2, overflow: TextOverflow.ellipsis)
      ],
    ));
  }
}