
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DialogAction {yes, abort}

class Dialogs {
  static Future<DialogAction> yesAbortDialog(
      BuildContext ctx,
      String title,
      String body,
      ) async {
        final action = await showDialog(
            context: ctx,
          barrierDismissible: false,
          builder: (BuildContext dialogCtx) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                title: Text(title),
                content: Text(body),
                actions: [
                  FlatButton(onPressed: () => Navigator.of(dialogCtx).pop(DialogAction.abort),
                      child: const Text("No")),
                  FlatButton(onPressed: () =>Navigator.of(dialogCtx).pop(DialogAction.yes),
                      child: const Text('Yes'))
                ],
              );
          }
        );

        return (action != null) ? action : DialogAction.abort;
  }
}