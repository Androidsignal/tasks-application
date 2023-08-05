import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:task_list_app/localization/app_localization.dart';
import 'package:task_list_app/service/localization_service.dart';

import 'routes/named_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale locale = ref.watch(localizationProvider).locale;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: NamedRoutes().router,
      title: 'Task list App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      supportedLocales: <Locale>[
        Locale('en','US'),
        Locale('ar','AE'),
      ],
      locale: locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ApplicationLocalizationsDelegate(),
      ],
    );
  }
}
