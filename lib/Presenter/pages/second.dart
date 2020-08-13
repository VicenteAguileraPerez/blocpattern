import 'package:blocpattern/Utitlity/Eventos.dart';
import 'package:flutter/material.dart';
import 'package:blocpattern/Presenter/blocs/SecondBLoC.dart';

class Second extends StatefulWidget
{
  Second({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  SecondBLoC _bLoC = SecondBLoC();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bLoC.sendEvent.add(Eventos.FETCH);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _bLoC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _bLoC.counterStream,
        builder: (context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${snapshot.data}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline4,
                    ),
                  ],
                ),
              ),
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: "Button1",
                    onPressed: () {
                      _bLoC.sendEvent.add(Eventos.DOUBLE);
                    },
                    tooltip: 'x2',
                    child: Icon(Icons.add_circle_outline),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  FloatingActionButton(
                    heroTag: "Button2",
                    onPressed: () {
                      _bLoC.sendEvent.add(Eventos.CLEAR);
                    },
                    tooltip: 'clear',
                    child: Icon(Icons.clear),
                  ),
                ],
              )
            // This trailing comma makes auto-formatting nicer for build methods.
          );
        }
    );
  }
}