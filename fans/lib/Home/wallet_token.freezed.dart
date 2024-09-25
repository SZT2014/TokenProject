// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletToken _$WalletTokenFromJson(Map<String, dynamic> json) {
  return _WalletToken.fromJson(json);
}

/// @nodoc
mixin _$WalletToken {
  String get base => throw _privateConstructorUsedError;
  String get quote => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @ObjectDecimalOrNullConverter()
  Decimal? get lastPrice => throw _privateConstructorUsedError;
  @ObjectDecimalOrNullConverter()
  Decimal? get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletTokenCopyWith<WalletToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTokenCopyWith<$Res> {
  factory $WalletTokenCopyWith(
          WalletToken value, $Res Function(WalletToken) then) =
      _$WalletTokenCopyWithImpl<$Res, WalletToken>;
  @useResult
  $Res call(
      {String base,
      String quote,
      String type,
      @ObjectDecimalOrNullConverter() Decimal? lastPrice,
      @ObjectDecimalOrNullConverter() Decimal? volume});
}

/// @nodoc
class _$WalletTokenCopyWithImpl<$Res, $Val extends WalletToken>
    implements $WalletTokenCopyWith<$Res> {
  _$WalletTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? quote = null,
    Object? type = null,
    Object? lastPrice = freezed,
    Object? volume = freezed,
  }) {
    return _then(_value.copyWith(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      lastPrice: freezed == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as Decimal?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as Decimal?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletTokenImplCopyWith<$Res>
    implements $WalletTokenCopyWith<$Res> {
  factory _$$WalletTokenImplCopyWith(
          _$WalletTokenImpl value, $Res Function(_$WalletTokenImpl) then) =
      __$$WalletTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String base,
      String quote,
      String type,
      @ObjectDecimalOrNullConverter() Decimal? lastPrice,
      @ObjectDecimalOrNullConverter() Decimal? volume});
}

/// @nodoc
class __$$WalletTokenImplCopyWithImpl<$Res>
    extends _$WalletTokenCopyWithImpl<$Res, _$WalletTokenImpl>
    implements _$$WalletTokenImplCopyWith<$Res> {
  __$$WalletTokenImplCopyWithImpl(
      _$WalletTokenImpl _value, $Res Function(_$WalletTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base = null,
    Object? quote = null,
    Object? type = null,
    Object? lastPrice = freezed,
    Object? volume = freezed,
  }) {
    return _then(_$WalletTokenImpl(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      lastPrice: freezed == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as Decimal?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as Decimal?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTokenImpl extends _WalletToken {
  _$WalletTokenImpl(
      {this.base = '',
      this.quote = '',
      this.type = '',
      @ObjectDecimalOrNullConverter() this.lastPrice,
      @ObjectDecimalOrNullConverter() this.volume})
      : super._();

  factory _$WalletTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletTokenImplFromJson(json);

  @override
  @JsonKey()
  final String base;
  @override
  @JsonKey()
  final String quote;
  @override
  @JsonKey()
  final String type;
  @override
  @ObjectDecimalOrNullConverter()
  final Decimal? lastPrice;
  @override
  @ObjectDecimalOrNullConverter()
  final Decimal? volume;

  @override
  String toString() {
    return 'WalletToken(base: $base, quote: $quote, type: $type, lastPrice: $lastPrice, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTokenImpl &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lastPrice, lastPrice) ||
                other.lastPrice == lastPrice) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, base, quote, type, lastPrice, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTokenImplCopyWith<_$WalletTokenImpl> get copyWith =>
      __$$WalletTokenImplCopyWithImpl<_$WalletTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTokenImplToJson(
      this,
    );
  }
}

abstract class _WalletToken extends WalletToken {
  factory _WalletToken(
          {final String base,
          final String quote,
          final String type,
          @ObjectDecimalOrNullConverter() final Decimal? lastPrice,
          @ObjectDecimalOrNullConverter() final Decimal? volume}) =
      _$WalletTokenImpl;
  _WalletToken._() : super._();

  factory _WalletToken.fromJson(Map<String, dynamic> json) =
      _$WalletTokenImpl.fromJson;

  @override
  String get base;
  @override
  String get quote;
  @override
  String get type;
  @override
  @ObjectDecimalOrNullConverter()
  Decimal? get lastPrice;
  @override
  @ObjectDecimalOrNullConverter()
  Decimal? get volume;
  @override
  @JsonKey(ignore: true)
  _$$WalletTokenImplCopyWith<_$WalletTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
