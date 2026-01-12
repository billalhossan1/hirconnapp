import 'package:flutter/foundation.dart';

import '../utils/error_log.dart';

class ApiConstant {
  ApiConstant._privateConstructor();
  static final ApiConstant _instance = ApiConstant._privateConstructor();
  static ApiConstant get instance => _instance;

  //app use base
  final String domain = _getDomain();
  final String baseUrl = "${_getDomain()}/api/v1";
  final String refreshToken = "";
  final String imageBaseUrl = "https://";
}

String _getDomain() {
  String liveServer = "https://";
  String localServer = "https://";



  try {
    if (kDebugMode) {
      localServer;
      // return localServer;
    }
    return liveServer;
  } catch (e) {
    errorLog("_getDomain", e);
    return liveServer;
  }
}
