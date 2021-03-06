import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weshare_main/services/auth.dart';
import 'package:weshare_main/wrapper.dart';
import 'dart:ui';
import './constants.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final userType = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color(0xFFF1F3F5),
      appBar: appBarBuilder('Settings', true, null),
      body: Column(
        children: <Widget>[
          //! Buttons
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),

                //topRight: Radius.circular(20.0)),
              ),
              child: Column(children: <Widget>[
                SettingsButtons(
                  Icons.account_circle,
                  'Account Details',
                  true,
                  () {
                    Navigator.pushNamed(context, '/AccountDetails');
                  },
                ),
                SettingsButtons(Icons.lock, 'Privacy Policy', true, () {}),
                SettingsButtons(Icons.help, 'Help & Support', true, () {}),
                SettingsButtons(Icons.insert_comment, 'Feedback', false, () {}),
              ]),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(30),
            height: 50,
            child: FlatButton(
              child: Text(
                'Log Out',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              onPressed: () async {
                if (userType == 'Rider') {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/wrapper', (Route<dynamic> route) => false);
                  await _auth.signOut();
                } else if (userType == 'Driver') {
                  // Navigator.popUntil(context,
                  //                       ModalRoute.withName('/driverNav'));

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/wrapper', (Route<dynamic> route) => false);

                  // Navigator.pop(context);
                  // Navigator.pop(context);
                  await _auth.signOut();
                }
                // Navigator.pop(context);
                // Navigator.pop(context);
              },
              color: Colors.grey[500],
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12)),
              // padding: EdgeInsets.symmetric(horizontal: 149, vertical: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsButtons extends StatelessWidget {
  final icon;
  final title;
  final bool isPageNavigator;
  final Function handler;

  SettingsButtons(this.icon, this.title, this.isPageNavigator, this.handler);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 35,
        ),
        title: Text(title, style: Theme.of(context).textTheme.title),
        trailing: isPageNavigator
            ? Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey[300],
              )
            : null,
        onTap: handler,
      ),
      Divider(
        thickness: 1,
        color: Colors.grey[300],
        height: 1,
      ),
    ]);
  }
}
