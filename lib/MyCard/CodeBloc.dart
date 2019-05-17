import 'dart:async';
class CodeBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;

  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');
    _count = data + _count;
    _counterController.add(_count);
  }

  void disponse() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('BLoC');
  }
}
