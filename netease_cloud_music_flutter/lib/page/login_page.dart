import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/route/navigator_util.dart';
import 'package:netease_cloud_music_flutter/utils/common.dart';
import 'package:netease_cloud_music_flutter/utils/common_util.dart';
import 'package:netease_cloud_music_flutter/viewModel/user_view_model.dart';
import 'package:netease_cloud_music_flutter/widget/common_button_widget.dart';
import 'package:netease_cloud_music_flutter/widget/empty_widget.dart';
import 'package:provider/provider.dart';

TextEditingController _phoneController = TextEditingController();

TextEditingController _passwordController = TextEditingController();

class LoginPage extends StatefulWidget {

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State <LoginPage> with TickerProviderStateMixin {

  AnimationController _loginController;
  Animation _loginAnimation;
  Tween _positionTween;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: getWidth(80),
              right: getWidth(80),
              top: getWidth(30)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(tag: HeroTagLogo, child: Image.asset("images/icon_logo.png", width: getWidth(90), height: getWidth(90))),
              _loginWidget()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _loginController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _loginAnimation = CurvedAnimation(parent: _loginController, curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 500),(){
      _loginController.forward();
    });
  }

  Widget _loginWidget(){
    return Theme(data: ThemeData(primaryColor: Colors.red), child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: getWidth(30)),
          child: Text("欢迎回来",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 34,
          )),
        ),
        Container(
          margin: EdgeInsets.only(top: getWidth(3)),
          child: Text("Flutter版本网易云音乐",style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          )),
        ),
        EmptyWidget(height: getWidth(50)),
        TextField(
          controller: _phoneController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "请输入手机号码",
            prefixIcon: Icon(
              Icons.phone_iphone,
              color: Colors.grey,
            )
          ),
        ),
        EmptyWidget(height: getWidth(40)),
        TextField(
          obscureText: true,
          controller: _passwordController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: "请输入密码",
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey,
              )
          ),
        ),
        EmptyWidget(height: getWidth(120), width: getWidth(120)),
        Consumer<UserViewModel>(builder: (BuildContext context, UserViewModel userViewModel, Widget child){
          return CommonButtonWidget(
              onPressed: (){
                String phone = _phoneController.text;
                String password = _passwordController.text;

                if(phone.isEmpty || password.isEmpty) {
                  CommonUtil.showToast("请输入手机号或密码");
                  return;
                }

                userViewModel.login(
                    context,
                    phone,
                    password
                ).then((value){
                  if(value != null) {
                    NavigatorUtil.goHomePage(context);
                  }
                });
              },
              width: double.infinity,
              content: "登录"
          );
        })
      ]
    ));
  }
}