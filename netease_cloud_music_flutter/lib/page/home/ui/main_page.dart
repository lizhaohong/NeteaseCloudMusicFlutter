import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/page/home/bloc/main_bloc.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainBloc _mainBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: StreamBuilder(
          stream: _mainBloc.textStream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Center(child: Text(snapshot.data))
                : Container();
          }),
    );
  }

  @override
  void didChangeDependencies() {
    _mainBloc = Provider.of<MainBloc>(context);

    _mainBloc.loadData();

    super.didChangeDependencies();
  }
}
