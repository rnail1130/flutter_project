import 'package:flutter/material.dart';
import 'launch/lauch_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '启动页',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        brightness: Brightness.light,
        primaryColor: Colors.amber[700],
        accentColor: Colors.amber[400],
      ),
      //initialRoute: "/HomePage",//功能测试初始化的页面
      routes: <String,WidgetBuilder>{//配置路径
        '/HomePage':(BuildContext context)  => Text('222'),
      },
      home: LauchPage(),
    );
  }
}

