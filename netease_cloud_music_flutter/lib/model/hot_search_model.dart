import 'dart:convert' show json;

class HotSearchModel {

  String searchWord;
  int score;
  String content;
  int source;
  int iconType;
  String iconUrl;
  String url;
  String alg;

  HotSearchModel({
    this.searchWord,
    this.score,
    this.content,
    this.source,
    this.iconType,
    this.iconUrl,
    this.url,
    this.alg,
  });

  static HotSearchModel fromJson(jsonRes)=>jsonRes == null? null:HotSearchModel(
    searchWord : jsonRes['searchWord'],
    score : jsonRes['score'],
    content : jsonRes['content'],
    source : jsonRes['source'],
    iconType : jsonRes['iconType'],
    iconUrl : jsonRes['iconUrl'],
    url : jsonRes['url'],
    alg : jsonRes['alg'],);

  Map<String, dynamic> toJson() => {
    'searchWord': searchWord,
    'score': score,
    'content': content,
    'source': source,
    'iconType': iconType,
    'iconUrl': iconUrl,
    'url': url,
    'alg': alg,
  };
  @override
  String  toString() {
    return json.encode(this);
  }
}