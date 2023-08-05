
import '../routes/navigate.dart';
import 'app_localization.dart';

class Keys {
  static const String appName = 'Demo app';
  static const String tasks = 'tasks';
  static const String projects = 'projects';
  static const String teams = 'teams';
}

extension CustomTranslation on String {
  String tr() {
    var context = Navigate.navigatorKey.currentState?.context;
    if (context != null) {
      return ApplicationLocalizations.of(context)?.translate(this) ?? this;
    }
    return this;
  }
}
