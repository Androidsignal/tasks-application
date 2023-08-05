import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/localization/keys.dart';
import 'package:task_list_app/service/network_service.dart';

import 'localization/appLocalizations.dart';

class AppNavigationBar extends ConsumerWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var networkServiceProviderRef = ref.watch(networkServiceProvider);
    return Container(
      decoration: BoxDecoration(color: AppStyle.darkBlue, borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) => _NavigationBarListItem(
          isSelected: networkServiceProviderRef.navigatorItemIndex == index,
          item: navigationBarItems[index],
          onTap: () {
            networkServiceProviderRef.navigatorItemIndex = index;
          },
        ),
        separatorBuilder: (context, index) => Divider(
          color: AppStyle.mediumBlue,
          height: 1,
          endIndent: 16,
          indent: 16,
        ),
      ),
    );
  }
}

class _NavigationBarListItem extends StatelessWidget {
  const _NavigationBarListItem({
    Key? key,
    required this.item,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);
  final NavigationBarItem item;
  final bool isSelected;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppStyle.selectionColor : null,
        borderRadius: BorderRadius.circular(isSelected ? 40 : 0),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          item.name.tr(),
          style: TextStyle(
            color: AppStyle.lightTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

final navigationBarItems = [
  NavigationBarItem(name: Keys.tasks, url: 'tasks'),
  NavigationBarItem(name: Keys.projects, url: 'projects'),
  NavigationBarItem(name: Keys.teams, url: 'teams'),
];

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
