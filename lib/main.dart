import 'package:flight_reservouir/SessionManager.dart';
import 'package:flight_reservouir/bloc/SearchFlightBloc.dart';
import 'package:flight_reservouir/models/BlocModel.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flight Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  SearchFlightBloc searchFlightBloc;

  @override
  void initState() {
    super.initState();
    SessionManager.init();
    searchFlightBloc = SearchFlightBloc();
    WidgetsBinding.instance.addPostFrameCallback((context){
      //searchFlightBloc.getAccessToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: StreamBuilder(
          stream: searchFlightBloc.outBlocModel,
          builder: (context, AsyncSnapshot<BlocModel> snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return SizedBox();
              case ConnectionState.active:
              case ConnectionState.done:
                BlocModel model = snapshot.data;
                if(model.processing) return CircularProgressIndicator();
                return Column(
                  children: <Widget>[
                    Text("Something is back")
                  ],
                );
            }
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          searchFlightBloc.search({
            "origin": "NYC",
            "destination" : "MAD",
            "departureDate": "2019-08-01",
            "adult" : "1"
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
