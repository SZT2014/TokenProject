import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

import 'package:fans/Widgets/adaptive_usd_display.dart';

class TokenItem extends StatelessWidget {
  const TokenItem({
    super.key,
    required this.name,
    this.volume,
    required this.price,
    // required this.priceDecimal,
    // this.priceChange,
  });

  final String name;
  final String? volume;
  final Decimal price;
  // final Decimal priceDecimal;
  // final double? priceChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            child: AdaptiveDecimalDisplay.dollarPrice(
              value: price,
              format: UsdFormat.m,
            ),
            // Text(
            //   '\$$price'
            // ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 80,
            alignment: Alignment.bottomRight,
            child: Text(
                volume ?? ''
            ),
          ),
        ],
      ),
    );
  }
}
