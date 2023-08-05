import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../common/app_style.dart';
import '../../../model/task.dart';
import '../../../service/network_service.dart';

class TaskDetailView extends ConsumerWidget {
  final String id;
  const TaskDetailView({super.key,this.id = ''});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<Task> taskData = ref.watch(networkServiceProvider).getTasks();
    Task? task;
    int i =taskData.indexWhere((element) => element.id == id);
    if(i > -1){
      task = taskData.elementAt(i);
    }
    if(task == null){
      return SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 20,
        leading: SizedBox(
          width: 0,
        ),
        title: Text(task.title ?? "", style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 2,
              color: AppStyle.mediumBlue,
            ),
            SizedBox(height: 20),
            Text(
              DateFormat('dd/MM – kk:mm').format(
                task?.dateTime ?? DateTime.now(),
              ),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey
              ),
            ),
            SizedBox(height: 10),
            Text(
              task?.description ?? "",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5
              ),
            ),
          ],
        ),
      ),
    );
  }
}
