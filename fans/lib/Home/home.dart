import 'package:fans/Home/all_tab.dart';
import 'package:fans/Home/feature_tab.dart';
import 'package:fans/Home/spot_tab.dart';
import 'package:fans/Widgets/animated_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fans/Widgets/app_keep_alive_tab_view.dart';

class HomePage extends HookConsumerWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: AnimatedTabView(
        initialIndex: 0,
        tabs: const [
          Text('ALL'),
          Text('SPOT'),
          Text('FUTURES'),
        ],
        pages: const [
          AppKeepAliveTabView(child: AllTab()),
          AppKeepAliveTabView(child: SpotTab()),
          AppKeepAliveTabView(child: FeatureTab())
        ],
      ),
    );
  }
}
