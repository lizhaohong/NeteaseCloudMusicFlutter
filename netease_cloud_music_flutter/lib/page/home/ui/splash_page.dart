import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/common/common.dart';

class SplashPage extends StatefulWidget {

  @override
  State createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State <SplashPage> with TickerProviderStateMixin {

  AnimationController _animationController;
  Tween _scaleTween;
  CurvedAnimation _logoAnimation;


  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _scaleTween = Tween(begin: 0, end: 1);
    _logoAnimation = CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _logoAnimation.drive(_scaleTween);
    // 动画延迟500毫秒后执行
    Future.delayed(Duration(milliseconds: 1000), (){
      _animationController.forward();
    });

    _logoAnimation.addStatusListener((listener) {
      if(listener == AnimationStatus.completed) {
        checkUserIsLogin();
        pushToLoginPage();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ScaleTransition(
            scale: _logoAnimation,
            child: Hero(
              tag: 'logo',
              child: Image.asset('images/icon_logo.png'),
            )
        ),
      ),
    );
  }

  void checkUserIsLogin() {
    print("lizhb come here");
  }

  void pushToLoginPage() {
    navigationService.pushNamed("/login");
  }
}
