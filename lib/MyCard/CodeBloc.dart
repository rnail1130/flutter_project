import 'dart:async';
class CodeBloc {


  final _counterActionController = StreamController<String>();
  StreamSink<String> get counter => _counterActionController.sink;

  final _counterController = StreamController<String>();
  Stream<String> get count => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(String data) {
    print('$data');
    _counterController.add(data);
  }

  void disponse() {
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('BLoC');
  }
}
