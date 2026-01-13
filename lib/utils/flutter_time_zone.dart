import 'dart:async';
import 'package:flutter_timezone/flutter_timezone.dart' as tz;

///
/// Class for getting the native timezone.
///
class FlutterTimezone {
  ///
  /// Returns local timezone from the native layer.
  ///
  static Future<String> getLocalTimezone() async {
    final localTimezone = await tz.FlutterTimezone.getLocalTimezone();
    return localTimezone;
  }

  ///
  /// Gets the list of available timezones from the native layer.
  ///
  static Future<List<String>> getAvailableTimezones() async {
    final availableTimezones = await tz.FlutterTimezone.getAvailableTimezones();
    return availableTimezones;
  }
}


