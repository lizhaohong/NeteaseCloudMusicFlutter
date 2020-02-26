import 'dart:convert' show json;

class RecommendSongModel {

  int code;
  bool featureFirst;
  bool haveRcmdSongs;
  List<Recommend> recommend;

  RecommendSongModel({
    this.code,
    this.featureFirst,
    this.haveRcmdSongs,
    this.recommend,
  });

  static RecommendSongModel fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Recommend> recommend = jsonRes['recommend'] is List ? []: null;
  if(recommend!=null) {
    for (var item in jsonRes['recommend']) { if (item != null) { recommend.add(Recommend.fromJson(item));  }
    }
  }
  return RecommendSongModel(
    code : jsonRes['code'],
    featureFirst : jsonRes['featureFirst'],
    haveRcmdSongs : jsonRes['haveRcmdSongs'],
    recommend:recommend,);}

  Map<String, dynamic> toJson() => {
    'code': code,
    'featureFirst': featureFirst,
    'haveRcmdSongs': haveRcmdSongs,
    'recommend': recommend,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Recommend {

  int id;
  int type;
  String name;
  String copywriter;
  String picUrl;
  int playcount;
  int createTime;
  Creator creator;
  int trackCount;
  int userId;
  String alg;

  Recommend({
    this.id,
    this.type,
    this.name,
    this.copywriter,
    this.picUrl,
    this.playcount,
    this.createTime,
    this.creator,
    this.trackCount,
    this.userId,
    this.alg,
  });

  static Recommend fromJson(jsonRes)=>jsonRes == null? null:Recommend(
    id : jsonRes['id'],
    type : jsonRes['type'],
    name : jsonRes['name'],
    copywriter : jsonRes['copywriter'],
    picUrl : jsonRes['picUrl'],
    playcount : jsonRes['playcount'],
    createTime : jsonRes['createTime'],
    creator : Creator.fromJson(jsonRes['creator']),
    trackCount : jsonRes['trackCount'],
    userId : jsonRes['userId'],
    alg : jsonRes['alg'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'name': name,
    'copywriter': copywriter,
    'picUrl': picUrl,
    'playcount': playcount,
    'createTime': createTime,
    'creator': creator,
    'trackCount': trackCount,
    'userId': userId,
    'alg': alg,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Creator {

  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  bool followed;
  String avatarImgIdStr;
  String detailDescription;
  String backgroundImgIdStr;
  int accountStatus;
  int userId;
  int vipType;
  int province;
  String avatarUrl;
  int authStatus;
  int userType;
  String nickname;
  int gender;
  int birthday;
  int city;
  bool mutual;
  Object remarkName;
  bool defaultAvatar;
  Object expertTags;
  int djStatus;
  String description;
  String signature;
  int authority;

  Creator({
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.followed,
    this.avatarImgIdStr,
    this.detailDescription,
    this.backgroundImgIdStr,
    this.accountStatus,
    this.userId,
    this.vipType,
    this.province,
    this.avatarUrl,
    this.authStatus,
    this.userType,
    this.nickname,
    this.gender,
    this.birthday,
    this.city,
    this.mutual,
    this.remarkName,
    this.defaultAvatar,
    this.expertTags,
    this.djStatus,
    this.description,
    this.signature,
    this.authority,
  });

  static Creator fromJson(jsonRes)=>jsonRes == null? null:Creator(
    avatarImgId : jsonRes['avatarImgId'],
    backgroundImgId : jsonRes['backgroundImgId'],
    backgroundUrl : jsonRes['backgroundUrl'],
    followed : jsonRes['followed'],
    avatarImgIdStr : jsonRes['avatarImgIdStr'],
    detailDescription : jsonRes['detailDescription'],
    backgroundImgIdStr : jsonRes['backgroundImgIdStr'],
    accountStatus : jsonRes['accountStatus'],
    userId : jsonRes['userId'],
    vipType : jsonRes['vipType'],
    province : jsonRes['province'],
    avatarUrl : jsonRes['avatarUrl'],
    authStatus : jsonRes['authStatus'],
    userType : jsonRes['userType'],
    nickname : jsonRes['nickname'],
    gender : jsonRes['gender'],
    birthday : jsonRes['birthday'],
    city : jsonRes['city'],
    mutual : jsonRes['mutual'],
    remarkName : jsonRes['remarkName'],
    defaultAvatar : jsonRes['defaultAvatar'],
    expertTags : jsonRes['expertTags'],
    djStatus : jsonRes['djStatus'],
    description : jsonRes['description'],
    signature : jsonRes['signature'],
    authority : jsonRes['authority'],);

  Map<String, dynamic> toJson() => {
    'avatarImgId': avatarImgId,
    'backgroundImgId': backgroundImgId,
    'backgroundUrl': backgroundUrl,
    'followed': followed,
    'avatarImgIdStr': avatarImgIdStr,
    'detailDescription': detailDescription,
    'backgroundImgIdStr': backgroundImgIdStr,
    'accountStatus': accountStatus,
    'userId': userId,
    'vipType': vipType,
    'province': province,
    'avatarUrl': avatarUrl,
    'authStatus': authStatus,
    'userType': userType,
    'nickname': nickname,
    'gender': gender,
    'birthday': birthday,
    'city': city,
    'mutual': mutual,
    'remarkName': remarkName,
    'defaultAvatar': defaultAvatar,
    'expertTags': expertTags,
    'djStatus': djStatus,
    'description': description,
    'signature': signature,
    'authority': authority,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}