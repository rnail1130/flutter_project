import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'bottom_nav.dart';
import 'dart:async';
import 'dart:io';

class LauchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LauchPage();
  }
}
class _LauchPage extends State<LauchPage>{
  int _status = 1;
  int _count = 10;

  Widget _buildSplashBg() {
    if(Platform.isIOS){
      //ios相关代码
      return Image.asset( 'assets/images/guide_logo_iphonex.png',
        fit:BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      );
    }else if(Platform.isAndroid){
      //android相关代码
      return Image.asset( 'assets/images/guide_logo.png',
        fit:BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      );
    }
/*    return new Image.asset(
      'assets/images/guide.png',
      width: double.infinity,
      fit: BoxFit.fill,
      height: double.infinity,
    );*/
  }
  void _goMain() {
    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=>BottomNav() ), (Route<dynamic> rout)=>false);
    // Navigator.push(context, CustomeRouter(HomePage()));

  }
  Timer _countdownTimer;

  @override
  void initState() {
    super.initState();
    _reGetCountdown();
  }
  void _reGetCountdown() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      _countdownTimer =
      new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          _count--;
          if(_count == 0){
            _goMain();
          }
        });
      });
    });
  }
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:Stack(
          children: <Widget>[
            new Offstage(
              offstage: !(_status == 0),
              child: _buildSplashBg(),
            ),
            new Offstage(
              offstage: !(_status == 2),
              child: Swiper(
                itemCount: 3,
                itemBuilder: (BuildContext context,int index){
                  if(Platform.isIOS){
                    //ios相关代码
                    return Image.asset( 'assets/images/guide_logo_iphonex.png',fit:BoxFit.fill,);
                  }else if(Platform.isAndroid){
                    //android相关代码
                    return Image.asset( 'assets/images/guide_logo.png',fit:BoxFit.fill,);
                  }

                },
                pagination: new SwiperPagination(),
                // control: new SwiperControl(),
                //loop: false,
              ),
            ),
            new Offstage(
              offstage: !(_status == 1),
              child: _buildSplashBg(),
            ),
            new Offstage(
                offstage: !(_status == 1),
                child: Container(
                  alignment: Alignment(0.9,0.95),
                  child: InkWell(
                    onTap: () {
                      _goMain();
                    },
                    child: new Container(
                        padding: EdgeInsets.all(12.0),
                        child: new Text(
                          '跳过 $_count',
                          style: new TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                        decoration: new BoxDecoration(
                            color: Color(0x66000000),
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            border: new Border.all(
                                width: 0.33, color: Colors.white))),
                  ),
                )
            )
          ],
        )
    );
  }
}