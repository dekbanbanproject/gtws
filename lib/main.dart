import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_automation/flutter_automation.dart';

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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  // int _counter = 0;
  String scanresult;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SizedBox(
            height: 400,
            width:double.infinity,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ผลการสแกน',style: TextStyle(fontSize: 20),),
                   Text(scanresult ??="No data",style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: startScan,
        child: Icon(Icons.qr_code_scanner_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  startScan() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      scanresult = cameraScanResult;
    });
    print('OK');
  }
}
