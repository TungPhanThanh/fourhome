import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1242, 2688),
      builder: () => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpeg'),
              fit: BoxFit.fill,
              colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.75),
                BlendMode.darken,
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: ScreenUtil().setWidth(30.0),
                top: ScreenUtil().setHeight(120.0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'FourHomeClub',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Version 1.0.2',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(550),
                      height: ScreenUtil().setHeight(550),
                      margin: EdgeInsets.symmetric(vertical: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/logo_app.jpeg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      'This App is powered by',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print('Tap Here onTap'),
                      child: Text(
                        'AppsGeyser.com',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '',
                        children: [
                          TextSpan(
                            text: 'Flag this App',
                            style: TextStyle(
                              color: Colors.cyanAccent,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => print('Tap Here onTap'),
                          ),
                          TextSpan(
                            text: ': Tell us if this app has',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'This App is powered by',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'TERMS OF SERVICE',
                          style: TextStyle(
                              color: Colors.cyanAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'PRIVACY POLICY',
                          style: TextStyle(
                              color: Colors.cyanAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Build 2.19.s',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
