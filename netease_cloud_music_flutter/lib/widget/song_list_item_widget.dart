import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/model/user_play_list_model.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_text_style.dart';

class SongListItemWidget extends StatelessWidget {

  final Playlist playlist;

  SongListItemWidget({this.playlist});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: getWidth(30)),
      child: Row(
        children: <Widget>[
          ClipRRect(
            child: CachedNetworkImage(imageUrl: playlist.coverImgUrl, width: getWidth(110), height: getWidth(110)),
            borderRadius: BorderRadius.circular(5),
          ),
          Space(width: getWidth(30)),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(playlist.name, maxLines: 2, overflow: TextOverflow.ellipsis),
              Text("${playlist.trackCount}首", style: smallGrayTextStyle)
            ],
          )),
          Space(width: getWidth(30)),
          IconButton(icon: Icon(
              Icons.more_vert,
              color: Colors.grey
          ), onPressed: (){

          })
        ],
      ),
    );
  }
}