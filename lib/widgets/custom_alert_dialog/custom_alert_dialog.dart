import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_colors.dart';
import 'package:hirconn_app/gen/assets.gen.dart';


class CustomAlertDialog extends StatelessWidget {
  final String title;
  final Widget child;
  final double? dialogHeight;

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
    this.dialogHeight,
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
  bool get hasButtons => hasPrimary || hasSecondary;

  @override
  Widget build(BuildContext context) {
    final double maxHeight =
        dialogHeight ?? MediaQuery.of(context).size.height * 0.85;

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
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight, // ✅ always bounded so footer can stick
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max, // ✅ important
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

              /// Body (scrollable)
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: child,
                ),
              ),

              /// Footer buttons (sticky at bottom)
              if (hasButtons)
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                  child: _buildButtons(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
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

    return Row(
      children: [
        Expanded(
          child: CommonButton(
            titleText: secondaryButtonText!,
            onTap: onSecondaryPressed ?? () => Navigator.pop(context),
            buttonColor: secondaryButtonColor,
            titleColor: secondaryButtonTextColor,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: CommonButton(
            titleText: primaryButtonText!,
            onTap: onPrimaryPressed ?? () => Navigator.pop(context),
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
    bool? okButtonSticky,
    required BuildContext context,
    String title = '',
    required Widget content,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    bool isLogoVisible = false,
    String primaryButtonText = 'OK',
    VoidCallback? onPrimaryPressed,
    Color? titleBackgroundColor,
    Color? titleTextColor,
    Color? primaryButtonColor,
    Color? primaryButtonTextColor,
    bool barrierDismissible = true,
    double? logoSize, // <-- new optional parameter to control logo height/width
    double? dialogHeight, // <-- new optional parameter to control dialog height
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => CustomAlertDialog(
        title: title,
        dialogHeight: dialogHeight,
        primaryButtonText: primaryButtonText,
        onPrimaryPressed:
            onPrimaryPressed ?? () => Navigator.pop(context),
        titleBackgroundColor: titleBackgroundColor,
        titleTextColor: titleTextColor,
        primaryButtonColor: primaryButtonColor,
        primaryButtonTextColor: primaryButtonTextColor,
        child: Column(
          crossAxisAlignment:crossAxisAlignment ,
          mainAxisSize: MainAxisSize.min,
          children: [
            isLogoVisible
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        CommonImage(
                          src: Assets.logo.appLogo.path,
                          height: logoSize ?? 50,
                          width: logoSize ?? 50,
                        ),
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
    double? logoSize, // <-- new optional parameter to control logo height/width
    double? dialogHeight, // <-- new optional parameter to control dialog height
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => CustomAlertDialog(
        title: title,
        dialogHeight: dialogHeight,

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
                        CommonImage(
                          src: Assets.logo.appLogo.path,
                          height: logoSize ?? 50,
                          width: logoSize ?? 50,
                        ),
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

  /// 🔹 OK BUTTON INLINE AT END OF CONTENT
  ///
  /// This helper shows the dialog but places the OK button at the end of the
  /// scrollable content (inside the dialog body) instead of using the dialog's
  /// bottom button area. Useful when you want the button to follow the content.
  static void showOkButtonAtEndDialog({
     required BuildContext context,
     String title = '',
     required Widget content,
     bool isLogoVisible = false,
     String okButtonText = 'OK',
     VoidCallback? onOkPressed,
     Color? okButtonColor,
     Color? okButtonTextColor,
     bool barrierDismissible = true,
     double? logoSize,
     double? dialogHeight,
     bool okButtonSticky = false, // when true, show OK in dialog footer (sticky)
   }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        // If okButtonSticky is true, we place the OK button in the dialog's
        // footer by providing primaryButtonText/onPrimaryPressed. Otherwise
        // render the OK button as part of the content (existing behavior).
        if (okButtonSticky) {
          return CustomAlertDialog(
            title: title,
            dialogHeight: dialogHeight,
            primaryButtonText: okButtonText,
            onPrimaryPressed: onOkPressed ?? () => Navigator.pop(context),
            primaryButtonColor: okButtonColor,
            primaryButtonTextColor: okButtonTextColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLogoVisible)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        CommonImage(
                          src: Assets.logo.appLogo.path,
                          height: logoSize ?? 50,
                          width: logoSize ?? 50,
                        ),
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
                else
                  SizedBox.shrink(),
                content,
              ],
            ),
          );
        }

        // Non-sticky: Render the OK button inside the content (existing)
        return CustomAlertDialog(
          title: title,
          dialogHeight: dialogHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isLogoVisible)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      CommonImage(
                        src: Assets.logo.appLogo.path,
                        height: logoSize ?? 50,
                        width: logoSize ?? 50,
                      ),
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
              else
                SizedBox.shrink(),

              // the passed content
              content,

              // spacing and inline OK button at the end
              16.height,
              SizedBox(
                width: double.infinity,
                child: CommonButton(
                  titleText: okButtonText,
                  onTap: onOkPressed ?? () => Navigator.pop(context),
                  buttonColor: okButtonColor,
                  titleColor: okButtonTextColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
