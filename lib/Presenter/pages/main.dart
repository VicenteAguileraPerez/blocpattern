import 'package:blocpattern/Repository/Repository.dart';
import 'package:blocpattern/Utitlity/Eventos.dart';
import 'package:flutter/material.dart';
import 'package:blocpattern/Presenter/blocs/MainBloC.dart';
import 'package:blocpattern/Presenter/pages/second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  static final Repository repository = Repository();
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MainBLoC _bLoC = MainBLoC();

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
      initialData: 0,
      builder:(context, snapshot)
      {
        print("Data: ${snapshot.hasData}");
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              actions: [
                FlatButton.icon(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Second(title: "Multiplicar",);
                      })
                      );
                    },
                    icon: Icon(Icons.navigate_next),
                    label: Text(""))
              ],
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
                    style: Theme.of(context).textTheme.headline4,
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
                    _bLoC.sendEvent.add(Eventos.CLEAR);
                  },
                  tooltip: 'Clear',
                  child: Icon(Icons.clear),
                ),
                SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  heroTag: "Button2",
                  onPressed: () {
                    _bLoC.sendEvent.add(Eventos.INCREMENT);
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            )
            // This trailing comma makes auto-formatting nicer for build methods.
            );
      },
    );
  }
}
