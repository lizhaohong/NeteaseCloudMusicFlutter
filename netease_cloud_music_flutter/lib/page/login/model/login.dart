library login;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login.g.dart';

abstract class Login implements Built<Login, LoginBuilder> {
  Login._();

  factory Login([updates(LoginBuilder b)]) = _$Login;

  @BuiltValueField(wireName: 'loginType')
  int get loginType;
  @BuiltValueField(wireName: 'code')
  int get code;
  @BuiltValueField(wireName: 'account')
  Account get account;
  @BuiltValueField(wireName: 'token')
  String get token;
  String toJson() {
    return json.encode(serializers.serializeWith(Login.serializer, this));
  }
  @BuiltValueField(wireName: 'bindings')
  BuiltList<Bindings> get bindings;
  String toJson() {
    return json.encode(serializers.serializeWith(Login.serializer, this));
  }

  static Login fromJson(String jsonString) {
    return serializers.deserializeWith(
        Login.serializer, json.decode(jsonString));
  }

  static Serializer<Login> get serializer => _$loginSerializer;
}
library account;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account.g.dart';

abstract class Account implements Built<Account, AccountBuilder> {
  Account._();

  factory Account([updates(AccountBuilder b)]) = _$Account;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'userName')
  String get userName;
  @BuiltValueField(wireName: 'type')
  int get type;
  @BuiltValueField(wireName: 'status')
  int get status;
  @BuiltValueField(wireName: 'whitelistAuthority')
  int get whitelistAuthority;
  @BuiltValueField(wireName: 'createTime')
  int get createTime;
  @BuiltValueField(wireName: 'salt')
  String get salt;
  @BuiltValueField(wireName: 'tokenVersion')
  int get tokenVersion;
  @BuiltValueField(wireName: 'ban')
  int get ban;
  @BuiltValueField(wireName: 'baoyueVersion')
  int get baoyueVersion;
  @BuiltValueField(wireName: 'donateVersion')
  int get donateVersion;
  @BuiltValueField(wireName: 'vipType')
  int get vipType;
  @BuiltValueField(wireName: 'viptypeVersion')
  int get viptypeVersion;
  @BuiltValueField(wireName: 'anonimousUser')
  bool get anonimousUser;
  String toJson() {
    return json.encode(serializers.serializeWith(Account.serializer, this));
  }

  static Account fromJson(String jsonString) {
    return serializers.deserializeWith(
        Account.serializer, json.decode(jsonString));
  }

  static Serializer<Account> get serializer => _$accountSerializer;
}

part 'bindings.g.dart';

abstract class Bindings implements Built<Bindings, BindingsBuilder> {
  Bindings._();

  factory Bindings([updates(BindingsBuilder b)]) = _$Bindings;

  @BuiltValueField(wireName: 'url')
  String get url;
  @BuiltValueField(wireName: 'bindingTime')
  int get bindingTime;
  @BuiltValueField(wireName: 'expiresIn')
  int get expiresIn;
  @BuiltValueField(wireName: 'refreshTime')
  int get refreshTime;
  @BuiltValueField(wireName: 'tokenJsonStr')
  String get tokenJsonStr;
  @BuiltValueField(wireName: 'expired')
  bool get expired;
  @BuiltValueField(wireName: 'userId')
  int get userId;
  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'type')
  int get type;
  String toJson() {
    return json.encode(serializers.serializeWith(Bindings.serializer, this));
  }

  static Bindings fromJson(String jsonString) {
    return serializers.deserializeWith(
        Bindings.serializer, json.decode(jsonString));
  }

  static Serializer<Bindings> get serializer => _$bindingsSerializer;
}

part 'profile.g.dart';

abstract class Profile implements Built<Profile, ProfileBuilder> {
  Profile._();

  factory Profile([updates(ProfileBuilder b)]) = _$Profile;

  @BuiltValueField(wireName: 'avatarImgIdStr')
  String get avatarImgIdStr;
  @BuiltValueField(wireName: 'backgroundImgIdStr')
  String get backgroundImgIdStr;
  @BuiltValueField(wireName: 'detailDescription')
  String get detailDescription;
  @BuiltValueField(wireName: 'followed')
  bool get followed;
  @BuiltValueField(wireName: 'backgroundUrl')
  String get backgroundUrl;
  @BuiltValueField(wireName: 'description')
  String get description;
  @BuiltValueField(wireName: 'authStatus')
  int get authStatus;
  @BuiltValueField(wireName: 'backgroundImgId')
  int get backgroundImgId;
  @BuiltValueField(wireName: 'userType')
  int get userType;
  @BuiltValueField(wireName: 'province')
  int get province;
  @BuiltValueField(wireName: 'userId')
  int get userId;
  @BuiltValueField(wireName: 'vipType')
  int get vipType;
  @BuiltValueField(wireName: 'gender')
  int get gender;
  @BuiltValueField(wireName: 'accountStatus')
  int get accountStatus;
  @BuiltValueField(wireName: 'birthday')
  int get birthday;
  @BuiltValueField(wireName: 'avatarImgId')
  int get avatarImgId;
  @BuiltValueField(wireName: 'nickname')
  String get nickname;
  @BuiltValueField(wireName: 'city')
  int get city;
  @BuiltValueField(wireName: 'defaultAvatar')
  bool get defaultAvatar;
  @BuiltValueField(wireName: 'avatarUrl')
  String get avatarUrl;
  @BuiltValueField(wireName: 'signature')
  String get signature;
  @BuiltValueField(wireName: 'authority')
  int get authority;
  @BuiltValueField(wireName: 'avatarImgId_str')
  String get avatarImgIdStr;
  @BuiltValueField(wireName: 'followeds')
  int get followeds;
  @BuiltValueField(wireName: 'follows')
  int get follows;
  @BuiltValueField(wireName: 'eventCount')
  int get eventCount;
  @BuiltValueField(wireName: 'playlistCount')
  int get playlistCount;
  @BuiltValueField(wireName: 'playlistBeSubscribedCount')
  int get playlistBeSubscribedCount;
  String toJson() {
    return json.encode(serializers.serializeWith(Profile.serializer, this));
  }

  static Profile fromJson(String jsonString) {
    return serializers.deserializeWith(
        Profile.serializer, json.decode(jsonString));
  }

  static Serializer<Profile> get serializer => _$profileSerializer;
}
