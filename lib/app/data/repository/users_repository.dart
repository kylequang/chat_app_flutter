import 'package:chat_app/app/data/models/index.dart';
import 'package:chat_app/app/data/remote/users_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

abstract class UsersRepository {
  Future<List<UsersModel>> getUsersList(String uid);
  String getUidOfCurrentUser();
  Future<UsersModel?> getUserByUid(String uid);
  void updateActiveUser(String uid, bool status);
}

class UsersRepositoryImpl implements UsersRepository {
  final userDataSource = Get.find<UsersDataSource>();
  @override
  Future<List<UsersModel>> getUsersList(String uid) async {
    final usersRepository = Get.find<UsersDataSource>();
    QuerySnapshot data = await usersRepository.getUsersListForCurrentUser(uid);

    return data.docs
        .map((snap) => UsersModel.fromJson(snap.data() as Map<String, dynamic>))
        .toList();
  }

  @override
  String getUidOfCurrentUser() {
    final currentUser = userDataSource.getUidOfCurrentUser();
    return currentUser!.uid;
  }

  @override
  Future<UsersModel?> getUserByUid(String uid) async {
    UsersModel? userModel;

    final docSnap = await userDataSource.getCurrentUserByUid(uid);

    if (docSnap.data() != null) {
      userModel = UsersModel.fromJson(docSnap.data() as Map<String, dynamic>);
    }

    return userModel;
  }

  @override
  void updateActiveUser(String uid, bool status) {
    userDataSource.updateActiveUser(uid, status);
  }
}
