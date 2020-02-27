import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/model/banners_model.dart';
import 'package:netease_cloud_music_flutter/model/mv_model.dart';
import 'package:netease_cloud_music_flutter/model/new_album_model.dart';
import 'package:netease_cloud_music_flutter/model/recommend_song_model.dart';
import 'package:netease_cloud_music_flutter/route/navigator_util.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/net_util.dart';
import 'package:netease_cloud_music_flutter/widget/custom_banner_widget.dart';
import 'package:netease_cloud_music_flutter/widget/custom_future_builder_widget.dart';
import 'package:netease_cloud_music_flutter/widget/mv_list_widget.dart';
import 'package:netease_cloud_music_flutter/widget/new_album_list_widget.dart';
import 'package:netease_cloud_music_flutter/widget/playing_song_widget.dart';
import 'package:netease_cloud_music_flutter/widget/recommend_song_list_widget.dart';

class DiscoverPage extends StatefulWidget {

  @override
  State createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State <DiscoverPage> with AutomaticKeepAliveClientMixin {

  Map _categoryMap = {
    '每日推荐': 'images/icon_daily.png',
    '歌单': 'images/icon_playlist.png',
    '排行榜': 'images/icon_rank.png',
    '电台': 'images/icon_radio.png',
    '直播': 'images/icon_look.png',
  };
  List newSongList = List();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: kPlaySongWidgetHeight),
      child: Column(
        children: <Widget>[
          _buildBanner(),
          _buildCategory(),
          _buildRecommendSongList(),
          _buildNewSongList(),
          _buildMVList(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildMVList() {
    return CustomFutureBuilder(futureFunc: NetUtil.getTopMvData, builder: (BuildContext context, MVModel mvModel){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left:getWidth(25), bottom: getWidth(25)), child: Text("MV 排行")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getWidth(25)),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: mvModel.data.length,
              itemBuilder: (BuildContext context, int index){
                return MVListWidget(mvData: mvModel.data[index]);
              },
              separatorBuilder: (context, index) {
                return Space(height: getWidth(30));
              },
            ),
          )
        ],
      );
    });
  }

  Widget _buildRecommendSongList() {
    return CustomFutureBuilder(futureFunc: NetUtil.getRecommendSongData, builder: (BuildContext context, RecommendSongModel recommendSongModel){

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left:getWidth(25), bottom: getWidth(25)), child: Text("推荐歌单")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getWidth(25)),
            height: getWidth(300),
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: recommendSongModel.recommend.length,
              itemBuilder: (BuildContext context, int index){
                return RecommendSongListWidget(recommend: recommendSongModel.recommend[index]);
              },
              separatorBuilder: (context, index) {
                return Space(width: getWidth(30));
              },
            ),
          )
        ],
      );
    });
  }

  Widget _buildNewSongList() {
    return CustomFutureBuilder(futureFunc: NetUtil.getNewAlbumData, builder: (BuildContext context, NewAlbumModel newAlbumModel){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left:getWidth(25), bottom: getWidth(25)), child: Text("新碟上架")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: getWidth(25)),
            height: getWidth(300),
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: newAlbumModel.albums.length,
              itemBuilder: (BuildContext context, int index){
                return NewAlbumListWidget(albums: newAlbumModel.albums[index]);
              },
              separatorBuilder: (context, index) {
                return Space(width: getWidth(30));
              },
            ),
          )
        ],
      );
    });
  }

  Widget _buildCategory() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getWidth(30)),
      child: Row(
        children: _categoryMap.keys.toList().map((key){
          String value = _categoryMap[key];

          bool keyIsDailyRecomment = key == "每日推荐";

          return Expanded(child: GestureDetector(
            onTap: (){
              if(keyIsDailyRecomment) {
                print("去每日推荐");
              } else {
                print(key);
              }
            },
            child: Column(
              children: <Widget>[
                Container(
                  width: getWidth(100),
                  height: getWidth(100),
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(getWidth(100))),
                  child: Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Image.asset(value),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Visibility(
                          visible: keyIsDailyRecomment,
                          child: Text("${DateUtil.formatDate(DateTime.now(), format: "dd")}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Space(height: 10),
                Text(key, style:TextStyle(color: Colors.black87, fontSize: 14))
              ],
            ),
          ));
        }).toList(),
      ),
    );
  }

  Widget _buildBanner() {
    return CustomFutureBuilder(
        futureFunc: NetUtil.getBannerData,
        builder: (
            BuildContext context,
            BannersModel model){

          return CustomBannerWidget(model.banners.map((Banners banner){
            return "${banner.imageUrl}?param=540y210";
          }).toList(), typeTitleList: model.banners.map((Banners banner){
            return "${banner.typeTitle}";
          }).toList(), onTap: (int index){
            Banners banner = model.banners[index];

            if(strNoEmpty(banner.url)) {
              NavigatorUtil.goWebViewPage(context, params: {
                "url" : banner.url,
                "title" : banner.typeTitle
              });
            } else {
              //处理其他情况
            }
          });
        });
  }
}