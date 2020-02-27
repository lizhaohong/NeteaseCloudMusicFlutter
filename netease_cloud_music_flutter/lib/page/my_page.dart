import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/provider/play_list_provider_model.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_text_style.dart';
import 'package:netease_cloud_music_flutter/utils/net_util.dart';
import 'package:netease_cloud_music_flutter/widget/play_list_title_widget.dart';
import 'package:netease_cloud_music_flutter/widget/song_list_item_widget.dart';
import 'package:provider/provider.dart';

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

  bool _showMyPlayList = false;

  bool _showCollectPlayList = false;

  PlayListProviderModel _playListProviderModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildMenu(),
            Space(height: getWidth(25), width: double.infinity, color: Color(0xfff5f5f5)),
            _buildPlayList()
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp){
      if(mounted) {
        _playListProviderModel = Provider.of<PlayListProviderModel>(context);
        _playListProviderModel.getPlayListData(context);
      }
    });
  }

  Widget _buildPlayList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
      child: _realBuildPlayList(),
    );
  }

  Widget _realBuildPlayList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PlayListTitleWidget(
          title: "创建的歌单",
          onSwitchTap: (){
            setState(() {
              _showMyPlayList = !_showMyPlayList;
            });
          },
          count: _playListProviderModel.selfPlayList.length,
          trailing: GestureDetector(
            onTap: (){

        },
          child: IconButton(onPressed: (){

          },icon: Icon(Icons.add,
            color: Colors.black87)
          )
          )
        ),
        Visibility(child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            child: SongListItemWidget(playlist: _playListProviderModel.selfPlayList[index]),
            onTap: (){

            },
          );
        }, itemCount: _playListProviderModel.selfPlayList.length),
          visible: _showMyPlayList,
        ),
        PlayListTitleWidget(
            title: "收藏的歌单",
            onSwitchTap: (){
              setState(() {
                _showCollectPlayList = !_showCollectPlayList;
              });
            },
            count: _playListProviderModel.collectPlayList.length,
        ),
        Visibility(child: ListView.builder(
          shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){

                },
                child: SongListItemWidget(playlist: _playListProviderModel.collectPlayList[index]),
              );
            }, itemCount: _playListProviderModel.collectPlayList.length),
          visible: _showCollectPlayList,
        )
      ],
    );
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