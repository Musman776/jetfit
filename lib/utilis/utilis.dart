import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jetfit/utilis/theme_data.dart';

void showtoast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: MyThemeData.background,
    textColor: MyThemeData.whitecolor,
    gravity: ToastGravity.BOTTOM,
    fontSize: 17,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_LONG,
  );
}

const double defaultPadding = 16.0;

class SpinkitFlutter {
  static var spinkit = const SpinKitThreeBounce(
    color: Colors.black,
    size: 30.0,
  );
}

class WhiteSpinkitFlutter {
  static var spinkit = const SpinKitThreeBounce(
    color: Colors.white,
    size: 30.0,
  );
}
