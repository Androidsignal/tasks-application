class LocaleKeys {
  static final LocaleKeys _singleton = LocaleKeys._internal();

  LocaleKeys._internal();

  factory LocaleKeys() {
    return _singleton;
  }

  static const String strTasks = 'strTasks';
  static const String strTeams = 'strTeams';
  static const String strProjects = 'strProjects';
}
