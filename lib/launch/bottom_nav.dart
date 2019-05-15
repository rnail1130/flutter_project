import 'package:flutter/material.dart';


class BottomNav extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNav();
  }
}
class _BottomNav extends State<BottomNav>{
  int _currentIndex = 0;

  void _onTapHandler (int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  List<Widget> list = List();

  @override
  void initState() {
    list
      ..add(Text('1111'))
      ..add(Text('2222'))
      ..add(Text('3333'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: list[_currentIndex],//HomeContent(),
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapHandler,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore,size: 20.0,),
            title: Text('首页',style: TextStyle(fontSize: 12.0),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card,size: 20.0,),
            title: Text('我的虚拟卡',style: TextStyle(fontSize: 12.0),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history,size: 20.0,),
            title: Text('个人中心',style: TextStyle(fontSize: 12.0),),
          ),
        ],
      ),
    );
  }
}