import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(
    BuildContext context, {
    required String text,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 120,
      ),
      content: Row(
        children: [
          Container(
            child: Text(
              text,
              style: TextStyle(fontSize: 32),
            ),
          ),
          ElevatedButton(
            child: Text('ダイヤログを表示'),
            onPressed: () {
              // showMyDialog(context);
            },
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
