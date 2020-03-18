class UserInfo {
  String email;
  String userId;
  String globalId;
  String username;
  String familyName;
  String firstName;
  String title;
  String countryCode;
  String mobile;
  String token;
  String avatar;
  UserInfo.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    email = map['email'];
    userId = map['user_id'];
    globalId = map['global_id'];
    username = map['username'];
    familyName = map['familyName'];
    firstName = map['first_name'];
    title = map['title'];
    countryCode = map['country_code'];
    mobile = map['mobile'];
    token = map['token'];
    avatar = map['avatar'];
  }
}
