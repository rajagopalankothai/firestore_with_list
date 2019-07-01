import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AddNewQuestions extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddNewQuestions> {
  String questions;
  var firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Type Your Questions'),
      content: TextField(
        decoration: InputDecoration(
          labelText: ('Type Your Questions'),
          hintText: ('Enter Your Questions Here...'),
        ),
        onChanged: (text) {
          setState(() {
            questions = text;
          });
        },
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel')),
        FlatButton(
            onPressed: () {
              firestore
                  .collection('newquestions')
                  .document()
                  .setData({'qns': questions});
              print(questions);
              Navigator.of(context).pop();
              _successmessage(context);
            },
            child: Text('Submit')),
      ],
    );
  }

  _successmessage(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Thank You !!!'),
            content: Text('Your Questions has been Submitted Successfully..'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK')),
            ],
          );
        });
  }
}
