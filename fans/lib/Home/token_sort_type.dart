import 'package:decimal/decimal.dart';
import 'package:fans/Home/wallet_token.dart';

enum TokenSortType {
  symbolAsc,
  symbolDesc,
  lastPriceAsc,
  lastPriceDesc,
  volumeAsc,
  volumeDesc,
  tokenSortDefault;

  int Function (WalletToken a, WalletToken b) get sortKey {
    return (WalletToken a, WalletToken b) {
      switch (this) {
        case TokenSortType.symbolAsc:
          return a.symbol.compareTo(b.symbol);
        case TokenSortType.symbolDesc:
          return -a.symbol.compareTo(b.symbol);
        case TokenSortType.lastPriceAsc:
          return (a.lastPrice ?? Decimal.zero).compareTo(b.lastPrice ?? Decimal.zero);
        case TokenSortType.lastPriceDesc:
          return -(a.lastPrice ?? Decimal.zero).compareTo(b.lastPrice ?? Decimal.zero);
        case TokenSortType.volumeAsc:
          return (a.volume ?? Decimal.zero).compareTo(b.volume ?? Decimal.zero);
        case TokenSortType.volumeDesc:
          return -(a.volume ?? Decimal.zero).compareTo(b.volume ?? Decimal.zero);
        case TokenSortType.tokenSortDefault:
          return 0;
      }
    };
  }
}
