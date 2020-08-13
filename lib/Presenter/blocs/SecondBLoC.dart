import 'dart:async';

import 'package:blocpattern/Repository/Repository.dart';
import 'package:blocpattern/Utitlity/Eventos.dart';




class SecondBLoC
{
  Repository repository = Repository();
  StreamController<Eventos> _input = StreamController();
  StreamController<int> _output = StreamController();

  Stream<int> get counterStream =>_output.stream;
  StreamSink<Eventos> get sendEvent =>_input.sink;
  SecondBLoC()
  {
    _input.stream.listen(_onEvent);
  }
  void dispose()
  {
    _input.close();
    _output.close();
  }

  void _onEvent(Eventos event)
  {
      if(event==Eventos.DOUBLE)
      {
       repository.double();
      }
      else if(event==Eventos.CLEAR){
        repository.clear();
      }
      _output.add(repository.count);
  }
}
