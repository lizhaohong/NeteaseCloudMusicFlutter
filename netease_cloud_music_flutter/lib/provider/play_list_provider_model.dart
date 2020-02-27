import 'package:flutter/cupertino.dart';
import 'package:netease_cloud_music_flutter/model/user_model.dart';
import 'package:netease_cloud_music_flutter/model/user_play_list_model.dart';
import 'package:netease_cloud_music_flutter/utils/net_util.dart';

class PlayListProviderModel extends ChangeNotifier {
  UserModel userModel;

  ///我自己的歌单
  List<Playlist> _selfPlayList = [];
  ///我收藏的歌单
  List<Playlist> _collectPlayList = [];
  ///全部的歌单
  List<Playlist> _allPlayList = [];


  List<Playlist> get collectPlayList => _collectPlayList;

  List<Playlist> get allPlayList => _allPlayList;

  List<Playlist> get selfPlayList => _selfPlayList;

  _setPlayList(List<Playlist>playList) {
    _allPlayList = playList;

    _splitPlayList();
  }

  _splitPlayList() {
    _selfPlayList = _allPlayList.where((Playlist playlist) => playlist.creator.userId == userModel.account.id).toList();
    _collectPlayList = _allPlayList.where((Playlist playlist) => playlist.creator.userId != userModel.account.id).toList();
    notifyListeners();
  }

  void addPlayList(Playlist playlist){
    _allPlayList.add(playlist);
    _splitPlayList();
  }

  void delPlayList(Playlist playlist) {
    _allPlayList.remove(playlist);
    _splitPlayList();
  }

  getPlayListData(BuildContext context) async {
    UserPlayListModel userPlayListModel = await NetUtil.getPlayListData(context, params: {
      "uid" : userModel.account.id
    });

    _setPlayList(userPlayListModel.playlist);
  }
}