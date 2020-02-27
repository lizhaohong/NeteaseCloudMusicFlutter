import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/model/music.dart';
import 'package:netease_cloud_music_flutter/model/play_list_detail_model.dart';
import 'package:netease_cloud_music_flutter/model/user_play_list_model.dart';
import 'package:netease_cloud_music_flutter/provider/play_song_provider_model.dart';
import 'package:netease_cloud_music_flutter/route/navigator_util.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_text_style.dart';
import 'package:netease_cloud_music_flutter/utils/net_util.dart';
import 'package:netease_cloud_music_flutter/widget/custom_sliver_future_builder.dart';
import 'package:netease_cloud_music_flutter/widget/footer_tab_widget.dart';
import 'package:netease_cloud_music_flutter/widget/music_list_item_widget.dart';
import 'package:netease_cloud_music_flutter/widget/play_list_app_bar_widget.dart';
import 'package:netease_cloud_music_flutter/widget/play_list_cover_widget.dart';
import 'package:netease_cloud_music_flutter/widget/play_list_desc_dialog.dart';
import 'package:netease_cloud_music_flutter/widget/playing_song_widget.dart';
import 'package:netease_cloud_music_flutter/widget/round_img_widget.dart';
import 'package:provider/provider.dart';

class PlayListPage extends StatefulWidget {

  final Playlist playlist;

  PlayListPage({this.playlist});

  @override
  State createState() => _PlayListPageState();
}

class _PlayListPageState extends State <PlayListPage> {

  PlaylistDetail _playListDetail;

  double _expandedHeight = ScreenUtil().setWidth(630);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: kPlaySongWidgetHeight + Application.bottomBarHeight),
              child: CustomScrollView(
                  slivers: <Widget>[
                    PlayListAppBarWidget(
                      sigma: 20,
                      playOnTap: (model) {
                        playSongs(model, 0);
                      },
                      content: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getWidth(35),
                            right: getWidth(35),
                            top: getWidth(120),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  PlayListCoverWidget(
                                    '${widget.playlist.coverImgUrl}?param=200y200',
                                    width: 250,
                                    playCount: widget.playlist.playCount,
                                  ),
                                  Space(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          widget.playlist.name,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: mWhiteBoldTextStyle,
                                        ),
                                        Space(height:10),
                                        Row(
                                          children: <Widget>[
                                            _playListDetail == null
                                                ? Container()
                                                : RoundImgWidget(
                                                '${_playListDetail.creator.avatarUrl}?param=50y50', 40),
                                            Space(width: 5),
                                            Expanded(
                                              child: _playListDetail == null
                                                  ? Container()
                                                  : Text(
                                                _playListDetail.creator.nickname,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: commonWhite70TextStyle,
                                              ),
                                            ),
                                            _playListDetail == null
                                                ? Container()
                                                : Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Colors.white70,
                                            ),
                                          ],
                                        ),
                                        Space(height: 10),
                                        buildDescription(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Space(height: 15),
                              Container(
                                margin: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
                                alignment: Alignment.center,
                                child: Row(
                                  children: <Widget>[
                                    FooterTabWidget('images/icon_comment.png',
                                        '${_playListDetail == null ? "评论" : _playListDetail.commentCount}',
                                            () {
//                                          NavigatorUtil.goCommentPage(context,
//                                              data: CommentHead(
//                                                  _playListDetail.coverImgUrl,
//                                                  _playListDetail.name,
//                                                  _playListDetail.creator.nickname,
//                                                  _playListDetail.commentCount,
//                                                  _playListDetail.id,
//                                                  CommentType.playList.index));
                                        }),
                                    FooterTabWidget(
                                        'images/icon_share.png',
                                        '${_playListDetail == null ? "分享" : _playListDetail.shareCount}',
                                            () {}),
                                    FooterTabWidget(
                                        'images/icon_download.png', '下载', () {}),
                                    FooterTabWidget(
                                        'images/icon_multi_select.png', '多选', () {}),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      expandedHeight: _expandedHeight,
                      backgroundImg: widget.playlist.coverImgUrl,
                      title: widget.playlist.name,
                      count: _playListDetail == null ? null : _playListDetail.trackCount,
                    ),
                    CustomSliverFutureBuilder<PlayListDetailModel>(
                      futureFunc: NetUtil.getPlayListDetailData,
                      params: {'id': widget.playlist.id},
                      builder: (context,PlayListDetailModel data) {
                        setData(data.playlistDetail);
                        return Consumer<PlaySongProviderModel>(builder: (context, model, child) {
                          return SliverList(
                              delegate: SliverChildBuilderDelegate((context, index) {
                                var d = data.playlistDetail.tracks[index];
                                return MusicListItemWidget(
                                  MusicData(
                                    mvid: d.mv,
                                    index: index + 1,
                                    songName: d.name,
                                    artists:
                                    '${d.ar.map((a) => a.name).toList().join('/')} - ${d.al.name}',
                                  ),
                                  onTap: () {
//                                    playSongs(model, index);
                                  },
                                );
                              }, childCount: data.playlistDetail.trackIds.length));
                        });
                      },
                    ),
                  ]
              )
          ),
          PlayingSongWidget()
        ],
      ),
    );
  }

  void setData(PlaylistDetail data) {
    Future.delayed(Duration(milliseconds: 50), () {
      if (mounted) {
        setState(() {
          _playListDetail = data;
        });
      }
    });
  }

  /// 构建歌单简介
  Widget buildDescription() {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return PlayListDescDialog(_playListDetail);
          },
          barrierDismissible: true,
          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
          transitionDuration: const Duration(milliseconds: 150),
          transitionBuilder: _buildMaterialDialogTransitions,
        );
      },
      child: _playListDetail != null && _playListDetail.description != null
          ? Row(
        children: <Widget>[
          Expanded(
            child: Text(
              _playListDetail.description,
              style: smallWhite70TextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white70,
          ),
        ],
      )
          : Container(),
    );
  }

  void playSongs(PlaySongProviderModel model, int index) {
//    model.playSongs(
//      _data.tracks
//          .map((r) => Song(
//        r.id,
//        name: r.name,
//        picUrl: r.al.picUrl,
//        artists: '${r.ar.map((a) => a.name).toList().join('/')}',
//      ))
//          .toList(),
//      index: index,
//    );
//    NavigatorUtil.goPlaySongsPage(context);
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.linear,
      ),
      child: child,
    );
  }
}