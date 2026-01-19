import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/gen/assets.gen.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final Widget child; // ✅ required middle content

  final String? primaryButtonText;
  final VoidCallback? onPrimaryPressed;

  final String? secondaryButtonText;
  final VoidCallback? onSecondaryPressed;

  final Color? titleBackgroundColor;
  final Color? titleTextColor;
  final Color? primaryButtonColor;
  final Color? secondaryButtonColor;
  final Color? primaryButtonTextColor;
  final Color? secondaryButtonTextColor;

  const CustomAlertDialog({
    super.key,
    this.title = '',
    required this.child,
    this.primaryButtonText,
    this.onPrimaryPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.titleBackgroundColor,
    this.titleTextColor,
    this.primaryButtonColor,
    this.secondaryButtonColor,
    this.primaryButtonTextColor,
    this.secondaryButtonTextColor,
  });

  bool get hasPrimary => primaryButtonText != null;
  bool get hasSecondary => secondaryButtonText != null;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 0.86.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Title
            if (title.isNotEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: titleBackgroundColor ?? const Color(0xFF1771B7),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12.r),
                  ),
                ),
                child: CommonText(
                  text: title,
                  textAlign: TextAlign.center,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  textColor: titleTextColor ?? Colors.white,
                ),
              ),

            /// Middle content (required)
            Padding(
              padding: EdgeInsets.all(16.w),
              child: child,
            ),

            /// Buttons
            if (hasPrimary || hasSecondary)
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                child: _buildButtons(context),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    // 🔹 Only one button → centered
    if (hasPrimary && !hasSecondary) {
      return Center(
        child: CommonButton(
          titleText: primaryButtonText!,
          onTap: onPrimaryPressed ?? () => Navigator.pop(context),
          buttonColor: primaryButtonColor,
          titleColor: primaryButtonTextColor,
        ),
      );
    }

    if (!hasPrimary && hasSecondary) {
      return Center(
        child: CommonButton(
          titleText: secondaryButtonText!,
          onTap: onSecondaryPressed ?? () => Navigator.pop(context),
          buttonColor: secondaryButtonColor,
          titleColor: secondaryButtonTextColor,
        ),
      );
    }

    // 🔹 Two buttons → spaced apart
    return Row(
      children: [
        Expanded(
          child: CommonButton(
            titleText: secondaryButtonText!,
            onTap: onSecondaryPressed,
            buttonColor: secondaryButtonColor,
            titleColor: secondaryButtonTextColor,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: CommonButton(
            titleText: primaryButtonText!,
            onTap: onPrimaryPressed,
            buttonColor: primaryButtonColor,
            titleColor: primaryButtonTextColor,
          ),
        ),
      ],
    );
  }
}

class ShowCustomDialog {
  /// 🔹 ONE BUTTON DIALOG
  static void showOneButtonDialog({
    required BuildContext context,
    String title = '',
    required Widget content,
    bool isLogoVisible = false,
    String primaryButtonText = 'OK',
    VoidCallback? onPrimaryPressed,
    Color? titleBackgroundColor,
    Color? titleTextColor,
    Color? primaryButtonColor,
    Color? primaryButtonTextColor,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => CustomAlertDialog(
        title: title,
        primaryButtonText: primaryButtonText,
        onPrimaryPressed:
        onPrimaryPressed ?? () => Navigator.pop(context),
        titleBackgroundColor: titleBackgroundColor,
        titleTextColor: titleTextColor,
        primaryButtonColor: primaryButtonColor,
        primaryButtonTextColor: primaryButtonTextColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isLogoVisible
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        CommonImage(src: Assets.logo.appLogo.path, height: 50, width: 50),
                        6.height,
                        CommonText(
                          text: 'Hirconn',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.instance.primary,
                        ),
                        16.height,
                      ],
                    ),
                  )
                : SizedBox.shrink(),
            content,
          ],
        ),
      ),
    );
  }

  /// 🔹 TWO BUTTON DIALOG
  static void showTwoButtonDialog({
    required BuildContext context,
    String title = '',
    required Widget content,

    required String primaryButtonText,
    required String secondaryButtonText,

    VoidCallback? onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
    bool isLogoVisible = false,
    Color? titleBackgroundColor,
    Color? titleTextColor,
    Color? primaryButtonColor,
    Color? secondaryButtonColor,
    Color? primaryButtonTextColor,
    Color? secondaryButtonTextColor,

    bool barrierDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => CustomAlertDialog(
        title: title,

        primaryButtonText: primaryButtonText,
        secondaryButtonText: secondaryButtonText,

        onPrimaryPressed:
        onPrimaryPressed ?? () => Navigator.pop(context),
        onSecondaryPressed:
        onSecondaryPressed ?? () => Navigator.pop(context),

        titleBackgroundColor: titleBackgroundColor,
        titleTextColor: titleTextColor,
        primaryButtonColor: primaryButtonColor,
        secondaryButtonColor: secondaryButtonColor,
        primaryButtonTextColor: primaryButtonTextColor,
        secondaryButtonTextColor: secondaryButtonTextColor,
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isLogoVisible
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        CommonImage(src: Assets.logo.appLogo.path, height: 50, width: 50),
                        6.height,
                        CommonText(
                          text: 'Hirconn',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.instance.primary,
                        ),
                        16.height,
                      ],
                    ),
                  )
                : SizedBox.shrink(),
            content,
          ],
        ),
      ),
    );
  }
}
