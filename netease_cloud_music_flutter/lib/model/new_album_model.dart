import 'dart:convert' show json;

class NewAlbumModel {

  int total;
  List<Albums> albums;
  int code;

  NewAlbumModel({
    this.total,
    this.albums,
    this.code,
  });

  static NewAlbumModel fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Albums> albums = jsonRes['albums'] is List ? []: null;
  if(albums!=null) {
    for (var item in jsonRes['albums']) { if (item != null) { albums.add(Albums.fromJson(item));  }
    }
  }
  return NewAlbumModel(
    total : jsonRes['total'],
    albums:albums,
    code : jsonRes['code'],);}

  Map<String, dynamic> toJson() => {
    'total': total,
    'albums': albums,
    'code': code,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Albums {

  List<Object> songs;
  bool paid;
  bool onSale;
  int mark;
  List<String> alias;
  List<Artists> artists;
  int copyrightId;
  int picId;
  Artist artist;
  int publishTime;
  String company;
  String briefDesc;
  String commentThreadId;
  String picUrl;
  String blurPicUrl;
  int companyId;
  int pic;
  String tags;
  int status;
  String subType;
  String description;
  String name;
  int id;
  String type;
  int size;
  String picId_str;

  Albums({
    this.songs,
    this.paid,
    this.onSale,
    this.mark,
    this.alias,
    this.artists,
    this.copyrightId,
    this.picId,
    this.artist,
    this.publishTime,
    this.company,
    this.briefDesc,
    this.commentThreadId,
    this.picUrl,
    this.blurPicUrl,
    this.companyId,
    this.pic,
    this.tags,
    this.status,
    this.subType,
    this.description,
    this.name,
    this.id,
    this.type,
    this.size,
    this.picId_str,
  });

  static Albums fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> songs = jsonRes['songs'] is List ? []: null;
  if(songs!=null) {
    for (var item in jsonRes['songs']) { if (item != null) { songs.add(item);  }
    }
  }


  List<String> alias = jsonRes['alias'] is List ? []: null;
  if(alias!=null) {
    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
    }
  }


  List<Artists> artists = jsonRes['artists'] is List ? []: null;
  if(artists!=null) {
    for (var item in jsonRes['artists']) { if (item != null) { artists.add(Artists.fromJson(item));  }
    }
  }
  return Albums(
    songs:songs,
    paid : jsonRes['paid'],
    onSale : jsonRes['onSale'],
    mark : jsonRes['mark'],
    alias:alias,
    artists:artists,
    copyrightId : jsonRes['copyrightId'],
    picId : jsonRes['picId'],
    artist : Artist.fromJson(jsonRes['artist']),
    publishTime : jsonRes['publishTime'],
    company : jsonRes['company'],
    briefDesc : jsonRes['briefDesc'],
    commentThreadId : jsonRes['commentThreadId'],
    picUrl : jsonRes['picUrl'],
    blurPicUrl : jsonRes['blurPicUrl'],
    companyId : jsonRes['companyId'],
    pic : jsonRes['pic'],
    tags : jsonRes['tags'],
    status : jsonRes['status'],
    subType : jsonRes['subType'],
    description : jsonRes['description'],
    name : jsonRes['name'],
    id : jsonRes['id'],
    type : jsonRes['type'],
    size : jsonRes['size'],
    picId_str : jsonRes['picId_str'],);}

  Map<String, dynamic> toJson() => {
    'songs': songs,
    'paid': paid,
    'onSale': onSale,
    'mark': mark,
    'alias': alias,
    'artists': artists,
    'copyrightId': copyrightId,
    'picId': picId,
    'artist': artist,
    'publishTime': publishTime,
    'company': company,
    'briefDesc': briefDesc,
    'commentThreadId': commentThreadId,
    'picUrl': picUrl,
    'blurPicUrl': blurPicUrl,
    'companyId': companyId,
    'pic': pic,
    'tags': tags,
    'status': status,
    'subType': subType,
    'description': description,
    'name': name,
    'id': id,
    'type': type,
    'size': size,
    'picId_str': picId_str,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Artists {

  int img1v1Id;
  int topicPerson;
  List<Object> alias;
  int picId;
  bool followed;
  String briefDesc;
  int musicSize;
  int albumSize;
  String img1v1Url;
  String trans;
  String picUrl;
  String name;
  int id;
  String img1v1Id_str;

  Artists({
    this.img1v1Id,
    this.topicPerson,
    this.alias,
    this.picId,
    this.followed,
    this.briefDesc,
    this.musicSize,
    this.albumSize,
    this.img1v1Url,
    this.trans,
    this.picUrl,
    this.name,
    this.id,
    this.img1v1Id_str,
  });

  static Artists fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> alias = jsonRes['alias'] is List ? []: null;
  if(alias!=null) {
    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
    }
  }
  return Artists(
    img1v1Id : jsonRes['img1v1Id'],
    topicPerson : jsonRes['topicPerson'],
    alias:alias,
    picId : jsonRes['picId'],
    followed : jsonRes['followed'],
    briefDesc : jsonRes['briefDesc'],
    musicSize : jsonRes['musicSize'],
    albumSize : jsonRes['albumSize'],
    img1v1Url : jsonRes['img1v1Url'],
    trans : jsonRes['trans'],
    picUrl : jsonRes['picUrl'],
    name : jsonRes['name'],
    id : jsonRes['id'],
    img1v1Id_str : jsonRes['img1v1Id_str'],);}

  Map<String, dynamic> toJson() => {
    'img1v1Id': img1v1Id,
    'topicPerson': topicPerson,
    'alias': alias,
    'picId': picId,
    'followed': followed,
    'briefDesc': briefDesc,
    'musicSize': musicSize,
    'albumSize': albumSize,
    'img1v1Url': img1v1Url,
    'trans': trans,
    'picUrl': picUrl,
    'name': name,
    'id': id,
    'img1v1Id_str': img1v1Id_str,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}

