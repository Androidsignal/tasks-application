import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/device_points.dart';
import 'package:task_list_app/pages/tasks/_view/task_detail_view.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_list_view.dart';

import '../../../service/network_service.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkData = ref.watch(networkServiceProvider);
    return Row(
      children: [
        TaskListView(),
        SizedBox(
          width: DevicePoints.isSmallScreen(context) ? 0 : 4,
        ),
        if (!DevicePoints.isSmallScreen(context)) Expanded(child: TaskDetailView(id: networkData.taskDetail?.id??'',))
      ],
    );
  }
}
