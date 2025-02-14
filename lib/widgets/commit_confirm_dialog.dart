import 'package:flutter/material.dart';

// 弹出对话框
Future<bool?> showCommitConfirmDialog(context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Confirm"),
        content: Text("Are you sure want to commit data?\nData cannot be modified after commit."),
        // content: Column(children: [
        //   Text("Are you sure want to commit data?"),
        //   Text("Data cannot be modified after commit."),
        // ]),
        actions: <Widget>[
          TextButton(
            child: Text("Back to Edit"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text("Commit data"),
            onPressed: () {
              Navigator.pushNamed(context, '/result');
            },
          ),
        ],
      );
    },
  );
}
