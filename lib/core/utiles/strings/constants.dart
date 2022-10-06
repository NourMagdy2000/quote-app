import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static void errorMsg({required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                'Error',
                style: TextStyle(color: Colors.red),
              ),
              content: Text(
                '${msg}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              insetAnimationCurve: Curves.linear,
              insetAnimationDuration: Duration(seconds: 1),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Ok'))
              ],
            ));
  }

  static void showToast(
      {required BuildContext context,
      required String msg,
      required Color color}) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: color,
    );
  }
}
