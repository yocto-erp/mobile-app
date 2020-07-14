import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile/store/user_store.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final UserStore userStore = context.watch<UserStore>();
    return Observer(
        builder: (_) => AppBar(
              title: Text('${userStore.user != null ? userStore.user.getDisplayName() : ''}'),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  tooltip: 'User Profile',
                  onPressed: () {},
                ),
              ],
            ));
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
