import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget nairaText(
    {required double? amount,
    String? precedingText = "",
    String? trailingText = "",
    TextStyle style = const TextStyle(
        color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
    String? currency = ""}) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
      text: '$precedingText ${formatAmount(amount, currency)} $trailingText',
      style: style,
    ),
  );
}

String formatAmount(double? amount, [String? currency = '']) {
  var formatter = NumberFormat("#,##0.00", "en_US");
  return "${getNairaSymbol(currency)}${formatter.format(amount)}";
}

String getNairaSymbol(String? currency) {
  if (currency!.isNotEmpty && currency.contains("USD")) return "\u{00024}";
  if (currency.isNotEmpty && currency.contains("GBP")) return "\u{00A3}";
  if (currency.isNotEmpty && currency.contains("NGN")) {
    return "\u{20A6}";
  } else {
    return currency;
  }
}
