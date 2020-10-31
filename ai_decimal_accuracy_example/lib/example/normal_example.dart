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
