# ai_decimal_accuracy_example

A new Flutter application about decimal accuracy example.

---------------

* main.dart

```

        
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



```

* normal_example.dart

```

        
        import 'package:air_design/air_design.dart';
        import 'package:flutter/material.dart';
        
        ///
        /// NormalExample
        class NormalExample extends StatefulWidget {
          @override
          _NormalExampleState createState() => _NormalExampleState();
        }
        
        class _NormalExampleState extends State<NormalExample> {
          TextEditingController _totalEditingController;
          dynamic _data = {};
          @override
          void initState() {
            super.initState();
        
            _totalEditingController = TextEditingController();
          }
        
          @override
          void dispose() {
            super.dispose();
            _totalEditingController.dispose();
          }
        
          @override
          Widget build(BuildContext context) {
            return Column(
              children: [
                AirDividerWithoutLineWidget.defaultStyle(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Normal  decimal operation",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                AirDividerWithoutLineWidget.defaultStyle(),
                AirSingleChildRowWidget.textWithChild(
                  beginLabel: "单价：",
                  endChild: Expanded(
                    child: AirMiniInputWidget.defaultStyle(
                      value: "${_data['price'] ?? ''}",
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      suffixText: "¥/kg",
                      onChanged: (String value) {
                        if (value.isNotEmpty) {
                          try {
                            num priceNumber = num.parse(value);
                            _data['price'] = priceNumber;
        
                            num weightNumber = num.parse(_data['weight']);
        
                            _data['total'] = (priceNumber * weightNumber);
                            _totalEditingController.text = "${_data['total']}";
                          } catch (error) {}
                        }
                      },
                    ),
                  ),
                ),
                AirDividerWithoutLineWidget.defaultStyle(),
                AirSingleChildRowWidget.textWithChild(
                  beginLabel: "重量：",
                  endChild: Expanded(
                    child: AirMiniInputWidget.defaultStyle(
                      value: "${_data['weight'] ?? ''}",
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      suffixText: "kg",
                      onChanged: (String value) {
                        if (value.isNotEmpty) {
                          try {
                            num priceNumber = num.parse("${_data['price']}");
                            num weightNumber = num.parse(value);
                            _data['weight'] = weightNumber;
        
                            _data['total'] = priceNumber * weightNumber;
        
                            _totalEditingController.text = "${_data['total']}";
                          } catch (error) {}
                        }
                      },
                    ),
                  ),
                ),
                AirDividerWithoutLineWidget.defaultStyle(),
                AirSingleChildRowWidget.textWithChild(
                  beginLabel: "总金额：",
                  endChild: Expanded(
                    child: AirMiniInputWidget.defaultStyle(
                      value: "${_data['total'] ?? ''}",
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      suffixText: "¥",
                      onChanged: (String value) {
                        _data['total'] = value;
                      },
                      textEditingController: _totalEditingController,
                    ),
                  ),
                ),
              ],
            );
          }
        }


```

* ai_decimal_accuracy_example.dart

```

        
        import 'package:ai_decimal_accuracy/ai_decimal_accuracy.dart';
        import 'package:air_design/air_design.dart';
        import 'package:flutter/material.dart';
        
        ///
        /// AiDecimalAccuracyExample
        class AiDecimalAccuracyExample extends StatefulWidget {
          @override
          _AiDecimalAccuracyExampleState createState() =>
              _AiDecimalAccuracyExampleState();
        }
        
        class _AiDecimalAccuracyExampleState extends State<AiDecimalAccuracyExample> {
          TextEditingController _totalEditingController;
          dynamic _data = {};
          @override
          void initState() {
            super.initState();
        
            _totalEditingController = TextEditingController();
          }
        
          @override
          void dispose() {
            super.dispose();
            _totalEditingController.dispose();
          }
        
          @override
          Widget build(BuildContext context) {
            return Column(
              children: [
                AirDividerWithoutLineWidget.defaultStyle(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AiDecimalAccuracy decimal operation",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                AirDividerWithoutLineWidget.defaultStyle(),
                AirSingleChildRowWidget.textWithChild(
                  beginLabel: "单价：",
                  endChild: Expanded(
                    child: AirMiniInputWidget.defaultStyle(
                      value: "${_data['price'] ?? ''}",
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      suffixText: "¥/kg",
                      onChanged: (String value) {
                        _data['price'] = value;
        
                        AiDecimalAccuracy priceNumber =
                            AiDecimalAccuracy.tryParse(_data['price']) ??
                                AiDecimalAccuracy.zero;
                        AiDecimalAccuracy weightNumber =
                            AiDecimalAccuracy.tryParse(_data['weight']) ??
                                AiDecimalAccuracy.zero;
        
                        _data['total'] = (priceNumber * weightNumber).toDouble();
                        _totalEditingController.text = "${_data['total']}";
                      },
                    ),
                  ),
                ),
                AirDividerWithoutLineWidget.defaultStyle(),
                AirSingleChildRowWidget.textWithChild(
                  beginLabel: "重量：",
                  endChild: Expanded(
                    child: AirMiniInputWidget.defaultStyle(
                      value: "${_data['weight'] ?? ''}",
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      suffixText: "kg",
                      onChanged: (String value) {
                        _data['weight'] = value;
        
                        AiDecimalAccuracy priceNumber =
                            AiDecimalAccuracy.tryParse(_data['price']) ??
                                AiDecimalAccuracy.zero;
                        AiDecimalAccuracy weightNumber =
                            AiDecimalAccuracy.tryParse(_data['weight']) ??
                                AiDecimalAccuracy.zero;
        
                        _data['total'] = (priceNumber * weightNumber).toDouble();
                        _totalEditingController.text = "${_data['total']}";
                      },
                    ),
                  ),
                ),
                AirDividerWithoutLineWidget.defaultStyle(),
                AirSingleChildRowWidget.textWithChild(
                  beginLabel: "总金额：",
                  endChild: Expanded(
                    child: AirMiniInputWidget.defaultStyle(
                      value: "${_data['total'] ?? ''}",
                      inputType: TextInputType.numberWithOptions(decimal: true),
                      suffixText: "¥",
                      onChanged: (String value) {
                        _data['total'] = num.tryParse(value) ?? 0;
                      },
                      textEditingController: _totalEditingController,
                    ),
                  ),
                ),
              ],
            );
          }
        }


```

