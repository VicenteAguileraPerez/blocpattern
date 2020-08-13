import 'dart:async';
import 'package:blocpattern/Repository/Repository.dart';
import 'package:blocpattern/Utitlity/Eventos.dart';

class MainBLoC {
  final Repository repository = Repository();

  StreamController<Eventos> _input = StreamController();
  StreamController<int> _output = StreamController();

  Stream<int> get counterStream => _output.stream;
  StreamSink<Eventos> get sendEvent => _input.sink;
  MainBLoC() {
    _input.stream.listen(_onEvent);
  }
  void dispose() {
    _input.close();
    _output.close();
  }

  void _onEvent(Eventos event) {
    if (event==Eventos.INCREMENT) {
      repository.increment();
    } else if(event==Eventos.CLEAR){
      repository.clear();
    }
    _output.add(repository.count);
  }
}
