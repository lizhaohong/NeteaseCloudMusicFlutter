import 'dart:convert' show json;

class BannersModel {
  List<Banners> banners;
  int code;

  BannersModel({
    this.banners,
    this.code,
  });

  static BannersModel fromJson(jsonRes){ if(jsonRes == null) return null;

  List<Banners> banners = jsonRes['banners'] is List ? []: null;
  if(banners!=null) {
    for (var item in jsonRes['banners']) { if (item != null) { banners.add(Banners.fromJson(item));  }
    }
  }
  return BannersModel(
    banners:banners,
    code : jsonRes['code'],);}

  Map<String, dynamic> toJson() => {
    'banners': banners,
    'code': code,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Banners {

  String imageUrl;
  int targetId;
  Object adid;
  int targetType;
  String titleColor;
  String typeTitle;
  Object url;
  bool exclusive;
  Object monitorImpress;
  Object monitorClick;
  Object monitorType;
  Object monitorImpressList;
  Object monitorClickList;
  Object monitorBlackList;
  Object extMonitor;
  Object extMonitorInfo;
  Object adSource;
  Object adLocation;
  Object adDispatchJson;
  String encodeId;
  Object program;
  Object event;
  Object video;
  Object song;
  String scm;

  Banners({
    this.imageUrl,
    this.targetId,
    this.adid,
    this.targetType,
    this.titleColor,
    this.typeTitle,
    this.url,
    this.exclusive,
    this.monitorImpress,
    this.monitorClick,
    this.monitorType,
    this.monitorImpressList,
    this.monitorClickList,
    this.monitorBlackList,
    this.extMonitor,
    this.extMonitorInfo,
    this.adSource,
    this.adLocation,
    this.adDispatchJson,
    this.encodeId,
    this.program,
    this.event,
    this.video,
    this.song,
    this.scm,
  });

  static Banners fromJson(jsonRes)=>jsonRes == null? null:Banners(
    imageUrl : jsonRes['imageUrl'],
    targetId : jsonRes['targetId'],
    adid : jsonRes['adid'],
    targetType : jsonRes['targetType'],
    titleColor : jsonRes['titleColor'],
    typeTitle : jsonRes['typeTitle'],
    url : jsonRes['url'],
    exclusive : jsonRes['exclusive'],
    monitorImpress : jsonRes['monitorImpress'],
    monitorClick : jsonRes['monitorClick'],
    monitorType : jsonRes['monitorType'],
    monitorImpressList : jsonRes['monitorImpressList'],
    monitorClickList : jsonRes['monitorClickList'],
    monitorBlackList : jsonRes['monitorBlackList'],
    extMonitor : jsonRes['extMonitor'],
    extMonitorInfo : jsonRes['extMonitorInfo'],
    adSource : jsonRes['adSource'],
    adLocation : jsonRes['adLocation'],
    adDispatchJson : jsonRes['adDispatchJson'],
    encodeId : jsonRes['encodeId'],
    program : jsonRes['program'],
    event : jsonRes['event'],
    video : jsonRes['video'],
    song : jsonRes['song'],
    scm : jsonRes['scm'],);

  Map<String, dynamic> toJson() => {
    'imageUrl': imageUrl,
    'targetId': targetId,
    'adid': adid,
    'targetType': targetType,
    'titleColor': titleColor,
    'typeTitle': typeTitle,
    'url': url,
    'exclusive': exclusive,
    'monitorImpress': monitorImpress,
    'monitorClick': monitorClick,
    'monitorType': monitorType,
    'monitorImpressList': monitorImpressList,
    'monitorClickList': monitorClickList,
    'monitorBlackList': monitorBlackList,
    'extMonitor': extMonitor,
    'extMonitorInfo': extMonitorInfo,
    'adSource': adSource,
    'adLocation': adLocation,
    'adDispatchJson': adDispatchJson,
    'encodeId': encodeId,
    'program': program,
    'event': event,
    'video': video,
    'song': song,
    'scm': scm,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}