import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonUtil {
  static void showToast(String content) {
    Fluttertoast.showToast(msg: content, gravity: ToastGravity.CENTER);
  }
  
  static Widget showNetImage(String imageUrl, {double width, double height, BoxFit fit}) {
    return CachedNetworkImage(imageUrl: imageUrl, width: width, height: height, fit: fit);
  }
}