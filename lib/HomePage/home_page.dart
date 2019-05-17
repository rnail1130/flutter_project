import 'package:flutter/material.dart';
import 'home_content.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'weather_entity.dart';
import 'package:flutter_repo/Config/config.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: HeaderTitle(),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: HomeContent(),
      ),
    );
  }
}
class HeaderTitle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HeaderTitle();
  }
}
class _HeaderTitle extends State<HeaderTitle>{
  String result = "";
  var postion;
  var weather;
  var high;
  var low;
  var aqi;


  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
            title: new Text("扫描结果"),
            content: new Text(result),
            actions:<Widget>[
              new FlatButton(child:new Text("取消"), onPressed: (){
                Navigator.of(context).pop();

              },),
              new FlatButton(child:new Text("确定"), onPressed: (){
                Navigator.of(context).pop();

              },)
            ]

        ));
  }

  Future _scanQR() async{
    try{
      String qrResult = await BarcodeScanner.scan();
      //识别完二维码之后要做的一些事情
      setState(() {
        result = qrResult;
        showAlertDialog(context);
      });
    }on PlatformException catch(ex){
      if(ex.code == BarcodeScanner.CameraAccessDenied)
      {
        //识别二维码出现错误
        setState(() {
          showAlertDialog(context);
          result = "Camera permission was Denied";
        });
      }
      else{
        //未识别二维码
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    }
  }
  Future getHttp() async {
    var dio = Dio(
        BaseOptions(
          baseUrl: Config.url+"/Index.aspx/LatestNews",
          //contentType: ContentType.parse("application/json"),
          responseType: ResponseType.json,
          headers: {
            "Content-type": "application/json",
          },
        )
    );
    Response<String> response;

    response = await dio.post(Config.url+'/Index.aspx/Weather');
    // rvb = response;
    return response;
  }
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none://还没有开始网络请求

      case ConnectionState.active://正在链接

      case ConnectionState.waiting://等待阶段
        print('waiting');
        return Center(
          child: Text(Config.address+'居民卡APP',
            style: TextStyle(fontSize: 16.0,color: Colors.white) ,
          ),
        );
      case ConnectionState.done://请求成功
        Map userMap = json.decode(snapshot.data.toString());
        var ts = new WeatherD.fromJson(userMap['d']);

         return Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Column(
                       children: <Widget>[
                         Text(ts.city,style: TextStyle(color: Colors.white,fontSize: 11.0,fontWeight:FontWeight.w700 ),),
                         Text(ts.type,style: TextStyle(color: Colors.white),),
                       ],
                     ),
                   ],
                 ),
                 Text(ts.high.substring(2,6)+'  -  '+ts.low.substring(2,6),style: TextStyle(color: Colors.white,fontSize: 16.0),),
                 Text('|',style: TextStyle(color: Colors.white),),
                 Text('空气质量  '+ts.aqi,style: TextStyle(color: Colors.white,fontSize: 16.0),),
                 Text('|',style: TextStyle(color: Colors.white),),
                 Container(
                   padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                   child: InkWell(
                     child: Image.asset('assets/images/saoyisao.png',width: 16.0,),
                     onTap:_scanQR,
                   ),
                 ),
               ],
             )
         );

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      builder: _buildFuture,
      future:  getHttp(),
    );
  }
}

