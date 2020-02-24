import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading {
  static bool isLoading = false;

  static showLoading(BuildContext context) {
    if(!isLoading) {
      isLoading = true;

      showGeneralDialog(
          context: context,
          barrierDismissible: false,
//          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierLabel: "giao",
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
            return Align(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black54,
                  child: CupertinoActivityIndicator(),
                ),
              ),
            );
          }).then((v){
        isLoading = false;
      });
    }
  }

  static void hideLoading(BuildContext context) {
    if(isLoading) {
      Navigator.of(context).pop();
    }
  }
}