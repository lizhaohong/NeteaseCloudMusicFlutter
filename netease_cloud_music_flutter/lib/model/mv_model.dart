import 'dart:convert' show json;

class MVModel {

  int updateTime;
  List<Data> data;
  bool hasMore;
  int code;

  MVModel({
    this.updateTime,
    this.data,
    this.hasMore,
    this.code,
  });

  static MVModel fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Data> data = jsonRes['data'] is List ? []: null;
  if(data!=null) {
    for (var item in jsonRes['data']) { if (item != null) { data.add(Data.fromJson(item));  }
    }
  }
  return MVModel(
    updateTime : jsonRes['updateTime'],
    data:data,
    hasMore : jsonRes['hasMore'],
    code : jsonRes['code'],);}

  Map<String, dynamic> toJson() => {
    'updateTime': updateTime,
    'data': data,
    'hasMore': hasMore,
    'code': code,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Data {

  int id;
  String cover;
  String name;
  int playCount;
  Object briefDesc;
  Object desc;
  String artistName;
  int artistId;
  int duration;
  int mark;
  int lastRank;
  int score;
  bool subed;
  List<Artists> artists;

  Data({
    this.id,
    this.cover,
    this.name,
    this.playCount,
    this.briefDesc,
    this.desc,
    this.artistName,
    this.artistId,
    this.duration,
    this.mark,
    this.lastRank,
    this.score,
    this.subed,
    this.artists,
  });

  static Data fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Artists> artists = jsonRes['artists'] is List ? []: null;
  if(artists!=null) {
    for (var item in jsonRes['artists']) { if (item != null) { artists.add(Artists.fromJson(item));  }
    }
  }
  return Data(
    id : jsonRes['id'],
    cover : jsonRes['cover'],
    name : jsonRes['name'],
    playCount : jsonRes['playCount'],
    briefDesc : jsonRes['briefDesc'],
    desc : jsonRes['desc'],
    artistName : jsonRes['artistName'],
    artistId : jsonRes['artistId'],
    duration : jsonRes['duration'],
    mark : jsonRes['mark'],
    lastRank : jsonRes['lastRank'],
    score : jsonRes['score'],
    subed : jsonRes['subed'],
    artists:artists,);}

  Map<String, dynamic> toJson() => {
    'id': id,
    'cover': cover,
    'name': name,
    'playCount': playCount,
    'briefDesc': briefDesc,
    'desc': desc,
    'artistName': artistName,
    'artistId': artistId,
    'duration': duration,
    'mark': mark,
    'lastRank': lastRank,
    'score': score,
    'subed': subed,
    'artists': artists,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Artists {

  int id;
  String name;

  Artists({
    this.id,
    this.name,
  });

  static Artists fromJson(jsonRes)=>jsonRes == null? null:Artists(
    id : jsonRes['id'],
    name : jsonRes['name'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}