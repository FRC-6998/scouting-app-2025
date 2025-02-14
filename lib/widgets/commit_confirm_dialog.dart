import 'package:flutter/material.dart';

Future<bool?> showAlertDialog(
    context, {
      String title = 'Alert',
      String content = 'This is an alert dialog.',
      String confirmText = 'OK',
      String cancelText = 'Cancel',
      double fontSize = 20,
      VoidCallback? onConfirm,
      VoidCallback? onCancel,
    }) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content, style: TextStyle(fontSize: fontSize)),
        actions: <Widget>[
          TextButton(
            child: Text(cancelText, style: TextStyle(fontSize: fontSize)),
            onPressed: () {
              if (onCancel != null) {
                onCancel();
              }
            },
          ),
          TextButton(
            child: Text(confirmText, style: TextStyle(fontSize: fontSize)),
            onPressed: () {
              if (onConfirm != null) {
                onConfirm();
              }
            },
          ),
        ],
      );
    },
  );
}


// 弹出对话框
Future<bool?> showCommitConfirmDialog(context) {
  return showAlertDialog(
    context,
    title: 'Commit Confirm',
    content: 'Are you sure want to commit data?\nData cannot be modified after commit.',
    confirmText: 'Commit data',
    cancelText: 'Cancel',
    onConfirm: () {
      Navigator.pushNamed(context, '/result');
    },
    onCancel: () {
      Navigator.of(context).pop();
    },
  );
}
