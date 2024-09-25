
import 'package:fans/Home/token_sort_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fans/gen/assets.gen.dart';

class TitleWithSort extends HookWidget {
  const TitleWithSort({
    super.key,
    required this.onSortChanged,
    required this.sortTypes,
    this.containerHorizontal = 10,
  });

  final void Function(TokenSortType) onSortChanged;
  final double containerHorizontal;
  final TokenSortType? sortTypes;

  @override
  Widget build(BuildContext context) {

    final sortType = useState<TokenSortType?>(sortTypes);

    void onSort(TokenSortType sort) {
      onSortChanged.call(sort);
      sortType.value = sort;
    }

    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: containerHorizontal, vertical: 8),
      child: Row(
        children: [
          Visibility(
            visible: true,
            child: Row(
              children: [
                SortIcon(
                  label: const Text(
                    'Symbol',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'CupertinoSystemDisplay',
                      letterSpacing: -0.13,
                      height: 1.3,
                    ),
                  ),
                  sortType: sortType.value,
                  onChange: (sortType) => onSort.call(sortType),
                  sortTypeAsc: TokenSortType.symbolAsc,
                  sortTypeDesc: TokenSortType.symbolDesc,
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          const Spacer(),
          Visibility(
            visible: true,
            child: Container(
              // color: Colors.greenAccent,
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SortIcon(
                    label: const Text(
                      'Last Price',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CupertinoSystemDisplay',
                        letterSpacing: -0.13,
                        height: 1.3,
                      ),
                    ),
                    sortType: sortType.value,
                    onChange: (sortType) => onSort.call(sortType),
                    sortTypeAsc: TokenSortType.lastPriceAsc,
                    sortTypeDesc: TokenSortType.lastPriceDesc,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: Container(
              // color: Colors.red,
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SortIcon(
                    label: const Text(
                      'Volume',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'CupertinoSystemDisplay',
                        letterSpacing: -0.13,
                        height: 1.3,
                      ),
                    ),
                    sortType: sortType.value,
                    onChange: (sortType) => onSort.call(sortType),
                    sortTypeAsc: TokenSortType.volumeAsc,
                    sortTypeDesc: TokenSortType.volumeDesc,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SortIcon extends HookWidget {
  const SortIcon({
    super.key,
    required this.sortTypeAsc,
    required this.sortTypeDesc,
    required this.sortType,
    this.onChange,
    required this.label,
  });

  final Widget label;
  final TokenSortType sortTypeAsc;
  final TokenSortType sortTypeDesc;
  final TokenSortType? sortType;
  final Function(TokenSortType)? onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var targetSortType = sortTypeAsc;
        if (sortType == sortTypeAsc) {
          targetSortType = sortTypeDesc;
        } else if (sortType == sortTypeDesc) {
          targetSortType = TokenSortType.tokenSortDefault;
        }
        onChange?.call(targetSortType);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          label,
          const SizedBox(width: 6),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: Assets.icons.iconSort.svg(
                  color: sortType == sortTypeAsc
                      ? Colors.red
                      : Colors.black,
                ),
              ),
              const SizedBox(height: 3),
              Assets.icons.iconSort.svg(
                color: sortType == sortTypeDesc
                    ? Colors.red
                    : Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}