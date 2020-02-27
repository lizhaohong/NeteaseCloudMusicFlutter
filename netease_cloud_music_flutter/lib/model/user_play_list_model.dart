import 'dart:convert' show json;

class UserPlayListModel {

  bool more;
  List<Playlist> playlist;
  int code;

  UserPlayListModel({
    this.more,
    this.playlist,
    this.code,
  });

  static UserPlayListModel fromJson(jsonRes){ if(jsonRes == null) return null;

  List<Playlist> playlist = jsonRes['playlist'] is List ? []: null;
  if(playlist!=null) {
    for (var item in jsonRes['playlist']) { if (item != null) { playlist.add(Playlist.fromJson(item));  }
    }
  }

  return UserPlayListModel(
    more : jsonRes['more'],
    playlist:playlist,
    code : jsonRes['code'],);}

  Map<String, dynamic> toJson() => {
    'more': more,
    'playlist': playlist,
    'code': code,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Playlist {

  List<Object> subscribers;
  bool subscribed;
  Creator creator;
  Object artists;
  Object tracks;
  Object updateFrequency;
  int backgroundCoverId;
  Object backgroundCoverUrl;
  int titleImage;
  Object titleImageUrl;
  Object englishTitle;
  bool opRecommend;
  Object recommendInfo;
  int privacy;
  int trackUpdateTime;
  int totalDuration;
  int trackCount;
  List<Object> tags;
  bool ordered;
  int subscribedCount;
  int cloudTrackCount;
  int userId;
  String name;
  int id;
  Object description;
  int status;
  int playCount;
  int createTime;
  bool highQuality;
  int updateTime;
  int coverImgId;
  bool newImported;
  bool anonimous;
  String commentThreadId;
  String coverImgUrl;
  int specialType;
  int trackNumberUpdateTime;
  int adType;
  String coverImgId_str;

  Playlist({
    this.subscribers,
    this.subscribed,
    this.creator,
    this.artists,
    this.tracks,
    this.updateFrequency,
    this.backgroundCoverId,
    this.backgroundCoverUrl,
    this.titleImage,
    this.titleImageUrl,
    this.englishTitle,
    this.opRecommend,
    this.recommendInfo,
    this.privacy,
    this.trackUpdateTime,
    this.totalDuration,
    this.trackCount,
    this.tags,
    this.ordered,
    this.subscribedCount,
    this.cloudTrackCount,
    this.userId,
    this.name,
    this.id,
    this.description,
    this.status,
    this.playCount,
    this.createTime,
    this.highQuality,
    this.updateTime,
    this.coverImgId,
    this.newImported,
    this.anonimous,
    this.commentThreadId,
    this.coverImgUrl,
    this.specialType,
    this.trackNumberUpdateTime,
    this.adType,
    this.coverImgId_str,
  });

  static Playlist fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> subscribers = jsonRes['subscribers'] is List ? []: null;
  if(subscribers!=null) {
    for (var item in jsonRes['subscribers']) { if (item != null) { subscribers.add(item);  }
    }
  }


  List<Object> tags = jsonRes['tags'] is List ? []: null;
  if(tags!=null) {
    for (var item in jsonRes['tags']) { if (item != null) { tags.add(item);  }
    }
  }
  return Playlist(
    subscribers:subscribers,
    subscribed : jsonRes['subscribed'],
    creator : Creator.fromJson(jsonRes['creator']),
    artists : jsonRes['artists'],
    tracks : jsonRes['tracks'],
    updateFrequency : jsonRes['updateFrequency'],
    backgroundCoverId : jsonRes['backgroundCoverId'],
    backgroundCoverUrl : jsonRes['backgroundCoverUrl'],
    titleImage : jsonRes['titleImage'],
    titleImageUrl : jsonRes['titleImageUrl'],
    englishTitle : jsonRes['englishTitle'],
    opRecommend : jsonRes['opRecommend'],
    recommendInfo : jsonRes['recommendInfo'],
    privacy : jsonRes['privacy'],
    trackUpdateTime : jsonRes['trackUpdateTime'],
    totalDuration : jsonRes['totalDuration'],
    trackCount : jsonRes['trackCount'],
    tags:tags,
    ordered : jsonRes['ordered'],
    subscribedCount : jsonRes['subscribedCount'],
    cloudTrackCount : jsonRes['cloudTrackCount'],
    userId : jsonRes['userId'],
    name : jsonRes['name'],
    id : jsonRes['id'],
    description : jsonRes['description'],
    status : jsonRes['status'],
    playCount : jsonRes['playCount'],
    createTime : jsonRes['createTime'],
    highQuality : jsonRes['highQuality'],
    updateTime : jsonRes['updateTime'],
    coverImgId : jsonRes['coverImgId'],
    newImported : jsonRes['newImported'],
    anonimous : jsonRes['anonimous'],
    commentThreadId : jsonRes['commentThreadId'],
    coverImgUrl : jsonRes['coverImgUrl'],
    specialType : jsonRes['specialType'],
    trackNumberUpdateTime : jsonRes['trackNumberUpdateTime'],
    adType : jsonRes['adType'],
    coverImgId_str : jsonRes['coverImgId_str'],);}

  Map<String, dynamic> toJson() => {
    'subscribers': subscribers,
    'subscribed': subscribed,
    'creator': creator,
    'artists': artists,
    'tracks': tracks,
    'updateFrequency': updateFrequency,
    'backgroundCoverId': backgroundCoverId,
    'backgroundCoverUrl': backgroundCoverUrl,
    'titleImage': titleImage,
    'titleImageUrl': titleImageUrl,
    'englishTitle': englishTitle,
    'opRecommend': opRecommend,
    'recommendInfo': recommendInfo,
    'privacy': privacy,
    'trackUpdateTime': trackUpdateTime,
    'totalDuration': totalDuration,
    'trackCount': trackCount,
    'tags': tags,
    'ordered': ordered,
    'subscribedCount': subscribedCount,
    'cloudTrackCount': cloudTrackCount,
    'userId': userId,
    'name': name,
    'id': id,
    'description': description,
    'status': status,
    'playCount': playCount,
    'createTime': createTime,
    'highQuality': highQuality,
    'updateTime': updateTime,
    'coverImgId': coverImgId,
    'newImported': newImported,
    'anonimous': anonimous,
    'commentThreadId': commentThreadId,
    'coverImgUrl': coverImgUrl,
    'specialType': specialType,
    'trackNumberUpdateTime': trackNumberUpdateTime,
    'adType': adType,
    'coverImgId_str': coverImgId_str,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Creator {

  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  Object expertTags;
  Object experts;
  int djStatus;
  int vipType;
  Object remarkName;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String avatarImgId_str;

  Creator({
    this.defaultAvatar,
    this.province,
    this.authStatus,
    this.followed,
    this.avatarUrl,
    this.accountStatus,
    this.gender,
    this.city,
    this.birthday,
    this.userId,
    this.userType,
    this.nickname,
    this.signature,
    this.description,
    this.detailDescription,
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.authority,
    this.mutual,
    this.expertTags,
    this.experts,
    this.djStatus,
    this.vipType,
    this.remarkName,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.avatarImgId_str,
  });

  static Creator fromJson(jsonRes)=>jsonRes == null? null:Creator(
    defaultAvatar : jsonRes['defaultAvatar'],
    province : jsonRes['province'],
    authStatus : jsonRes['authStatus'],
    followed : jsonRes['followed'],
    avatarUrl : jsonRes['avatarUrl'],
    accountStatus : jsonRes['accountStatus'],
    gender : jsonRes['gender'],
    city : jsonRes['city'],
    birthday : jsonRes['birthday'],
    userId : jsonRes['userId'],
    userType : jsonRes['userType'],
    nickname : jsonRes['nickname'],
    signature : jsonRes['signature'],
    description : jsonRes['description'],
    detailDescription : jsonRes['detailDescription'],
    avatarImgId : jsonRes['avatarImgId'],
    backgroundImgId : jsonRes['backgroundImgId'],
    backgroundUrl : jsonRes['backgroundUrl'],
    authority : jsonRes['authority'],
    mutual : jsonRes['mutual'],
    expertTags : jsonRes['expertTags'],
    experts : jsonRes['experts'],
    djStatus : jsonRes['djStatus'],
    vipType : jsonRes['vipType'],
    remarkName : jsonRes['remarkName'],
    avatarImgIdStr : jsonRes['avatarImgIdStr'],
    backgroundImgIdStr : jsonRes['backgroundImgIdStr'],
    avatarImgId_str : jsonRes['avatarImgId_str'],);

  Map<String, dynamic> toJson() => {
    'defaultAvatar': defaultAvatar,
    'province': province,
    'authStatus': authStatus,
    'followed': followed,
    'avatarUrl': avatarUrl,
    'accountStatus': accountStatus,
    'gender': gender,
    'city': city,
    'birthday': birthday,
    'userId': userId,
    'userType': userType,
    'nickname': nickname,
    'signature': signature,
    'description': description,
    'detailDescription': detailDescription,
    'avatarImgId': avatarImgId,
    'backgroundImgId': backgroundImgId,
    'backgroundUrl': backgroundUrl,
    'authority': authority,
    'mutual': mutual,
    'expertTags': expertTags,
    'experts': experts,
    'djStatus': djStatus,
    'vipType': vipType,
    'remarkName': remarkName,
    'avatarImgIdStr': avatarImgIdStr,
    'backgroundImgIdStr': backgroundImgIdStr,
    'avatarImgId_str': avatarImgId_str,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}