import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';

class PlayListTitleWidget extends StatefulWidget {

  final String title;

  final int count;

  final VoidCallback onSwitchTap;

  final Widget trailing;

  PlayListTitleWidget({this.title, this.count, this.onSwitchTap, this.trailing});

  @override
  State createState() => _PlayListTitleWidgetState();
}

class _PlayListTitleWidgetState extends State<PlayListTitleWidget> {

  List<String> arrows = [
    'images/icon_down.png',
    'images/icon_up.png',
  ];

  String arrowImageUrl = 'images/icon_up.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getWidth(80),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          if(arrowImageUrl == arrows[0]) {
            arrowImageUrl = arrows[1];
          } else {
            arrowImageUrl = arrows[0];
          }

          widget.onSwitchTap();
        },
        child: Row(
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Image.asset(arrowImageUrl,
                key: ValueKey(arrowImageUrl),
                width: getWidth(30),
              ),
              transitionBuilder: (Widget child, Animation<double> animation){
                return ScaleTransition(scale: animation, child: child);
              },
            ),
            Space(width: 10),
            Text(widget.title),
            Space(width: 5),
            Text("(${widget.count})"),
            Spacer(),
            widget.trailing ?? Container()
          ],
        ),
      ),
    );
  }
}