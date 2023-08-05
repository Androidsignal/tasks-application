import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/task.dart';

final localizationProvider = ChangeNotifierProvider.autoDispose<Localization>((ref) {
  return Localization();
});

class Localization extends ChangeNotifier {
  Locale _locale = Locale('en','US');

  Locale get locale => _locale;

  set locale(Locale val) {
    _locale = val;
    notifyListeners();
  }
}
