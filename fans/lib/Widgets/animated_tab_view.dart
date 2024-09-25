import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedTabView extends StatefulHookConsumerWidget {
  AnimatedTabView({
    Key? key,
    required this.tabs,
    required this.pages,
    this.titleActions = const [],
    this.isScrollable = true,
    this.labelColor,
    this.labelStyle,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.indicatorColor,
    this.indicatorSize = TabBarIndicatorSize.tab,
    this.initialIndex,
    this.isHideBottomLine = false,
    this.indicatorHeight,
    this.onChanged,
    this.onTabSelect,
    this.physics,
    this.indicatorBottomPadding,
  })  : assert(tabs.length == pages.length),
        super(key: key);

  final List<Widget> tabs;
  final List<Widget> pages;
  final List<Widget> titleActions;
  final bool isScrollable;
  late Color? labelColor;
  late TextStyle? labelStyle;
  late Color? unselectedLabelColor;
  late TextStyle? unselectedLabelStyle;
  final Color? indicatorColor;
  final TabBarIndicatorSize indicatorSize;
  final int? initialIndex;
  final ValueChanged<int>? onChanged;
  final ValueChanged<int>? onTabSelect;
  final bool isHideBottomLine;
  late double? indicatorHeight;
  final ScrollPhysics? physics;
  final double? indicatorBottomPadding;

  @override
  _AnimatedTabViewState createState() => _AnimatedTabViewState();
}

class _AnimatedTabViewState extends ConsumerState<AnimatedTabView> with TickerProviderStateMixin {

  late TabController _tabController;
  double padding = 10.0;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex ?? 0;
    _tabController = TabController(length: widget.tabs.length, vsync: this, initialIndex: widget.initialIndex ?? 0);
    _tabController.addListener(() {
        if(!_tabController.indexIsChanging) {
          widget.onTabSelect?.call(_tabController.index);
          setState(() {
            selectedIndex = _tabController.index;
          });
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          margin: EdgeInsets.only(left: 16-padding, right: 16),
          child: Row(
            children: [
              Expanded(
                child: TabBar(
                  isScrollable: widget.isScrollable,
                  physics: widget.physics ?? const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  labelColor: widget.labelColor ?? const Color(0xFF121212),
                  labelStyle: widget.labelStyle ?? const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'CupertinoSystemDisplay',
                    letterSpacing: -0.48,
                    height: 1.3,
                  ),
                  unselectedLabelColor: widget.unselectedLabelColor ?? const Color(0xFF121212).withOpacity(0.4),
                  unselectedLabelStyle: widget.unselectedLabelStyle ?? const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'CupertinoSystemDisplay',
                    letterSpacing: -0.384,
                    height: 1.3,
                  ),
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  indicatorColor: widget.indicatorColor ?? const Color(0xFF121212),
                  indicatorSize: widget.indicatorSize,
                  indicator: RoundedIndicator(indicatorPadding: padding, indicatorHeight: widget.indicatorHeight ?? 2.0),
                  indicatorPadding: EdgeInsets.only(top: 0, bottom: widget.indicatorBottomPadding ?? -13),
                  labelPadding: EdgeInsets.symmetric(horizontal: padding),
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  tabs: widget.tabs,
                ),
              ),
              if (widget.titleActions.isNotEmpty && widget.titleActions.length > selectedIndex)
                widget.titleActions[selectedIndex]
            ],
          ),
        ),
        widget.isHideBottomLine ? const SizedBox() : Container(height: 1, color: const Color(0xFFF2F2F2), margin: const EdgeInsets.symmetric(horizontal: 16)),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.pages,
          ),
        ),
      ],
    );
  }
}
class RoundedIndicator extends Decoration {
  const RoundedIndicator({
    required this.indicatorPadding,
    required this.indicatorHeight,
  });

  final double indicatorPadding;
  final double indicatorHeight;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _RoundedIndicatorPainter(this, onChanged!, indicatorPadding, indicatorHeight);
  }
}

class _RoundedIndicatorPainter extends BoxPainter {
  final Paint _paint;

  _RoundedIndicatorPainter(this.decoration, VoidCallback onChanged, this.padding, this.indicatorHeight)
      : assert(decoration != null),
        _paint = Paint()
          ..color = const Color(0xFF121212)
          ..style = PaintingStyle.fill;

  final RoundedIndicator decoration;
  final double padding;
  final double indicatorHeight;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Rect indicatorRect = Rect.fromLTWH(rect.left + padding, rect.bottom - indicatorHeight, rect.width - padding*2, indicatorHeight);
    RRect rRect = RRect.fromRectAndCorners(indicatorRect,
        topLeft: const Radius.circular(10.0),
        topRight: const Radius.circular(10.0),
        bottomLeft: const Radius.circular(10.0),
        bottomRight: const Radius.circular(10.0));
    canvas.drawRRect(rRect, _paint);
  }
}