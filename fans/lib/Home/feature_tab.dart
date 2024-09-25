import 'package:decimal/decimal.dart';
import 'package:fans/Home/title_with_sort.dart';
import 'package:fans/Home/token_item.dart';
import 'package:fans/Home/token_sort_type.dart';
import 'package:fans/Home/wallet_token.dart';
import 'package:fans/Home/wallet_tokens_provider.dart';
import 'package:fans/Widgets/app_empty.dart';
import 'package:fans/Widgets/app_search_input.dart';
import 'package:fans/Widgets/decimal_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeatureTab extends HookConsumerWidget {
  const FeatureTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortType = useState<TokenSortType?>(null);
    final content = useState<String>('');
    List<WalletToken> allTokens = ref.watch(featureTokensRequestProvider).valueOrNull ?? [];
    final tokens = useMemoized(() {
      var filterTokens = allTokens;
      if(content.value.isNotEmpty) {
        final tokensList = filterTokens.where((w) => w.base.contains(content.value)).toList();
        filterTokens = tokensList;
      }
      if (sortType.value == null) return filterTokens;
      if(sortType.value == TokenSortType.tokenSortDefault) {
        var highestList = filterTokens.where((w) => highestToken.contains(w.base)).toList();
        highestList.sort((a, b) {
          var c = a.base.compareTo(b.base);
          return c;
        });
        var tokensList = filterTokens.where((w) => !highestToken.contains(w.base)).toList();
        tokensList.sort(TokenSortType.volumeDesc.sortKey);
        return highestList + tokensList;
      } else {
        filterTokens.sort(sortType.value!.sortKey);
        return filterTokens;
      }
    }, [allTokens, sortType.value]);

    Widget list() {
      if (tokens.isEmpty) {
        return const AppEmpty(describe: 'No results found');
      }
      return ListView.builder(
        itemCount: tokens.length,
        itemBuilder: (BuildContext context, int index) {
          final token = tokens[index];

          return TokenItem(
            name: token.symbolName,
            volume: token.volume.handle().dollarValueParsed,
            price: token.lastPrice ?? Decimal.zero,
          );
        },
      );
    }

    Widget body = switch (ref.watch(allTokensRequestProvider)) {
      AsyncData(:final value) => list(),
      _ => Center(child: Container(),),
    };

    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: AppSearchInput(
              onChanged: (value) {
                content.value = value;
              },
            ),
          ),
          TitleWithSort(
            sortTypes: sortType.value,
            containerHorizontal: 16,
            onSortChanged: (sort) => sortType.value = sort,
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}