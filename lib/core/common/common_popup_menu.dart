import 'package:flutter/material.dart';

import '../../utils/app_size.dart';

class CommonPopupMenu extends StatefulWidget {
  const CommonPopupMenu({
    required this.items,
    required this.onItemSelected,
    super.key,
    this.icons,
    this.initialText,
    this.textStyle,
    this.showTextTrigger = true,
    this.showIconTrigger = false,
    this.triggerIcon = Icons.more_vert,
    this.onPrimaryColor,
    this.primaryColor,
  }) : assert(
         icons == null || icons.length == items.length,
         'If icons are provided, they must match the length of items',
       );
  final List<String> items;
  final List<IconData>? icons;
  final void Function(String selectedItem) onItemSelected;
  final String? initialText;
  final TextStyle? textStyle;
  final bool showTextTrigger; // show main button with text
  final bool showIconTrigger; // show icon trigger
  final IconData triggerIcon;
  final Color? onPrimaryColor;
  final Color? primaryColor;

  @override
  State<CommonPopupMenu> createState() => _SelectablePopupMenuState();
}

class _SelectablePopupMenuState extends State<CommonPopupMenu> {
  String? selectedText;

  @override
  void initState() {
    super.initState();
    selectedText = widget.initialText ?? widget.items.first;
  }

  Future<void> _showPopupMenu(BuildContext context, GlobalKey key) async {
    final button = key.currentContext!.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final position = button.localToGlobal(Offset.zero, ancestor: overlay);

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + button.size.height,
        position.dx + button.size.width,
        position.dy,
      ),
      color: widget.primaryColor ?? Colors.white,
      shadowColor: Colors.grey,
      items: List.generate(widget.items.length, (index) {
        return PopupMenuItem<String>(
          value: widget.items[index],
          child: Row(
            children: [
              if (widget.icons != null) Icon(widget.icons![index], size: AppSize.width(value: 18)),
              if (widget.icons != null) SizedBox(width: AppSize.width(value: 8)),
              Text(widget.items[index]),
            ],
          ),
        );
      }),
    );

    if (selected != null) {
      setState(() {
        selectedText = selected;
      });
      widget.onItemSelected(selected);
    }
  }

  final GlobalKey _textTriggerKey = GlobalKey();
  final GlobalKey _iconTriggerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showTextTrigger)
          GestureDetector(
            key: _textTriggerKey,
            onTap: () => _showPopupMenu(context, _textTriggerKey),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width(value: 12),
                vertical: AppSize.width(value: 10),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    selectedText ?? '',
                    style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(width: AppSize.width(value: 8)),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        if (widget.showIconTrigger)
          IconButton(
            key: _iconTriggerKey,
            icon: Icon(widget.triggerIcon),
            onPressed: () => _showPopupMenu(context, _iconTriggerKey),
          ),
      ],
    );
  }
}
