import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../gen/assets.gen.dart';


class AppSearchInput extends HookWidget {
   AppSearchInput({
    super.key,
    this.onChanged,
    String? hintText,
    this.controller,
    this.size = 40,
    this.autoFocus = false,
    this.enable = true,
    this.hideIntro,
    this.onTap,
    this.radius,
    this.bgColor,
  }):hintText = hintText ?? "搜索";

  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final double size;
  final bool autoFocus;
  final bool enable;
  final VoidCallback? hideIntro;
  final VoidCallback? onTap;
  final double? radius;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // hideIntro?.call();
        // if (onTap != null) {
        //   onTap?.call();
        // } else {
        //   appRouter.push(ScreenPaths.search);
        // }
      },
      child: Container(
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8),
          color: Color(0xFFF2F2F2)
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          autofocus: autoFocus,
          enabled: enable,
          maxLines: 1,
          cursorColor: Colors.red,
          selectionControls: CupertinoTextSelectionControls(),
          contextMenuBuilder: (context, editableTextState) {
            final List<ContextMenuButtonItem> buttonItems =
                editableTextState.contextMenuButtonItems;
            return AdaptiveTextSelectionToolbar.buttonItems(
              anchors: editableTextState.contextMenuAnchors,
              buttonItems: buttonItems,
            );
          },
          // style: sty.text.t2Regular.copyWith(color: sty.colors.text1),
          decoration: InputDecoration(
            hintText: hintText,
            // hintStyle: sty.text.t2Regular.copyWith(color: sty.colors.text4,),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            // prefixIcon: Padding(
            //   padding: EdgeInsets.only(left: 12, right: 8,top: 10,bottom: 10),
            //   child: Assets.icons.search2
            //       .svg(width: 12, height: 12, color: sty.colors.text4),
            // ),
          ),
          onChanged: (value) {
            onChanged?.call(value);
          },
        ),
      ),
    );
  }
}
