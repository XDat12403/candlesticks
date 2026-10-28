import 'package:candlesticks/src/models/candle.dart';
import 'package:candlesticks/src/utils/helper_functions.dart';
import 'package:flutter/material.dart';

class CandleInfoText extends StatelessWidget {
  const CandleInfoText({
    super.key,
    required this.candle,
    required this.bullColor,
    required this.bearColor,
    required this.defaultStyle,
  });

  final Candle candle;
  final Color bullColor;
  final Color bearColor;
  final TextStyle defaultStyle;

  String numberFormat(int value) {
    return '${value < 10 ? 0 : ''}$value';
  }

  String dateFormatter(DateTime date) {
    return '${numberFormat(date.day)} ${numberFormat(date.hour)}:${numberFormat(date.minute)}-${numberFormat(date.month)}-${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: dateFormatter(
          candle.date,
        ),
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: ' O:', style: TextStyle(fontSize: 12)),
          TextSpan(
            text: HelperFunctions.priceToString(candle.open),
            style: TextStyle(
                color: candle.isBull ? bullColor : bearColor, fontSize: 12),
          ),
          TextSpan(text: ' H:', style: TextStyle(fontSize: 12)),
          TextSpan(
            text: HelperFunctions.priceToString(candle.high),
            style: TextStyle(
                color: candle.isBull ? bullColor : bearColor, fontSize: 12),
          ),
          TextSpan(text: ' L:', style: TextStyle(fontSize: 12)),
          TextSpan(
            text: HelperFunctions.priceToString(candle.low),
            style: TextStyle(
                color: candle.isBull ? bullColor : bearColor, fontSize: 12),
          ),
          TextSpan(text: ' C:', style: TextStyle(fontSize: 12)),
          TextSpan(
            text: HelperFunctions.priceToString(candle.close),
            style: TextStyle(
                color: candle.isBull ? bullColor : bearColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
