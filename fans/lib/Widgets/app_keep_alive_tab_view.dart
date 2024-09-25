import 'package:flutter/cupertino.dart';

class AppKeepAliveTabView extends StatefulWidget {
  const AppKeepAliveTabView({super.key, required this.child});

  final Widget child;

  @override
  State<AppKeepAliveTabView> createState() => _AppKeepAliveTabViewState();
}

class _AppKeepAliveTabViewState extends State<AppKeepAliveTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
