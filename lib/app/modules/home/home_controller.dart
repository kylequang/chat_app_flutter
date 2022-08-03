import 'package:chat_app/app/modules/account/account_view.dart';
import 'package:chat_app/app/modules/chats/chat_view.dart';
import 'package:chat_app/app/modules/users/users_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../data/repository/users_repository.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  final usersRepo = Get.find<UsersRepository>();
  RxInt selectIndexPage = 0.obs;
  List<Widget> listPage = const [
    ChatView(),
    UsersView(),
    AccountView(),
  ];

  void onTapIndexPage(int index) {
    selectIndexPage.value = index;
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    usersRepo.updateActiveUser(usersRepo.getUidOfCurrentUser(), true);
    super.onInit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        usersRepo.updateActiveUser(usersRepo.getUidOfCurrentUser(), true);
        break;
      case AppLifecycleState.inactive:
        usersRepo.updateActiveUser(usersRepo.getUidOfCurrentUser(), false);
        break;
      case AppLifecycleState.paused:
        usersRepo.updateActiveUser(usersRepo.getUidOfCurrentUser(), false);
        break;
      default:
        break;
    }
  }
}
