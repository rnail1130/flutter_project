import 'package:flutter/material.dart';
//import 'home_content.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'weather_entity.dart';


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
        child: Text('123123'),
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
  String postion ='loading';
  String weather ='loading';
  String high ='loading';
  String low ='loading';
  String aqi ='loading';


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
      setState(() {
        result = qrResult;
        showAlertDialog(context);
      });
    }on PlatformException catch(ex){
      if(ex.code == BarcodeScanner.CameraAccessDenied)
      {
        setState(() {
          showAlertDialog(context);
          result = "Camera permission was Denied";
        });
      }
      else{
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    }
  }
  void getHttp() async {
    var dio = Dio(
        BaseOptions(
          baseUrl: "http://192.168.1.204:8032/Index.aspx/LatestNews",
          //contentType: ContentType.parse("application/json"),
          responseType: ResponseType.json,
          headers: {
            "Content-type": "application/json",
          },
        )
    );
    Response<String> response;

    response = await dio.post('http://192.168.1.204:8032/Index.aspx/Weather');
    // rvb = response;
    Map userMap = json.decode(response.data.toString());
    var ts = new WeatherD.fromJson(userMap['d']);

    setState(() {
       postion = ts.city;
      weather = ts.type;
      high = ts.high;
      low = ts.low;
      aqi = ts.aqi;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getHttp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(postion,style: TextStyle(color: Colors.white,fontSize: 11.0,fontWeight:FontWeight.w700 ),),
                    Text(weather,style: TextStyle(color: Colors.white),),
                  ],
                ),
              ],
            ),
            Text(high.substring(2,6)+'  -  '+low.substring(2,6),style: TextStyle(color: Colors.white,fontSize: 16.0),),
            Text('|',style: TextStyle(color: Colors.white),),
            Text('空气质量  '+aqi,style: TextStyle(color: Colors.white,fontSize: 16.0),),
            Text('|',style: TextStyle(color: Colors.white),),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
              child: InkWell(
                child: Image.asset('assets/images/saoyisao.png',width: 16.0,),
                onTap:_scanQR,
              ),
            ),
/*            IconButton(icon:Image.asset('assets/images/saoyisao.png',width: 16.0,),
              onPressed: _scanQR
              ,),*/

          ],
        )
    );
  }
}

