import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/widgets/common_checkbox_widget.dart';

class ReactiveCheckBox extends StatelessWidget {
  final bool Function() isChecked;
  final ValueChanged<dynamic> onChanged;
  final String text;
  final Color? checkBorderColor;

  const ReactiveCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.text,
    this.checkBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonCheckBox(
        isChecked: isChecked(),
        onChanged: onChanged,
        text: text,
        checkBorderColor: checkBorderColor ?? AppColors.instance.dark500,
        textColor: isChecked()
            ? AppColors.instance.primary
            : AppColors.instance.dark400,
      ),
    );
  }
}
