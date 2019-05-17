import 'package:flutter/material.dart';
import 'CodeBloc.dart';

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CodeBloc bloc;

  CounterProvider({
    this.child,
    this.bloc,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}