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
              child: Column(
                children: <Widget>[
                  // Account Details
                  Column(children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: Colors.blue,
                        size: 35,
                      ),
                      title: Text('Account Details',
                          style: Theme.of(context).textTheme.title),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey[300],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/AccountDetails');
                      },
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                      height: 1,
                    ),
                  ]),
                  // Privacy
                  Column(children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.lock,
                        color: Colors.blue,
                        size: 35,
                      ),
                      title: Text('Account Details',
                          style: Theme.of(context).textTheme.title),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey[300],
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                      height: 1,
                    ),
                  ]),

                  // Help & Support
                  Column(children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.lock,
                        color: Colors.blue,
                        size: 35,
                      ),
                      title: Text('Privacy Policy',
                          style: Theme.of(context).textTheme.title),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                      height: 1,
                    ),
                  ]),

                  // Feedback
                  Column(children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.insert_comment,
                        color: Colors.blue,
                        size: 35,
                      ),
                      title: Text('Feedback',
                          style: Theme.of(context).textTheme.title),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[300],
                      height: 1,
                    ),
                  ]),
                ],
              ),
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
