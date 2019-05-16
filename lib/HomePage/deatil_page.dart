import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_repo/Config/config.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
class Deatile extends StatefulWidget {
  String url;
  String name;
  int id;
  Deatile(this.name,{this.url,this.id});
  @override
  _DeatileState createState() => _DeatileState(this.name,url: this.url,id: this.id);
}

class _DeatileState extends State<Deatile> {
  String url;
  String name;
  int id;
  _DeatileState(this.name,{this.url,this.id});
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();


  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(21354);
    });
    flutterWebviewPlugin.onUrlChanged.listen((String wvs) {
      if(wvs == "https://mobile.baidu.com/simple/?action=index"){
        print('打电话');
        _launchURL();
      }
      print(wvs);
    });
    flutterWebviewPlugin.onHttpError.listen((WebViewHttpError wvs) {
      print(wvs);
    });
  }
  _launchURL() async {
    const url = Config.lostphone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  //是否是外部链接网页，或者是html数据网页
  Widget _widgetPage(){
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    setState(() {
      if(this.id == null){
        content = WebviewScaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 30.0,
                  color: Colors.white,
                ),
                onPressed: (){
                  Navigator.pop(context);
                  flutterWebviewPlugin.close();
                }
            ),
            title:
            Text(
              this.name,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white
              ),
            ),

            centerTitle: true,
          ),
          url: this.url,
          withZoom: false,
          withJavascript: false,
          scrollBar: false,
        );
      }else{
        content = ApiHome(this.id,this.name);
      }
    });
    return content;
  }
  @override
  Widget build(BuildContext context) {
    return _widgetPage();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
}
class ApiHome extends StatefulWidget {
  int id;
  String title;
  ApiHome(this.id,this.title);
  @override
  _ApiHomeState createState() => _ApiHomeState(this.id,this.title);
}

class _ApiHomeState extends State<ApiHome> {
  int id;
  String title;
  String dz;
  _ApiHomeState(this.id,this.title);

  Widget childWidget() {
    Widget childWidget;
    childWidget = new Stack(
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
          child: new Center(
            child: SpinKitFadingCircle(
              color: Colors.blueAccent,
              size: 30.0,
            ),
          ),
        ),
        new Padding(
          padding: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
          child: new Center(
            child: new Text('正在加载中~'),
          ),
        ),
      ],
    );
    return childWidget;
  }
  void getData () async {
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
    response = await dio.post(Config.url+'/Article.aspx/FindArticle',
      data: ({'ArticleId':this.id}),
    );

    Map userMap = json.decode(response.data.toString());

    setState(() {
      var trrs = userMap['d']['Result']['Content'];
      dz = trrs.toString();
    });
  }


  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(this.title,
            overflow:TextOverflow.ellipsis ,
            style: TextStyle(fontSize: 16.0,color: Colors.white),
          ),
          backgroundColor: Colors.amber[700],
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.chevron_left,size: 30.0,color: Colors.white,), onPressed: (){Navigator.pop(context);})

      ),
      body: SingleChildScrollView(
          child:Container(
            padding: EdgeInsets.all(15.0),
            child:dz == null ?childWidget():Html(
              data: dz,
            ),
          )
      ),
    );
  }
}

