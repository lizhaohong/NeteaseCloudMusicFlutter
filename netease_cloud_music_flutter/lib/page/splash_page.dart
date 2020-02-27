import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/provider/play_list_provider_model.dart';
import 'package:netease_cloud_music_flutter/provider/user_provider_model.dart';
import 'package:netease_cloud_music_flutter/route/navigator_util.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/net_util.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {

  @override
  State createState() => _SplashPageState();
}

class _SplashPageState extends State <SplashPage> with TickerProviderStateMixin {
  Tween _scaleTween;
  AnimationController _logoController;
  CurvedAnimation _logoAnimation;

  @override
  Widget build(BuildContext context) {
    NetUtil.init();
    ScreenUtil.init(context,width:750,height:1334);

    Size size = MediaQuery.of(context).size;
    Application.screenWidth = size.width;
    Application.screenHeight = size.height;
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;

    print("Application.screenWidth = ${Application.screenWidth}");
    print("Application.screenHeight = ${Application.screenHeight}");
    print("Application.statusBarHeight = ${Application.statusBarHeight}");
    print("Application.bottomBarHeight = ${Application.bottomBarHeight}");

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ScaleTransition(
          scale: _logoAnimation,
          child:Hero(
              tag: HeroTagLogo,
              child: Image.asset("images/icon_logo.png")),
        )),
    );
  }

  @override
  void initState() {
    super.initState();

    _scaleTween = Tween(begin: 0, end: 1);
    _logoController = AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _logoController.drive(_scaleTween);
    Future.delayed(Duration(milliseconds: 500), (){
      _logoController.forward();
    });
    _logoAnimation = CurvedAnimation(parent: _logoController, curve: Curves.linear);

    _logoAnimation.addStatusListener((status){
      if(status == AnimationStatus.completed) {
        Future.delayed(Duration(milliseconds: 500),(){
          goToLogin();
        });
      }
    });
  }

  void goToLogin() async {
    await Application.initSharedPreferences();

    UserProviderModel userViewModel = Provider.of<UserProviderModel>(context);
    userViewModel.initUser();

    if(userViewModel.user != null) {
      await NetUtil.refreshLogin(context).then((value){
        if(value.data != -1) {
          NavigatorUtil.goHomePage(context);
        }
      });
      Provider.of<PlayListProviderModel>(context).userModel = userViewModel.user;
    } else {
      NavigatorUtil.goLoginPage(context);
    }
  }
}