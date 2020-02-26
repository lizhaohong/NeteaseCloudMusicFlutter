import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/model/banners_model.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_util.dart';

class CustomBannerWidget extends StatefulWidget {

  List<String> _imageList;

  List<String> typeTitleList;

  final double leftMargin;

  final ValueChanged<int> onTap;

  CustomBannerWidget(this._imageList, {this.typeTitleList, this.leftMargin = 30, this.onTap});

  @override
  State createState() => _CustomBannerWidgetState();
}

class _CustomBannerWidgetState extends State <CustomBannerWidget> {
  PageController _pageController;
  Timer _timer;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: (1080 + (widget.leftMargin * 2)) /
            (400 - (widget.leftMargin)),
        child: Container(
          child: Stack(
            alignment: Alignment(0, 1),
            children: <Widget>[
              _buildPageView(),
              _buildIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentIndex);
    _initTimer();
  }

  _initTimer() {

  }

  Widget _buildPageView() {
    return PageView.builder(
        onPageChanged: (int index){
          setState(() {
            _currentIndex = index;

          });
        },
        controller: _pageController,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
              onTap: (){
                widget.onTap(index);
              },
              child:Stack(
                alignment: Alignment(0, 0),
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: getWidth(widget.leftMargin)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(getWidth(10))),
                      child: CommonUtil.showNetImage(widget._imageList[index], fit: BoxFit.fitWidth),
                    ),
                  ),
                  _buildTypeTitle(widget.typeTitleList[index])
                ],
              )
          );
        });
  }

  Widget _buildTypeTitle(String title) {
    return Positioned(
        right: 0,
        bottom: 0,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          margin: EdgeInsets.only(right: getWidth(widget.leftMargin)),
          child: Text(title ?? "", style: TextStyle(color: Colors.white)),
          decoration: BoxDecoration(
              color:Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getWidth(10)),
                  bottomRight: Radius.circular(getWidth(10))
              )
          ),
        ),
    );
  }

  Widget _buildIndicator() {
    return Positioned(
        bottom: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget._imageList.map((s){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: ClipOval(
                child: Container(
                  width: getWidth(12),
                  height: getWidth(12),
                  color: s == widget._imageList[_currentIndex % widget._imageList.length]
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        )
    );
  }
}