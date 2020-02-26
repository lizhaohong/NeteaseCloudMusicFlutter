import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/page/discover_page.dart';
import 'package:netease_cloud_music_flutter/page/live_page.dart';
import 'package:netease_cloud_music_flutter/page/my_page.dart';
import 'package:netease_cloud_music_flutter/route/navigator_util.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/widget/playing_song_widget.dart';

class HomePage extends StatefulWidget {

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State <HomePage> with TickerProviderStateMixin {
  List _tabItems = ["发现", "我的", "动态"];

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this,length: _tabItems.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: AppBar(
        elevation: 0,
      ), preferredSize: Size.zero),
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(150)),
                        child: TabBar(
                          tabs: _tabItems.map((tabItem) {
                            return Tab(
                              text: tabItem,
                            );
                          }).toList(),
                          controller: _tabController,
                          labelColor: Colors.black,
                          labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                          unselectedLabelStyle: TextStyle(
                              fontSize: 14
                          ),
                          indicator: UnderlineTabIndicator(),
                        ),
                      ),
                      Align(
                        alignment: Alignment(1, 0),
                        child: IconButton(
                            padding: EdgeInsets.only(right: getWidth(10)),
                            icon: Icon(Icons.search),
                            onPressed: (){
                              NavigatorUtil.goSearchPage(context);
                            }),
                      )
                    ],
                  ),
                  Expanded(child: TabBarView(
                    children: <Widget>[
                      DiscoverPage(),
                      MyPage(),
                      LivePage()
                    ],
                    controller: _tabController,
                  ))
                ],
              ),
              PlayingSongWidget()
            ],
          )
      ),
    );
  }
}