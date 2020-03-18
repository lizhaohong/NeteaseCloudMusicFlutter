import 'package:flutter/widgets.dart';

class HomePageRoute<T> extends PageRouteBuilder {
  final Widget widget;
  HomePageRoute({@required this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            // 这里的意思是转场过程中，homepage一直保持透明，等转场结束homepage才显示出来，效果相当于延迟显示homepage
            return FadeTransition(
              opacity: new Tween<double>(
                begin: 0,
                end: 0,
              ).animate(animation),
              child: child,
            );
          },
        );
}