class Artist {

  int img1v1Id;
  int topicPerson;
  List<Object> alias;
  int picId;
  bool followed;
  String briefDesc;
  int musicSize;
  int albumSize;
  String img1v1Url;
  String trans;
  String picUrl;
  String name;
  int id;
  String picId_str;
  String img1v1Id_str;

  Artist({
    this.img1v1Id,
    this.topicPerson,
    this.alias,
    this.picId,
    this.followed,
    this.briefDesc,
    this.musicSize,
    this.albumSize,
    this.img1v1Url,
    this.trans,
    this.picUrl,
    this.name,
    this.id,
    this.picId_str,
    this.img1v1Id_str,
  });

  static Artist fromJson(jsonRes){ if(jsonRes == null) return null;


  List<Object> alias = jsonRes['alias'] is List ? []: null;
  if(alias!=null) {
    for (var item in jsonRes['alias']) { if (item != null) { alias.add(item);  }
    }
  }
  return Artist(
    img1v1Id : jsonRes['img1v1Id'],
    topicPerson : jsonRes['topicPerson'],
    alias:alias,
    picId : jsonRes['picId'],
    followed : jsonRes['followed'],
    briefDesc : jsonRes['briefDesc'],
    musicSize : jsonRes['musicSize'],
    albumSize : jsonRes['albumSize'],
    img1v1Url : jsonRes['img1v1Url'],
    trans : jsonRes['trans'],
    picUrl : jsonRes['picUrl'],
    name : jsonRes['name'],
    id : jsonRes['id'],
    picId_str : jsonRes['picId_str'],
    img1v1Id_str : jsonRes['img1v1Id_str'],);}

  Map<String, dynamic> toJson() => {
    'img1v1Id': img1v1Id,
    'topicPerson': topicPerson,
    'alias': alias,
    'picId': picId,
    'followed': followed,
    'briefDesc': briefDesc,
    'musicSize': musicSize,
    'albumSize': albumSize,
    'img1v1Url': img1v1Url,
    'trans': trans,
    'picUrl': picUrl,
    'name': name,
    'id': id,
    'picId_str': picId_str,
    'img1v1Id_str': img1v1Id_str,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}