import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:netease_cloud_music_flutter/model/new_album_model.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';

class NewAlbumListWidget extends StatelessWidget {
  Albums albums;

  NewAlbumListWidget({@required this.albums});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getWidth(200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            child: CachedNetworkImage(imageUrl: albums?.picUrl ?? ""),
            borderRadius: BorderRadius.circular(getWidth(10)),
          ),
          Space(height: 5),
          Text(albums.name, maxLines: 1, overflow: TextOverflow.ellipsis),
          Space(height: 2),
          Text(albums.artist.name, maxLines: 1, overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}