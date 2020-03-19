import 'package:flutter/widgets.dart';
import 'package:netease_cloud_music_flutter/common/bloc/bloc_provider.dart';
import 'package:netease_cloud_music_flutter/common/common.dart';
import 'package:netease_cloud_music_flutter/page/home/ui/main_page.dart';
import 'package:netease_cloud_music_flutter/page/login/bloc/login_bloc.dart';
import 'package:netease_cloud_music_flutter/page/login/data/login_repository.dart';
import 'package:netease_cloud_music_flutter/page/login/ui/login_page.dart';
import 'package:netease_cloud_music_flutter/route/page_builder.dart';

final Map<String, PageBuilder> routes = {
  '/login': (buildContext, route, arguments) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
          LoginRepository(
              Provider.of<CommonRequest>(context, listen: false))),
      child: LoginPage(),
    );
  }
};
