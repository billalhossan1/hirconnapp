import 'package:core_kit/core_kit.dart';
import 'package:core_kit/initializer.dart';
import 'package:core_kit/network/dio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirconn_app/constant/app_assert_icons.dart';
import 'package:hirconn_app/constant/app_assert_svg.dart';
import 'package:hirconn_app/routes/app_routes.dart';
import 'package:hirconn_app/routes/app_routes_file.dart';
import 'package:hirconn_app/utils/app_size.dart';
import 'package:hirconn_app/utils/app_theme.dart';

import 'constant/app_api_end_point.dart';
import 'core/getx/getx_custome_observer.dart';

GlobalKey<NavigatorState>? appNavigatorStateKey = GlobalKey<NavigatorState>();

class MainEntryApp extends StatelessWidget {
  const MainEntryApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return GetMaterialApp(
      navigatorObservers: [NavigationObserver()],
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.zoom,
      initialRoute: AppRoutes.instance.initial,
      getPages: appRootRoutesFile,
      theme: appThemeData,

      themeMode: ThemeMode.light,
      enableLog: true,
      defaultGlobalState: true,
      transitionDuration: const Duration(microseconds: 100),
      navigatorKey: appNavigatorStateKey,
      builder: (context, child) {
        return CoreKit.init(
          backButton: CommonImage(src: AppAssertIcons.instance.backIcon),
          back: () {
            Get.back();
          },
          designSize: const Size(428, 926),
          imageBaseUrl: ApiConstant.instance.imageBaseUrl,
          navigatorKey: Get.key,
          dioServiceConfig: DioServiceConfig(
            baseUrl: ApiConstant.instance.baseUrl,
            refreshTokenEndpoint: ApiConstant.instance.refreshToken,
            onLogout: () {
              // StorageService().removeTokens();
              // Get.offAllNamed(AppRoute.splashscreen);
            },
            enableDebugLogs: kDebugMode,
          ),
          tokenProvider: TokenProvider(
            accessToken: () async => '',
            refreshToken: () async => '',
            updateTokens: (data) async {
              // if (data['accessToken'] != null) {
              //   StorageService().saveAccessToken(data['accessToken']);
              // }
            },

          ),
          child: child,
        );
      },
    );
  }
}
