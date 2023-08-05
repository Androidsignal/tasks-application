import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/routes/navigate.dart';

import '../../../common/app_style.dart';
import '../../../common/device_points.dart';
import '../../../service/network_service.dart';

class TaskListView extends ConsumerWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkData = ref.watch(networkServiceProvider);
    var list = networkData.getTasks();
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 20,
          leading: SizedBox(
            width: 0,
          ),
          title: Text('Tasks', style: Theme.of(context).textTheme.titleLarge),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Divider(
                thickness: 2,
                color: AppStyle.mediumBlue,
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppStyle.lightTextColor),
                    child: ListTile(
                      onTap: () {
                        networkData.taskDetail = list[index];

                        if (DevicePoints.isSmallScreen(context)) {
                          Navigate.toNamed('/tasks/${list[index].id ?? ''}');
                        }
                      },
                      tileColor: Colors.transparent,
                      title: Text(
                        list[index].title ?? "",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: networkData.taskDetail?.id == list[index].id ? FontWeight.w600 : FontWeight.w200,
                            ),
                      ),
                      trailing: Text(
                        DateFormat('dd/MM – kk:mm').format(
                          list[index].dateTime ?? DateTime.now(),
                        ),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  itemCount: list.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
