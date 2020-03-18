
import 'package:netease_cloud_music_flutter/common/bloc/bloc_provider.dart';
import 'package:netease_cloud_music_flutter/home/bloc/main_bloc.dart';
import 'package:netease_cloud_music_flutter/home/ui/main_page.dart';
import 'package:netease_cloud_music_flutter/route/page_builder.dart';

/// All page routes of the APP
final Map<String, PageBuilder> pageRoutes = {
  "/": (buildContext, route, arguments) {
    return BlocProvider<MainBloc>(
        create: (context) => MainBloc(),
        child: MainPage()
    );
  },
};
