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
