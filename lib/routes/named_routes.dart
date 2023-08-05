import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/routes/navigate.dart';


import '../pages/tasks/_view/task_detail_view.dart';

class NamedRoutes {
  static final NamedRoutes _singleton = NamedRoutes._internal();

  NamedRoutes._internal();

  factory NamedRoutes() {
    return _singleton;
  }

  static ValueNotifier<dynamic> changeListener = ValueNotifier(null);

  // The route configuration.
  final GoRouter router = GoRouter(
    refreshListenable: changeListener,
    navigatorKey: Navigate.navigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        name: '/',
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: 'tasks',
        path: '/tasks',
        builder: (context, state) => const TasksPage(),
      ),
      GoRoute(
        name: 'taskDetails',
        path: '/tasks/:id',
        builder: (context, state) =>  TaskDetailView(id: state.pathParameters['id']??''),
      ),
    ],
  );
}

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No data found'),
      ),
    );
  }
}
