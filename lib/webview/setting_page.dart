import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_page.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Settings'),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.0, top: 30.0, bottom: 10.0),
            child: Text(
              'About',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          itemSetting('Information about application', 'Developer infor',
              callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            );
          }),
          Divider(),
          itemSetting(
              'Build Version', 'App version: 1.0.2, Platform version: 2.19.s',
              callback: () {}),
          Divider()
        ],
      ),
    );
  }

  Widget itemSetting(String title, String detail, {VoidCallback? callback}) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              detail,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
