import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_token.freezed.dart';

part 'wallet_token.g.dart';

@freezed

class WalletToken with _$WalletToken {
  const WalletToken._();
  factory WalletToken({
    @Default('')String base,
    @Default('')String quote,
    @Default('')String type,

    @ObjectDecimalOrNullConverter() Decimal? lastPrice,
    @ObjectDecimalOrNullConverter() Decimal? volume,
  }) = _WalletToken;

  factory WalletToken.fromJson(Map<String, dynamic> json) =>
      _$WalletTokenFromJson(json);

  String get symbol => '$base$quote$type';

  String get symbolName {
    if (type == 'SPOT') {
      return '$base/$quote';
    } else if (type == 'FUTURES') {
      return '$base-PERP';
    }
    return base;
  }
}


class ObjectDecimalOrNullConverter implements JsonConverter<Decimal?, Object?> {
  const ObjectDecimalOrNullConverter();

  @override
  Decimal? fromJson(Object? object) {
    try {
      return object == null ? null : Decimal.fromJson('$object');
    } catch (e) {
      return Decimal.zero;
    }
  }

  @override
  Object toJson(Decimal? object) => object?.toString() ?? '';
}