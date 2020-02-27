import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/model/hot_search_model.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_text_style.dart';
import 'package:netease_cloud_music_flutter/utils/net_util.dart';
import 'package:netease_cloud_music_flutter/widget/custom_future_builder_widget.dart';
import 'package:netease_cloud_music_flutter/widget/playing_song_widget.dart';

class SearchPage extends StatefulWidget {

  @override
  State createState() => _SearchPageState();
}

class _SearchPageState extends State <SearchPage> {

  TextEditingController _searchController = TextEditingController();

  List <String> _historySearchList = [];

  FocusNode _blankNode = FocusNode();

  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Theme(data: ThemeData(
              primaryColor: Colors.black54
          ), child: TextField(
            controller: _searchController,
            cursorColor: Colors.red,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      if (_searchController.text.isNotEmpty)
                        setState(() {
                          _searchController.clear();
                        });
                    }),
                hintText: "giao",
                hintStyle: commonGrayTextStyle
            ),
          )
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.only(bottom: kPlaySongWidgetHeight),
              children: <Widget>[
                Visibility(child: _buildHistoryListWidget(), visible: listNoEmpty(_historySearchList)),
                _buildHotSearchListWidget(),
              ],
            ),
            PlayingSongWidget()
          ],
        )
    );
  }

  @override
  void initState() {
    super.initState();

    _historySearchList =
        Application.sharedPreferences.getStringList("historySearchList");
    _historySearchList = ["一个人","我是骚骚猪","giao就完了","JayPark","giao就完了","JayPark","giao就完了","JayPark","giao就完了","JayPark"];
  }

  Widget _buildHistoryListWidget() {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text("历史记录", style: bold18TextStyle)),
              IconButton(icon: Icon(Icons.delete_outline,color: Colors.grey), onPressed: (){
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    content: Text("确定清空全部历史记录？", style: common14GrayTextStyle),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text('取消'),
                          textColor: Colors.red
                      ),
                      FlatButton(
                          onPressed: (){
                            setState(() {
                              _historySearchList.clear();

                              Application.sharedPreferences.setStringList("search_history", []);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('清空'),
                          textColor: Colors.red
                      ),
                    ],
                  );
                });
              })
            ],
          ),
          Wrap(
            spacing: getWidth(20),
            children: _historySearchList.map((content){
              return GestureDetector(
                onTap: (){
                  _searchController.text = content;

                  _search();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                  child: Chip(label: Text(content, style: common14TextStyle), backgroundColor: Color(0xFFf2f2f2)),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildHotSearchListWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 20, top: 10), child: Text("热搜榜", style: bold18TextStyle)),
        CustomFutureBuilder(futureFunc: NetUtil.getHotSearchData,builder: (BuildContext context,
            List<HotSearchModel>list){
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding:EdgeInsets.symmetric(
                horizontal: getWidth(40),
                vertical: getWidth(30)), shrinkWrap:true, itemBuilder: (BuildContext context, int index){
            HotSearchModel model = list[index];

            return GestureDetector(
              onTap: (){
                _searchController.text = model.searchWord;

                _search();
              },
              child: _buildHotSearchListItemWidget(model, index),
            );
          }, itemCount: list.length,);
        }),
      ],
    );
  }

  Widget _buildHotSearchListItemWidget(HotSearchModel model, int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: getWidth(10)),
      child: Row(
        children: <Widget>[
          Text("${index + 1}",style: index < 3
              ? bold18RedTextStyle
              : bold18GrayTextStyle),
          Space(width: 20),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(model.searchWord,style: index < 3
                      ? w500_16TextStyle
                      : common16TextStyle),
                  Space(width: 10),
                  Visibility(child: CachedNetworkImage(imageUrl: model?.iconUrl ?? "", height: getWidth(25),), visible: strNoEmpty(model?.iconUrl))
                ],
              ),
              Space(height: 5),
              Text(model.content,style: common13GrayTextStyle)
            ],
          )),
          Text("${model.score}", style: common14GrayTextStyle, textAlign: TextAlign.right)
        ],
      ),
    );
  }

  void _search() {

  }
}

