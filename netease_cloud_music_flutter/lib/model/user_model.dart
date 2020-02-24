import 'dart:convert' show json;

class UserModel {

  int loginType;
  int code;
  Account account;
  String token;
  Profile profile;
  List<Bindings> bindings;

  UserModel({
    this.loginType,
    this.code,
    this.account,
    this.token,
    this.profile,
    this.bindings,
  });

  static UserModel fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Bindings> bindings = jsonRes['bindings'] is List ? []: null;
  if(bindings!=null) {
    for (var item in jsonRes['bindings']) { if (item != null) { bindings.add(Bindings.fromJson(item));  }
    }
  }
  return UserModel(
    loginType : jsonRes['loginType'],
    code : jsonRes['code'],
    account : Account.fromJson(jsonRes['account']),
    token : jsonRes['token'],
    profile : Profile.fromJson(jsonRes['profile']),
    bindings:bindings,);}

  Map<String, dynamic> toJson() => {
    'loginType': loginType,
    'code': code,
    'account': account,
    'token': token,
    'profile': profile,
    'bindings': bindings,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Account {

  int id;
  String userName;
  int type;
  int status;
  int whitelistAuthority;
  int createTime;
  String salt;
  int tokenVersion;
  int ban;
  int baoyueVersion;
  int donateVersion;
  int vipType;
  int viptypeVersion;
  bool anonimousUser;

  Account({
    this.id,
    this.userName,
    this.type,
    this.status,
    this.whitelistAuthority,
    this.createTime,
    this.salt,
    this.tokenVersion,
    this.ban,
    this.baoyueVersion,
    this.donateVersion,
    this.vipType,
    this.viptypeVersion,
    this.anonimousUser,
  });

  static Account fromJson(jsonRes)=>jsonRes == null? null:Account(
    id : jsonRes['id'],
    userName : jsonRes['userName'],
    type : jsonRes['type'],
    status : jsonRes['status'],
    whitelistAuthority : jsonRes['whitelistAuthority'],
    createTime : jsonRes['createTime'],
    salt : jsonRes['salt'],
    tokenVersion : jsonRes['tokenVersion'],
    ban : jsonRes['ban'],
    baoyueVersion : jsonRes['baoyueVersion'],
    donateVersion : jsonRes['donateVersion'],
    vipType : jsonRes['vipType'],
    viptypeVersion : jsonRes['viptypeVersion'],
    anonimousUser : jsonRes['anonimousUser'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'userName': userName,
    'type': type,
    'status': status,
    'whitelistAuthority': whitelistAuthority,
    'createTime': createTime,
    'salt': salt,
    'tokenVersion': tokenVersion,
    'ban': ban,
    'baoyueVersion': baoyueVersion,
    'donateVersion': donateVersion,
    'vipType': vipType,
    'viptypeVersion': viptypeVersion,
    'anonimousUser': anonimousUser,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Profile {

  String avatarImgIdStr;
  String backgroundImgIdStr;
  String description;
  int userId;
  int vipType;
  int gender;
  int accountStatus;
  int birthday;
  String nickname;
  int avatarImgId;
  int city;
  int backgroundImgId;
  int userType;
  int province;
  bool defaultAvatar;
  String avatarUrl;
  int djStatus;
  Object experts;
  bool mutual;
  Object remarkName;
  Object expertTags;
  int authStatus;
  String detailDescription;
  bool followed;
  String backgroundUrl;
  String signature;
  int authority;
  String avatarImgId_str;
  int followeds;
  int follows;
  int eventCount;
  int playlistCount;
  int playlistBeSubscribedCount;

  Profile({
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.description,
    this.userId,
    this.vipType,
    this.gender,
    this.accountStatus,
    this.birthday,
    this.nickname,
    this.avatarImgId,
    this.city,
    this.backgroundImgId,
    this.userType,
    this.province,
    this.defaultAvatar,
    this.avatarUrl,
    this.djStatus,
    this.experts,
    this.mutual,
    this.remarkName,
    this.expertTags,
    this.authStatus,
    this.detailDescription,
    this.followed,
    this.backgroundUrl,
    this.signature,
    this.authority,
    this.avatarImgId_str,
    this.followeds,
    this.follows,
    this.eventCount,
    this.playlistCount,
    this.playlistBeSubscribedCount,
  });

  static Profile fromJson(jsonRes)=>jsonRes == null? null:Profile(
    avatarImgIdStr : jsonRes['avatarImgIdStr'],
    backgroundImgIdStr : jsonRes['backgroundImgIdStr'],
    description : jsonRes['description'],
    userId : jsonRes['userId'],
    vipType : jsonRes['vipType'],
    gender : jsonRes['gender'],
    accountStatus : jsonRes['accountStatus'],
    birthday : jsonRes['birthday'],
    nickname : jsonRes['nickname'],
    avatarImgId : jsonRes['avatarImgId'],
    city : jsonRes['city'],
    backgroundImgId : jsonRes['backgroundImgId'],
    userType : jsonRes['userType'],
    province : jsonRes['province'],
    defaultAvatar : jsonRes['defaultAvatar'],
    avatarUrl : jsonRes['avatarUrl'],
    djStatus : jsonRes['djStatus'],
    experts : jsonRes['experts'],
    mutual : jsonRes['mutual'],
    remarkName : jsonRes['remarkName'],
    expertTags : jsonRes['expertTags'],
    authStatus : jsonRes['authStatus'],
    detailDescription : jsonRes['detailDescription'],
    followed : jsonRes['followed'],
    backgroundUrl : jsonRes['backgroundUrl'],
    signature : jsonRes['signature'],
    authority : jsonRes['authority'],
    avatarImgId_str : jsonRes['avatarImgId_str'],
    followeds : jsonRes['followeds'],
    follows : jsonRes['follows'],
    eventCount : jsonRes['eventCount'],
    playlistCount : jsonRes['playlistCount'],
    playlistBeSubscribedCount : jsonRes['playlistBeSubscribedCount'],);

  Map<String, dynamic> toJson() => {
    'avatarImgIdStr': avatarImgIdStr,
    'backgroundImgIdStr': backgroundImgIdStr,
    'description': description,
    'userId': userId,
    'vipType': vipType,
    'gender': gender,
    'accountStatus': accountStatus,
    'birthday': birthday,
    'nickname': nickname,
    'avatarImgId': avatarImgId,
    'city': city,
    'backgroundImgId': backgroundImgId,
    'userType': userType,
    'province': province,
    'defaultAvatar': defaultAvatar,
    'avatarUrl': avatarUrl,
    'djStatus': djStatus,
    'experts': experts,
    'mutual': mutual,
    'remarkName': remarkName,
    'expertTags': expertTags,
    'authStatus': authStatus,
    'detailDescription': detailDescription,
    'followed': followed,
    'backgroundUrl': backgroundUrl,
    'signature': signature,
    'authority': authority,
    'avatarImgId_str': avatarImgId_str,
    'followeds': followeds,
    'follows': follows,
    'eventCount': eventCount,
    'playlistCount': playlistCount,
    'playlistBeSubscribedCount': playlistBeSubscribedCount,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Bindings {

  String url;
  int userId;
  String tokenJsonStr;
  int expiresIn;
  bool expired;
  int bindingTime;
  int refreshTime;
  int id;
  int type;

  Bindings({
    this.url,
    this.userId,
    this.tokenJsonStr,
    this.expiresIn,
    this.expired,
    this.bindingTime,
    this.refreshTime,
    this.id,
    this.type,
  });

  static Bindings fromJson(jsonRes)=>jsonRes == null? null:Bindings(
    url : jsonRes['url'],
    userId : jsonRes['userId'],
    tokenJsonStr : jsonRes['tokenJsonStr'],
    expiresIn : jsonRes['expiresIn'],
    expired : jsonRes['expired'],
    bindingTime : jsonRes['bindingTime'],
    refreshTime : jsonRes['refreshTime'],
    id : jsonRes['id'],
    type : jsonRes['type'],);

  Map<String, dynamic> toJson() => {
    'url': url,
    'userId': userId,
    'tokenJsonStr': tokenJsonStr,
    'expiresIn': expiresIn,
    'expired': expired,
    'bindingTime': bindingTime,
    'refreshTime': refreshTime,
    'id': id,
    'type': type,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}