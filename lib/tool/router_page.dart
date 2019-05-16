import 'package:flutter/material.dart';

//定义路由动画效果
class CustomeRouter extends PageRouteBuilder {
  final Widget widget;

  CustomeRouter(this.widget)
      :super(
      transitionDuration :  Duration(milliseconds: 500),
      pageBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          ){
        return widget;
      },
      transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child
          ){
        //渐隐的效果
//          return FadeTransition (
//            opacity: Tween(begin: 0.0,end:1.0)
//                .animate(CurvedAnimation(parent: animation1, curve: Curves.easeIn)),
//            child: child,
//          );
        //缩放的效果
//          return ScaleTransition (
//            scale: Tween(begin: 0.0,end: 1.0)
//                .animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
//            child: child,
//          );
        //旋转+缩放
//      return RotationTransition (
//        turns: Tween(begin: 0.0,end: 1.0)
//            .animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
//        child: ScaleTransition(
//             scale: Tween(begin: 0.0,end: 1.0)
//                .animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
//            child: child,
//        ),
//      );
        //常用效果
        return SlideTransition (
          position: Tween<Offset>(
              begin: Offset(1.0, 0.0),
              end: Offset(0.0, 0.0)
          ).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
          child: child,
        );
      }
  );
}