import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/provider/play_song_provider_model.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_text_style.dart';
import 'package:provider/provider.dart';

typedef PlayModelCallback = void Function(PlaySongProviderModel model);

class MusicListHeader extends StatelessWidget implements PreferredSizeWidget {
  MusicListHeader({this.count, this.tail, this.onTap});

  final int count;
  final Widget tail;
  final PlayModelCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(ScreenUtil().setWidth(30))),
      child: Container(
        color: Colors.white,
        child: Consumer<PlaySongProviderModel>(builder: (context, model, child) {
          return InkWell(
            onTap: (){
              onTap(model);
            },
            child: SizedBox.fromSize(
              size: preferredSize,
              child: Row(
                children: <Widget>[
                  Space(height: 20),
                  Icon(
                    Icons.play_circle_outline,
                    size: ScreenUtil().setWidth(50),
                  ),
                  Space(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      "播放全部",
                      style: mCommonTextStyle,
                    ),
                  ),
                  Space(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: count == null
                        ? Container()
                        : Text(
                            "(共$count首)",
                            style: smallGrayTextStyle,
                          ),
                  ),
                  Spacer(),
                  tail ?? Container(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setWidth(100));
}
