
import 'dart:convert' show json;

class PlayListDetailModel {

  int code;
  Object relatedVideos;
  PlaylistDetail playlistDetail;
  Object urls;
  List<Privileges> privileges;

  PlayListDetailModel({
    this.code,
    this.relatedVideos,
    this.playlistDetail,
    this.urls,
    this.privileges,
  });

  static PlayListDetailModel fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Privileges> privileges = jsonRes['privileges'] is List ? []: null;
  if(privileges!=null) {
    for (var item in jsonRes['privileges']) { if (item != null) { privileges.add(Privileges.fromJson(item));  }
    }
  }
  return PlayListDetailModel(
    code : jsonRes['code'],
    relatedVideos : jsonRes['relatedVideos'],
    playlistDetail : PlaylistDetail.fromJson(jsonRes['playlist']),
    urls : jsonRes['urls'],
    privileges:privileges,);}

  Map<String, dynamic> toJson() => {
    'code': code,
    'relatedVideos': relatedVideos,
    'playlist': playlistDetail,
    'urls': urls,
    'privileges': privileges,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class PlaylistDetail {

  List<Object> subscribers;
  bool subscribed;
  Creator creator;
  List<Tracks> tracks;
  List<TrackIds> trackIds;
  Object updateFrequency;
  int backgroundCoverId;
  Object backgroundCoverUrl;
  int titleImage;
  Object titleImageUrl;
  Object englishTitle;
  bool opRecommend;
  int status;
  int subscribedCount;
  int cloudTrackCount;
  int trackNumberUpdateTime;
  int trackUpdateTime;
  String coverImgUrl;
  int updateTime;
  String commentThreadId;
  int privacy;
  bool newImported;
  int coverImgId;
  int userId;
  int playCount;
  int trackCount;
  int specialType;
  int adType;
  bool ordered;
  Object description;
  List<Object> tags;
  int createTime;
  bool highQuality;
  String name;
  int id;
  int shareCount;
  String coverImgId_str;
  int commentCount;

  PlaylistDetail({
    this.subscribers,
    this.subscribed,
    this.creator,
    this.tracks,
    this.trackIds,
    this.updateFrequency,
    this.backgroundCoverId,
    this.backgroundCoverUrl,
    this.titleImage,
    this.titleImageUrl,
    this.englishTitle,
    this.opRecommend,
    this.status,
    this.subscribedCount,
    this.cloudTrackCount,
    this.trackNumberUpdateTime,
    this.trackUpdateTime,
    this.coverImgUrl,
    this.updateTime,
    this.commentThreadId,
    this.privacy,
    this.newImported,
    this.coverImgId,
    this.userId,
    this.playCount,
    this.trackCount,
    this.specialType,
    this.adType,
    this.ordered,
    this.description,
    this.tags,
    this.createTime,
    this.highQuality,
    this.name,
    this.id,
    this.shareCount,
    this.coverImgId_str,
    this.commentCount,
  });

  static PlaylistDetail fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> subscribers = jsonRes['subscribers'] is List ? []: null;
  if(subscribers!=null) {
    for (var item in jsonRes['subscribers']) { if (item != null) { subscribers.add(item);  }
    }
  }


  List<Tracks> tracks = jsonRes['tracks'] is List ? []: null;
  if(tracks!=null) {
    for (var item in jsonRes['tracks']) { if (item != null) { tracks.add(Tracks.fromJson(item));  }
    }
  }


  List<TrackIds> trackIds = jsonRes['trackIds'] is List ? []: null;
  if(trackIds!=null) {
    for (var item in jsonRes['trackIds']) { if (item != null) { trackIds.add(TrackIds.fromJson(item));  }
    }
  }


  List<Object> tags = jsonRes['tags'] is List ? []: null;
  if(tags!=null) {
    for (var item in jsonRes['tags']) { if (item != null) { tags.add(item);  }
    }
  }
  return PlaylistDetail(
    subscribers:subscribers,
    subscribed : jsonRes['subscribed'],
    creator : Creator.fromJson(jsonRes['creator']),
    tracks:tracks,
    trackIds:trackIds,
    updateFrequency : jsonRes['updateFrequency'],
    backgroundCoverId : jsonRes['backgroundCoverId'],
    backgroundCoverUrl : jsonRes['backgroundCoverUrl'],
    titleImage : jsonRes['titleImage'],
    titleImageUrl : jsonRes['titleImageUrl'],
    englishTitle : jsonRes['englishTitle'],
    opRecommend : jsonRes['opRecommend'],
    status : jsonRes['status'],
    subscribedCount : jsonRes['subscribedCount'],
    cloudTrackCount : jsonRes['cloudTrackCount'],
    trackNumberUpdateTime : jsonRes['trackNumberUpdateTime'],
    trackUpdateTime : jsonRes['trackUpdateTime'],
    coverImgUrl : jsonRes['coverImgUrl'],
    updateTime : jsonRes['updateTime'],
    commentThreadId : jsonRes['commentThreadId'],
    privacy : jsonRes['privacy'],
    newImported : jsonRes['newImported'],
    coverImgId : jsonRes['coverImgId'],
    userId : jsonRes['userId'],
    playCount : jsonRes['playCount'],
    trackCount : jsonRes['trackCount'],
    specialType : jsonRes['specialType'],
    adType : jsonRes['adType'],
    ordered : jsonRes['ordered'],
    description : jsonRes['description'],
    tags:tags,
    createTime : jsonRes['createTime'],
    highQuality : jsonRes['highQuality'],
    name : jsonRes['name'],
    id : jsonRes['id'],
    shareCount : jsonRes['shareCount'],
    coverImgId_str : jsonRes['coverImgId_str'],
    commentCount : jsonRes['commentCount'],);}

  Map<String, dynamic> toJson() => {
    'subscribers': subscribers,
    'subscribed': subscribed,
    'creator': creator,
    'tracks': tracks,
    'trackIds': trackIds,
    'updateFrequency': updateFrequency,
    'backgroundCoverId': backgroundCoverId,
    'backgroundCoverUrl': backgroundCoverUrl,
    'titleImage': titleImage,
    'titleImageUrl': titleImageUrl,
    'englishTitle': englishTitle,
    'opRecommend': opRecommend,
    'status': status,
    'subscribedCount': subscribedCount,
    'cloudTrackCount': cloudTrackCount,
    'trackNumberUpdateTime': trackNumberUpdateTime,
    'trackUpdateTime': trackUpdateTime,
    'coverImgUrl': coverImgUrl,
    'updateTime': updateTime,
    'commentThreadId': commentThreadId,
    'privacy': privacy,
    'newImported': newImported,
    'coverImgId': coverImgId,
    'userId': userId,
    'playCount': playCount,
    'trackCount': trackCount,
    'specialType': specialType,
    'adType': adType,
    'ordered': ordered,
    'description': description,
    'tags': tags,
    'createTime': createTime,
    'highQuality': highQuality,
    'name': name,
    'id': id,
    'shareCount': shareCount,
    'coverImgId_str': coverImgId_str,
    'commentCount': commentCount,
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
  String backgroundImgIdStr;
  String avatarImgIdStr;
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
    this.backgroundImgIdStr,
    this.avatarImgIdStr,
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
    backgroundImgIdStr : jsonRes['backgroundImgIdStr'],
    avatarImgIdStr : jsonRes['avatarImgIdStr'],
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
    'backgroundImgIdStr': backgroundImgIdStr,
    'avatarImgIdStr': avatarImgIdStr,
    'avatarImgId_str': avatarImgId_str,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Tracks {

  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  List<Object> alia;
  int pop;
  int st;
  String rt;
  int fee;
  int v;
  Object crbt;
  String cf;
  Al al;
  int dt;
  H h;
  M m;
  L l;
  Object a;
  String cd;
  int no;
  Object rtUrl;
  int ftype;
  List<Object> rtUrls;
  int djId;
  int copyright;
  int s_id;
  int mark;
  int mst;
  int cp;
  int mv;
  int rtype;
  Object rurl;
  int publishTime;

  Tracks({
    this.name,
    this.id,
    this.pst,
    this.t,
    this.ar,
    this.alia,
    this.pop,
    this.st,
    this.rt,
    this.fee,
    this.v,
    this.crbt,
    this.cf,
    this.al,
    this.dt,
    this.h,
    this.m,
    this.l,
    this.a,
    this.cd,
    this.no,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.djId,
    this.copyright,
    this.s_id,
    this.mark,
    this.mst,
    this.cp,
    this.mv,
    this.rtype,
    this.rurl,
    this.publishTime,
  });

  static Tracks fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Ar> ar = jsonRes['ar'] is List ? []: null;
  if(ar!=null) {
    for (var item in jsonRes['ar']) { if (item != null) { ar.add(Ar.fromJson(item));  }
    }
  }


  List<Object> alia = jsonRes['alia'] is List ? []: null;
  if(alia!=null) {
    for (var item in jsonRes['alia']) { if (item != null) { alia.add(item);  }
    }
  }


  List<Object> rtUrls = jsonRes['rtUrls'] is List ? []: null;
  if(rtUrls!=null) {
    for (var item in jsonRes['rtUrls']) { if (item != null) { rtUrls.add(item);  }
    }
  }
  return Tracks(
    name : jsonRes['name'],
    id : jsonRes['id'],
    pst : jsonRes['pst'],
    t : jsonRes['t'],
    ar:ar,
    alia:alia,
    pop : jsonRes['pop'],
    st : jsonRes['st'],
    rt : jsonRes['rt'],
    fee : jsonRes['fee'],
    v : jsonRes['v'],
    crbt : jsonRes['crbt'],
    cf : jsonRes['cf'],
    al : Al.fromJson(jsonRes['al']),
    dt : jsonRes['dt'],
    h : H.fromJson(jsonRes['h']),
    m : M.fromJson(jsonRes['m']),
    l : L.fromJson(jsonRes['l']),
    a : jsonRes['a'],
    cd : jsonRes['cd'],
    no : jsonRes['no'],
    rtUrl : jsonRes['rtUrl'],
    ftype : jsonRes['ftype'],
    rtUrls:rtUrls,
    djId : jsonRes['djId'],
    copyright : jsonRes['copyright'],
    s_id : jsonRes['s_id'],
    mark : jsonRes['mark'],
    mst : jsonRes['mst'],
    cp : jsonRes['cp'],
    mv : jsonRes['mv'],
    rtype : jsonRes['rtype'],
    rurl : jsonRes['rurl'],
    publishTime : jsonRes['publishTime'],);}

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'pst': pst,
    't': t,
    'ar': ar,
    'alia': alia,
    'pop': pop,
    'st': st,
    'rt': rt,
    'fee': fee,
    'v': v,
    'crbt': crbt,
    'cf': cf,
    'al': al,
    'dt': dt,
    'h': h,
    'm': m,
    'l': l,
    'a': a,
    'cd': cd,
    'no': no,
    'rtUrl': rtUrl,
    'ftype': ftype,
    'rtUrls': rtUrls,
    'djId': djId,
    'copyright': copyright,
    's_id': s_id,
    'mark': mark,
    'mst': mst,
    'cp': cp,
    'mv': mv,
    'rtype': rtype,
    'rurl': rurl,
    'publishTime': publishTime,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Ar {

  int id;
  String name;
  List<Object> tns;
  List<Object> alias;

  Ar({
    this.id,
    this.name,
    this.tns,
    this.alias,
  });

  static Ar fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> tns = jsonRes['tns'] is List ? []: null;
  if(tns!=null) {
    for (var item in jsonRes['tns']) { if (item != null) { tns.add(item);  }
    }
  }


  List<Object> alias = jsonRes['alias'] is List ? []: null;
  if(alias!=null) {
    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
    }
  }
  return Ar(
    id : jsonRes['id'],
    name : jsonRes['name'],
    tns:tns,
    alias:alias,);}

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'tns': tns,
    'alias': alias,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Al {

  int id;
  String name;
  String picUrl;
  List<Object> tns;
  String pic_str;
  int pic;

  Al({
    this.id,
    this.name,
    this.picUrl,
    this.tns,
    this.pic_str,
    this.pic,
  });

  static Al fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> tns = jsonRes['tns'] is List ? []: null;
  if(tns!=null) {
    for (var item in jsonRes['tns']) { if (item != null) { tns.add(item);  }
    }
  }
  return Al(
    id : jsonRes['id'],
    name : jsonRes['name'],
    picUrl : jsonRes['picUrl'],
    tns:tns,
    pic_str : jsonRes['pic_str'],
    pic : jsonRes['pic'],);}

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'picUrl': picUrl,
    'tns': tns,
    'pic_str': pic_str,
    'pic': pic,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class H {

  int br;
  int fid;
  int size;
  int vd;

  H({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  static H fromJson(jsonRes)=>jsonRes == null? null:H(
    br : jsonRes['br'],
    fid : jsonRes['fid'],
    size : jsonRes['size'],
    vd : jsonRes['vd'],);

  Map<String, dynamic> toJson() => {
    'br': br,
    'fid': fid,
    'size': size,
    'vd': vd,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class M {

  int br;
  int fid;
  int size;
  int vd;

  M({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  static M fromJson(jsonRes)=>jsonRes == null? null:M(
    br : jsonRes['br'],
    fid : jsonRes['fid'],
    size : jsonRes['size'],
    vd : jsonRes['vd'],);

  Map<String, dynamic> toJson() => {
    'br': br,
    'fid': fid,
    'size': size,
    'vd': vd,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class L {

  int br;
  int fid;
  int size;
  int vd;

  L({
    this.br,
    this.fid,
    this.size,
    this.vd,
  });

  static L fromJson(jsonRes)=>jsonRes == null? null:L(
    br : jsonRes['br'],
    fid : jsonRes['fid'],
    size : jsonRes['size'],
    vd : jsonRes['vd'],);

  Map<String, dynamic> toJson() => {
    'br': br,
    'fid': fid,
    'size': size,
    'vd': vd,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class TrackIds {

  int id;
  int v;
  Object alg;

  TrackIds({
    this.id,
    this.v,
    this.alg,
  });

  static TrackIds fromJson(jsonRes)=>jsonRes == null? null:TrackIds(
    id : jsonRes['id'],
    v : jsonRes['v'],
    alg : jsonRes['alg'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'v': v,
    'alg': alg,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Privileges {

  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;

  Privileges({
    this.id,
    this.fee,
    this.payed,
    this.st,
    this.pl,
    this.dl,
    this.sp,
    this.cp,
    this.subp,
    this.cs,
    this.maxbr,
    this.fl,
    this.toast,
    this.flag,
    this.preSell,
  });

  static Privileges fromJson(jsonRes)=>jsonRes == null? null:Privileges(
    id : jsonRes['id'],
    fee : jsonRes['fee'],
    payed : jsonRes['payed'],
    st : jsonRes['st'],
    pl : jsonRes['pl'],
    dl : jsonRes['dl'],
    sp : jsonRes['sp'],
    cp : jsonRes['cp'],
    subp : jsonRes['subp'],
    cs : jsonRes['cs'],
    maxbr : jsonRes['maxbr'],
    fl : jsonRes['fl'],
    toast : jsonRes['toast'],
    flag : jsonRes['flag'],
    preSell : jsonRes['preSell'],);

  Map<String, dynamic> toJson() => {
    'id': id,
    'fee': fee,
    'payed': payed,
    'st': st,
    'pl': pl,
    'dl': dl,
    'sp': sp,
    'cp': cp,
    'subp': subp,
    'cs': cs,
    'maxbr': maxbr,
    'fl': fl,
    'toast': toast,
    'flag': flag,
    'preSell': preSell,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}