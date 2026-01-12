// /*
//  * @Author: Km Muzahid
//  * @Date: 2025-12-27 14:42:47
//  * @Email: km.muzahid@gmail.com
//  */
// import 'dart:io';
//
// import 'package:core_kit/text/common_text.dart';
// import 'package:flutter/material.dart';
//
// import '../../../constant/app_colors.dart';
//
// class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final bool isCenter;
//   final List<Widget> actions;
//   final void Function()? onTap;
//   final bool disableBack;
//
//   const CommonAppBar({
//     super.key,
//     this.title = '',
//     this.isCenter = true,
//     this.actions = const [],
//     this.onTap,
//     this.disableBack = false
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//
//       title: CommonText(text: title, textColor: AppColors.instance.primary, maxLines: 1, fontSize: 16),
//       centerTitle: isCenter,
//       actions: actions,
//       leading: icon(),
//     );
//   }
//
//   Widget? icon() {
//     return Platform.isIOS
//         ? null
//         : Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: disableBack
//                 ? const SizedBox.shrink()
//                 : disableBack?null:GestureDetector(
//               onTap: onTap,
//                   child: Icon(
//                                 Icons.arrow_back,
//                                 color: AppColors.instance.primary,
//                               ),
//                 ),
//           );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
