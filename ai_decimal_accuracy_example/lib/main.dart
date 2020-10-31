import 'package:ai_decimal_accuracy_example/example/ai_decimal_accuracy_example.dart';
import 'package:ai_decimal_accuracy_example/example/normal_example.dart';
import 'package:air_design/air_design.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AiDecimalAccuracy example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'AiDecimalAccuracy example'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.web_asset),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AirContainerListItemWidget.defaultStyle(
              child: NormalExample(),
            ),
            AirContainerListItemWidget.defaultStyle(
              child: AiDecimalAccuracyExample(),
            ),
            Container(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
