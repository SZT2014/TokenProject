import 'dart:math';
import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:fans/Widgets/decimal_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum UsdFormat { k, m, b, n }

class AdaptiveDecimalDisplay extends StatelessWidget {

  factory AdaptiveDecimalDisplay.dollarPrice({
    Decimal? value,
    TextStyle? style,
    UsdFormat format = UsdFormat.n,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return AdaptiveDecimalDisplay(
      value: value,
      prefix: '\$',
      style: style,
      format: format,
      zeroValue: '0.00',
      compressZero: true,
      useSignificantFigures:true,
      fixedLength: 4,
      alignment: alignment,
    );
  }

  const AdaptiveDecimalDisplay({
    super.key,
    this.value,
    this.style,
    this.prefix = '',
    this.symbol = '',
    this.format = UsdFormat.n,
    this.compressZero = false,
    this.zeroValue = '0',
    this.fixedLength = 4,
    this.useSignificantFigures = false,
    this.alignment = Alignment.center,
  });

  final Decimal? value;
  final TextStyle? style;
  final UsdFormat format;
  final String prefix;
  final String symbol;
  final bool compressZero; //压缩小数点后0角标显示
  final String zeroValue;
  final int fixedLength;
  final bool useSignificantFigures;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: alignment,
      child: _DecimalText(
          key: key,
          value: value,
          style: style,
          prefix: prefix,
          symbol: symbol,
          format: format,
          zeroValue: zeroValue,
          compressZero: compressZero,
          fixedLength: fixedLength,
          useSignificantFigures: useSignificantFigures),
    );
  }
}

class _DecimalText extends StatelessWidget {
  const _DecimalText({
    super.key,
    this.value,
    this.style,
    required this.prefix,
    required this.symbol ,
    required this.format ,
    required this.compressZero,
    required this.zeroValue,
    required this.fixedLength,
    this.useSignificantFigures = false,
  });

  final Decimal? value;
  final TextStyle? style;
  final UsdFormat format;
  final String prefix;
  final String symbol;
  final bool compressZero;
  final bool useSignificantFigures;
  final String zeroValue;
  final int fixedLength;

  @override
  Widget build(BuildContext context) {
    final realValue = value;

    final realStyle = style;
    if (realValue == null) return Text('-', style: realStyle);

    if (realValue.isZero) {
      return Text(
        '$prefix$zeroValue$symbol',
        style: realStyle,
      );
    }

    if (realValue < Decimal.parse('0.01') && compressZero) {
      final temp = realValue.toString().split('.');

      var index = 0;
      for (; index < temp[1].length; index++) {
        if (temp[1][index] != '0') {
          break;
        }
      }
      final remain = temp[1].replaceRange(0, index, '');
      final resultStr = remain.substring(0, min(remain.length, 4)).replaceAll(RegExp(r'0+$'), '');
      return Text.rich(
        TextSpan(
          text: '${prefix}0.0',
          children: [
            WidgetSpan(
              baseline: TextBaseline.ideographic,
              child: Transform.translate(
                offset: Offset(0, 3),
                child: Text(
                  '$index',
                ),
              ),
            ),
            TextSpan(
              text: resultStr,
            ),
            TextSpan(
              text: symbol,
            ),
          ],
        ),
        style: realStyle,
      );
    }

    var realValueStr = '-';
    if (realValue >= Decimal.fromInt(1000000000) &&
        format.index <= UsdFormat.b.index) {
      final currentValue = (realValue / Decimal.fromInt(1000000000)).toDecimal();
      int realFixedLength = getRealFixedLength(currentValue);
      realValueStr =
          '${currentValue.formatValue(realFixedLength)}B';
    } else if (realValue >= Decimal.fromInt(1000000) &&
        format.index <= UsdFormat.m.index) {
      final currentValue = (realValue / Decimal.fromInt(1000000)).toDecimal();
      int realFixedLength = getRealFixedLength(currentValue);
      realValueStr =
          '${currentValue.formatValue(realFixedLength)}M';
    } else if (realValue >= Decimal.fromInt(1000) &&
        format.index <= UsdFormat.k.index) {
      final currentValue = (realValue / Decimal.fromInt(1000)).toDecimal();
      int realFixedLength = getRealFixedLength(currentValue);
      realValueStr =
          '${currentValue.formatValue(realFixedLength)}K';
    } else {
      int realFixedLength = getRealFixedLength(realValue);
      realValueStr = realValue.formatValue(realFixedLength);
    }
    return Text('$prefix$realValueStr$symbol', style: realStyle);
  }

  int getRealFixedLength(Decimal realValue) {
    int realFixedLength = fixedLength;
    if (useSignificantFigures) {
      List<String> numList = realValue.toString().split('.');
      if (numList.length == 2) {
        int leadingZerosLength = countLeadingZeros(numList[1]);
        realFixedLength += leadingZerosLength;
      }
    }
    return realFixedLength;
  }

  int countLeadingZeros(String str) {
    RegExp leadingZeros = RegExp(r'^0+');
    Match? match = leadingZeros.firstMatch(str);
    return match?.group(0)?.length ?? 0;
  }
}
