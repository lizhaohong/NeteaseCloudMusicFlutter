import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_text_style.dart';

class MyPage extends StatefulWidget {

  @override
  State createState() => _MyPageState();
}

class _MyPageState extends State <MyPage> with AutomaticKeepAliveClientMixin {

  Map<String, String> topMenuData = {
    '本地音乐': 'images/icon_music.png',
    '最近播放': 'images/icon_late_play.png',
    '下载管理': 'images/icon_download_black.png',
    '我的电台': 'images/icon_broadcast.png',
    '我的收藏': 'images/icon_collect.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildMenu(),
            Space(height: getWidth(25), width: double.infinity, color: Color(0xfff5f5f5)),
            _buildCreateSongList(),
            _buildCollectSongList(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildCreateSongList() {
      return Container(height: 100, color: Colors.red);
  }

  Widget _buildCollectSongList() {
    return Container(height: 100, color: Colors.blue);
  }

  Widget _buildMenu() {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: topMenuData.keys.length,
      itemBuilder: (BuildContext context, int index){
        String key = topMenuData.keys.toList()[index];
        return buildMenuItem(key, topMenuData[key]);
      },
      separatorBuilder: (context, index) {
        return Padding(padding: EdgeInsets.only(left: getWidth(140)), child: Space(height: getWidth(0.3), color: Colors.grey,));
      },
    );
  }

  Widget buildMenuItem(String key, String value) {
    return Container(
      height: getWidth(110),
      child: Row(
        children: <Widget>[
          Space(width: getWidth(30)),
          Image.asset(value, width: getWidth(100), height: getWidth(100),),
          Expanded(child: Text(key, style: commonTextStyle))
        ],
      ),
    );
  }
}