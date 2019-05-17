import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'list_data.dart';
import 'package:flutter_repo/Config/config.dart';
import 'deatil_page.dart';
import 'package:flutter_repo/tool/router_page.dart';

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          TopPart(),
          NewMessage(),
          MiddlPartOne(),
          //隔层
          Container(
            height: 10.0,
            color: Colors.grey[100],
          ),
          MiddlPartTwo(),
          //隔层
          Container(
            height: 10.0,
            color: Colors.grey[100],
          ),
          MiddlPartThree(),
          //隔层
          Container(
            height: 10.0,
            color: Colors.grey[100],
          ),
          MiddlPartFour(),
          //隔层
          Container(
            height: 10.0,
            color: Colors.grey[100],
          ),
          MiddlPartFive(),
          //隔层
          Container(
            height: 10.0,
            color: Colors.grey[100],
          ),
          MiddlPartSix(),
          //隔层
          Container(
            height: 10.0,
            color: Colors.grey[100],
          ),
          ConList(),
        ],
      ),
    );
  }
}
/**
 * 头部的部分
 */
class TopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        //color: Colors.white,
          border: Border(bottom:BorderSide(color: Colors.black12,width: 0.5) )
      ),
      // color: Colors.white,
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ExpandedList('assets/images/bangka.png','绑卡账户'),
          ExpandedList('assets/images/jiaofei.png','缴费账户'),
          ExpandedList('assets/images/huiyuan.png','会员账户'),
          ExpandedList('assets/images/piaoquan.png','票券卡包'),
        ],
      ),
    );
  }
}
class ExpandedList extends StatefulWidget{
  String src;
  String name;
  ExpandedList([this.src,this.name]);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExpandedList(this.src,this.name);
  }
}
class _ExpandedList extends State<ExpandedList>{
  String src;
  String name;
  _ExpandedList([this.src,this.name]);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      flex: 1,
      child: InkWell(
        //highlightColor: Colors.grey,
        splashColor: Colors.amber[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(src,width: 45.0,),
            SizedBox(height: 8.0,),
            Text(name)
          ],
        ),
        onTap: (){
          if(this.name == "票券卡包"){
            (){};
          }
          if(this.name == "会员账户"){
            (){};
          }
          if(this.name == "绑卡账户"){
            (){};
          }
          if(this.name == "缴费账户"){
            (){};
          }
        },
      ),
    );
  }
}
/**
 * 最新消息
 */
class NewMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      height: 45.0,
      color: Colors.grey[100],
      child: Row(
        children: <Widget>[
          Expanded (
            flex: 3,
            child:RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: '最新',
                style:TextStyle(
                    fontSize: 12.0,color: Colors.black,
                    fontWeight:
                    FontWeight.bold
                ),
                children: [
                  TextSpan(
                    text: '消息：',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: Colors.blue[500]
                    ),
                  ),
                  TextSpan(
                    text: '五源计划通化落地大会圆满召开',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('【最新】',style: TextStyle(fontSize: 12.0,color:Colors.amber ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/**
 * 居民卡服务
 */
class MiddlPartOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 35.0,
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12,width: 0.5),bottom: BorderSide(color: Colors.black12,width: 0.5))
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.red,width: 5.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 12.0,),
                        Text(
                          '居民卡服务',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0
                          ),
                        ),
                      ],
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Text('更多',style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                      onTap: (){print('2121');},
                    ),
                    Icon(Icons.chevron_right,color: Colors.grey,),
                  ],
                ),
              ),
            ],
          ),
        ),
        MiddlPartBuild({
          'part1':{
            "title":"申请办理",
            "subTitle":"如何办理居民卡",
            "src":"assets/images/index_pic.png",
            "url":Config.url+"/html5/pages/juminka/apply_card.html?_="+DateTime.now().millisecondsSinceEpoch.toString(),
          },
          'part2':{
            "title":"交易查询",
            "subTitle":"居民卡交易明细",
            "src":"assets/images/index_pic2.png",
            "url":"https://www.baidu.com",
          },
        }),
        MiddlPartBuild({
          'part1':{
            "title":"移动积分消费",
            "subTitle":"移动积分当钱花",
            "src":"assets/images/index_pic3.png",
            "url":Config.url+"/html5/pages/juminka/YDJFXiaoFei.html?_="+DateTime.now().millisecondsSinceEpoch.toString(),
          },
          'part2':{
            "title":"和包支付",
            "subTitle":"中国移动第三方支付",
            "src":"assets/images/index_pic4.png",
            "url":Config.url+"/html5/pages/cooperativePartner/mobileandpacketpayment.html?_="+DateTime.now().millisecondsSinceEpoch.toString(),

          },
        }),
        MiddlPartBuild({
          'part1':{
            "title":"紧急挂失",
            "subTitle":"居民卡账户在线挂失",
            "src":"assets/images/index_pic5.png",
            "url":Config.url+"/html5/pages/juminka/JJGuaShi.html?_="+DateTime.now().millisecondsSinceEpoch.toString(),

          },
          'part2':{
            "title":"使用说明",
            "subTitle":"居民卡APP使用说明",
            "src":"assets/images/index_pic6.png",
            "url":Config.url+"/html5/pages/juminka/introduction.html?_="+DateTime.now().millisecondsSinceEpoch.toString(),
          },
        }),
      ],
    );
  }
}
/**
 * 地方商业服务
 */
class MiddlPartTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 35.0,
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12,width: 0.5),bottom: BorderSide(color: Colors.black12,width: 0.5))
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.red,width: 5.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 12.0,),
                        Text(
                          '地方商业服务',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0
                          ),
                        ),
                      ],
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Text('更多',style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                      onTap: (){print('2121');},
                    ),
                    Icon(Icons.chevron_right,color: Colors.grey,),
                  ],
                ),
              ),
            ],
          ),
        ),
        MiddlPartBuild({
          'part1':{
            "title":"签约商户",
            "subTitle":"提供居民卡消费服务",
            "src":"assets/images/index_pic7.png"
          },
          'part2':{
            "title":"商户积分",
            "subTitle":"自动累计商户福利",
            "src":"assets/images/index_pic8.png"
          },
        }),
        MiddlPartBuild({
          'part1':{
            "title":"商户点卡",
            "subTitle":"购买/储值商户会员卡",
            "src":"assets/images/index_pic9.png"
          },
          'part2':{
            "title":"申请加入",
            "subTitle":"成为居民卡签约商户",
            "src":"assets/images/index_pic10.png"
          },
        }),
      ],
    );
  }
}
/**
 * 公共缴费服务
 */
class MiddlPartThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 35.0,
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12,width: 0.5),bottom: BorderSide(color: Colors.black12,width: 0.5))
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.red,width: 5.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 12.0,),
                        Text(
                          '公共缴费服务',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0
                          ),
                        ),
                      ],
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Text('更多',style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                      onTap: (){print('2121');},
                    ),
                    Icon(Icons.chevron_right,color: Colors.grey,),
                  ],
                ),
              ),
            ],
          ),
        ),
        MiddlPartBuild({
          'part1':{
            "title":"电费缴费",
            "subTitle":"公共缴费服务",
            "src":"assets/images/index_pic12.png"
          },
          'part2':{
            "title":"",
            "subTitle":"",
            "src":"assets/images/tm.png"
          },
        }),
      ],
    );
  }
}
/**
 * 五元计划介绍
 */
class MiddlPartFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 35.0,
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12,width: 0.5),bottom: BorderSide(color: Colors.black12,width: 0.5))
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.red,width: 5.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 12.0,),
                        Text(
                          '五源计划介绍',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0
                          ),
                        ),
                      ],
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Text('更多',style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                      onTap: (){print('2121');},
                    ),
                    Icon(Icons.chevron_right,color: Colors.grey,),
                  ],
                ),
              ),
            ],
          ),
        ),
        MiddlPartBuild({
          'part1':{
            "title":"五源计划",
            "subTitle":"中国移动智慧城市",
            "src":"assets/images/index_pic16.png"
          },
          'part2':{
            "title":"居民卡平台",
            "subTitle":"五源计划构成平台",
            "src":"assets/images/index_pic17.png"
          },
        }),
        MiddlPartBuild({
          'part1':{
            "title":"政企服务平台",
            "subTitle":"五源计划构成平台",
            "src":"assets/images/index_pic18.png"
          },
          'part2':{
            "title":"商业管理平台",
            "subTitle":"五源计划构成平台",
            "src":"assets/images/index_pic19.png"
          },
        }),
      ],
    );
  }
}
/**
 * 市域风貌
 */
class MiddlPartFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 35.0,
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12,width: 0.5),bottom: BorderSide(color: Colors.black12,width: 0.5))
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.red,width: 5.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 12.0,),
                        Text(
                          '市域风貌',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0
                          ),
                        ),
                      ],
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Text('更多',style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                      onTap: (){print('2121');},
                    ),
                    Icon(Icons.chevron_right,color: Colors.grey,),
                  ],
                ),
              ),
            ],
          ),
        ),
        MiddlPartBuild({
          'part1':{
            "title":"通化介绍",
            "subTitle":"市域百科",
            "src":"assets/images/index_pic24.png"
          },
          'part2':{
            "title":"地方旅游",
            "subTitle":"景区介绍和旅游攻略",
            "src":"assets/images/index_pic25.png"
          },
        }),
        MiddlPartBuild({
          'part1':{
            "title":"地方资讯",
            "subTitle":"地方新闻资讯",
            "src":"assets/images/index_pic26.png"
          },
          'part2':{
            "title":"",
            "subTitle":"",
            "src":"assets/images/tm.png"
          },
        }),
      ],
    );
  }
}
/**
 * 合作伙伴
 */
class MiddlPartSix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 35.0,
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12,width: 0.5),bottom: BorderSide(color: Colors.black12,width: 0.5))
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.red,width: 5.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 12.0,),
                        Text(
                          '合作伙伴',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0
                          ),
                        ),
                      ],
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Text('更多',style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                      onTap: (){print('2121');},
                    ),
                    Icon(Icons.chevron_right,color: Colors.grey,),
                  ],
                ),
              ),
            ],
          ),
        ),
        MiddlPartBuild({
          'part1':{
            "title":"中移和包",
            "subTitle":"金牌金融支付公司",
            "src":"assets/images/index_pic28.png"
          },
          'part2':{
            "title":"招商银行",
            "subTitle":"第六大商业银行",
            "src":"assets/images/index_pic29.png"
          },
        }),
        MiddlPartBuild({
          'part1':{
            "title":"红枣科技",
            "subTitle":"区域支付生态服务商",
            "src":"assets/images/index_pic30.png"
          },
          'part2':{
            "title":"中国移动",
            "subTitle":"最大通信运营商",
            "src":"assets/images/index_pic31.png"
          },
        }),
      ],
    );
  }
}
/**
 * 地方咨询
 */
class ConList extends StatefulWidget {
  @override
  _ConListState createState() => _ConListState();
}

class _ConListState extends State<ConList> {
  List trsf = [];

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

    response = await dio.post(Config.url+'/Index.aspx/LatestNews');
    // rvb = response;
    Map userMap = json.decode(response.data.toString());

