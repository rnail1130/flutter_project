import 'package:flutter/material.dart';

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
            "src":"assets/images/index_pic.png"
          },
          'part2':{
            "title":"交易查询",
            "subTitle":"居民卡交易明细",
            "src":"assets/images/index_pic2.png"
          },
        }),
        MiddlPartBuild({
          'part1':{
            "title":"移动积分消费",
            "subTitle":"移动积分当钱花",
            "src":"assets/images/index_pic3.png"
          },
          'part2':{
            "title":"和包支付",
            "subTitle":"中国移动第三方支付",
            "src":"assets/images/index_pic4.png"
          },
        }),
        MiddlPartBuild({
          'part1':{
            "title":"紧急挂失",
            "subTitle":"居民卡账户在线挂失",
            "src":"assets/images/index_pic5.png"
          },
          'part2':{
            "title":"使用说明",
            "subTitle":"居民卡APP使用说明",
            "src":"assets/images/index_pic6.png"
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
          print(this.datae['title']);
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