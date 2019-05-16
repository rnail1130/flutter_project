import 'package:flutter/material.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  var titleStyle = TextStyle(fontSize: 16.0,color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的居民卡虚拟卡',style:titleStyle,),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh,color: Colors.white,), onPressed: (){
            print("刷新");
          })
        ],
        elevation: 0.0,
      ),
      body: PageHome(),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(15.0),
      width: double.infinity,
      height: 330.0,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BarCode(),
          Text('123123'),
          QrCode(),
          Text('123123'),
        ],
      ),
    );
  }
}
//条形码
class BarCode extends StatefulWidget {
  @override
  _BarCodeState createState() => _BarCodeState();
}

class _BarCodeState extends State<BarCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.0,
      child:  BarCodeImage(
        data: "123456789123456789123",   // Code string. (required)
        codeType: BarCodeType.Code128,  // Code type (required)
        lineWidth: 1.12,                // width for a single black/white bar (default: 2.0)
        barHeight: 90.0,               // height for the entire widget (default: 100.0)
        hasText: false,                 // Render with text label or not (default: false)
        onError: (error) {             // Error handler
          print('error = $error');
        },
      ),
    );
  }
}
//二维码
class QrCode extends StatefulWidget {
  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:new QrImage(
        data: "123456789123456789123",
        size: 170.0,
      ),
    );
  }
}