    for(int i=0; i<userMap['d']['Result'].length;i++){
      var datalist = userMap['d']['Result'][i];
      DataListDResult dataListDResult = DataListDResult.fromJson(datalist);
      setState(() {
        trsf.add(datalist);
      });
    }
  }
  Widget createWidget(){
    List<Widget> chirend = [];
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for(int i=0; i<trsf.length;i++){
      DataListDResult dataListDResult = DataListDResult.fromJson(trsf[i]);
      chirend.add(
          HomeList(dataListDResult.imageUrl,dataListDResult.title,dataListDResult.dateTime,dataListDResult.id)
      );
    }
    content = Column(
      children: chirend,
    );
    return content;
  }

  void homeListes (){
    for(int i=0; i<trsf.length;i++){
      Text('12121');
    }
  }
  @override
  void initState() {
    super.initState();
    getHttp();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 35.0,
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black12,width: 0.5),bottom: BorderSide(color: Colors.black12,width: 0.5))
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.brown,width: 5.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 12.0,),
                        Text(
                          '地方咨询',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0
                          ),
                        ),
                      ],
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      child: Text('更多',style: TextStyle(fontSize: 12.0,color: Colors.grey),),
                      onTap: (){print('2121');},
                    ),
                    Icon(Icons.chevron_right,color: Colors.grey,),
                  ],
                ),
              ),
            ],
          ),
        ),
        createWidget(),
        /*  HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180629100854.jpg','12123132','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180628183507.jpg','伊朗球迷酒店干扰C罗休息伊朗人留言代同胞道歉在俄罗斯世界杯B组第三轮葡萄牙VS伊朗的焦点大战打响之前为了让球队能够顺利晋级伊朗球迷想出了一个绝招去酒店制造噪音干扰葡萄牙队队长C罗休息','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180629100949.jpg','福田汽车28亿预投张家口基地','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180629100854.jpg','12123132','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180628183507.jpg','伊朗球迷酒店干扰C罗休息伊朗人留言代同胞道歉在俄罗斯世界杯B组第三轮葡萄牙VS伊朗的焦点大战打响之前为了让球队能够顺利晋级伊朗球迷想出了一个绝招去酒店制造噪音干扰葡萄牙队队长C罗休息','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180629100949.jpg','福田汽车28亿预投张家口基地','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180629100854.jpg','12123132','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180628183507.jpg','伊朗球迷酒店干扰C罗休息伊朗人留言代同胞道歉在俄罗斯世界杯B组第三轮葡萄牙VS伊朗的焦点大战打响之前为了让球队能够顺利晋级伊朗球迷想出了一个绝招去酒店制造噪音干扰葡萄牙队队长C罗休息','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180629100949.jpg','福田汽车28亿预投张家口基地','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180629100854.jpg','12123132','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180628183507.jpg','伊朗球迷酒店干扰C罗休息伊朗人留言代同胞道歉在俄罗斯世界杯B组第三轮葡萄牙VS伊朗的焦点大战打响之前为了让球队能够顺利晋级伊朗球迷想出了一个绝招去酒店制造噪音干扰葡萄牙队队长C罗休息','2019-06-05'),
        HomeList('http://60.247.61.162:8034/Upload/Images/articles/articlesImg-20180629100949.jpg','福田汽车28亿预投张家口基地','2019-06-05'),*/
      ],
    );
  }
}
class HomeList extends StatelessWidget{
  final src;
  final title;
  final time;
  final id;
  HomeList([this.src,this.title,this.time,this.id]);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        Navigator.push(context, CustomeRouter(Deatile(this.title,id: this.id,)));
      },
      child: Container(
          height: 90.0,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5,color: Colors.black12))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  //  color: Colors.brown,
                  child: Image.network(src),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  //   color: Colors.blueGrey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        time,
                        style: TextStyle(fontSize: 12.0,color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}

class MiddlPartBuild extends StatefulWidget{
  Map datas;
  MiddlPartBuild(this.datas);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MiddlPartBuild(this.datas);
  }
}
class _MiddlPartBuild extends State<MiddlPartBuild>{
  Map datas;
  _MiddlPartBuild(this.datas);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        // color: Colors.cyanAccent,
          border: Border(bottom: BorderSide(color: Colors.black12,width: 0.5))
      ),
      child: Row(
        children: <Widget>[
          MiddlPartBuildExpanded(this.datas['part1']),
          MiddlPartBuildExpanded(this.datas['part2']),
        ],
      ),
    );
  }
}
class MiddlPartBuildExpanded extends StatefulWidget{
  Map datae;
  MiddlPartBuildExpanded(this.datae);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MiddlPartBuildExpanded(this.datae);
  }
}
class _MiddlPartBuildExpanded extends State<MiddlPartBuildExpanded>{
  Map datae;
  _MiddlPartBuildExpanded(this.datae);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Expanded(
      flex: 1,
      child: InkWell(
        onTap: (){
          print(this.datae['url']);
          print(this.datae['title']);
          if(this.datae['title'] != null && this.datae['url'] != null){
            Navigator.push(context, CustomeRouter(Deatile(this.datae['title'],url: this.datae['url'],)));
          }
        },
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.red,
              border: Border(right: BorderSide(color: Colors.black12,width: 0.5))
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        this.datae['title']
                    ),
                    SizedBox(height: 8.0,),
                    Text(
                      this.datae['subTitle'],
                      style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        this.datae['src'],
                        width: 35.0,
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}