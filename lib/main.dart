import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ictso_app/webview/about_page.dart';
import 'package:ictso_app/webview/in_app_webview.dart';
import 'package:ictso_app/webview/setting_page.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// InAppLocalhostServer localhostServer = new InAppLocalhostServer();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.redAccent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ));
  // await Permission.camera.request();
  // await Permission.microphone.request();
  // await Permission.storage.request();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      serviceWorkerController.serviceWorkerClient = AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      );
    }
  }

  runApp(MyApp());
}

Widget _createDrawerItem(
    {IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              text!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
    onTap: onTap,
  );
}

Drawer myDrawer({required BuildContext context, GestureTapCallback? onTap}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 100,
          child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    margin: EdgeInsets.only(left: 10, right: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/logo_app.jpeg'))),
                  ),
                  Text(
                    'FourHome Club',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              )),
        ),
        ListTile(
          title: Center(
              child: Text(
            'FourHome Club Cộng Đồng FourHome',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),
            textAlign: TextAlign.center,
          )),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/InAppBrowser');
          },
        ),
        Divider(),
        _createDrawerItem(
          icon: Icons.refresh,
          text: 'Refresh',
          onTap: onTap,
        ),
        _createDrawerItem(
          icon: Icons.settings,
          text: 'Settings',
          onTap: () {
            Navigator.popAndPushNamed(context, '/SettingPage');
          },
        ),
        // _createDrawerItem(
        //   icon: Icons.color_lens_outlined,
        //   text: 'Theming',
        //   onTap: () {},
        // ),
        _createDrawerItem(
          icon: Icons.share_outlined,
          text: 'Share',
          onTap: () async {
            return await WcFlutterShare.share(
                sharePopupTitle: 'Share',
                subject: 'FourHome',
                text: 'Share This App ?',
                mimeType: 'text/plain',
                iPadConfig: IPadConfig(
                  originX: 0,
                  originY: 0,
                  originHeight: 0,
                  originWidth: 0,
                ));
          },
        ),
        _createDrawerItem(
          icon: Icons.info_outline,
          text: 'About',
          onTap: () {
            Navigator.popAndPushNamed(context, '/AboutPage');
          },
        ),
        _createDrawerItem(
          icon: Icons.dangerous,
          text: 'Exit',
          onTap: () async {
            Navigator.of(context).pop();
            _showMyDialog(context);
            // _showExitDialog('Do you want to exit ?');
          },
        ),
      ],
    ),
  );
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.all(0),
        contentPadding: EdgeInsets.only(left: 30.0, right: 30.0, top: 25.0),
        content: Text('Do you really want to exit application?'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'NO',
              style: TextStyle(color: Colors.redAccent),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'YES',
              style: TextStyle(color: Colors.redAccent),
            ),
            onPressed: () {
              exit(0);
            },
          ),
        ],
      );
    },
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => InAppWebViewExampleScreen(),
          '/AboutPage': (context) => AboutPage(),
          '/SettingPage': (context) => SettingPage(),
        });
  }
}
