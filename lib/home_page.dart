import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/app_navigation_bar.dart';
import 'package:task_list_app/localization/keys.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/service/localization_service.dart';

import 'common/app_style.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale locale = ref.watch(localizationProvider).locale;
    return Scaffold(
      backgroundColor: AppStyle.lightTextColor,
      appBar: AppBar(
        title: Text(Keys.appName.tr()),
        backgroundColor: AppStyle.mediumBlue,
        actions: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            elevation: 0,
            child: DropdownButton(
              padding: EdgeInsets.all(8),
              underline: Container(),
              value: locale,
              style: Theme.of(context).textTheme.titleMedium,
              items: [
                DropdownMenuItem(
                  value: Locale('en','US'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('ar','AE'),
                  child: Text('Arabic'),
                ),
              ],
              onChanged: (val) {
                if(val != null) {
                  ref.watch(localizationProvider).locale = val;
                }
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: AppNavigationBar(),
      ),
      body: TasksPage(),
    );
  }
}
