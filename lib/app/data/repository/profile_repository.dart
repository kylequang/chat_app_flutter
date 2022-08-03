import 'package:chat_app/app/data/models/index.dart';
import 'package:get/get.dart';

import '../remote/profile_data_source.dart';

abstract class ProfileRepository {
  Future<void> addUser(UsersModel userData);

  Future<void> addUserWithID(UsersModel userData, String id);

  Future<void> updateUser(UsersModel userData);

  Future<void> deleteUser(String documentId);

  Future<bool> checkIfDocExists(String documentId);

  // Future<List<UsersModel>> retrieveUsers();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final _profileDataSource = Get.find<ProfileDataSource>();

  @override
  Future<void> addUser(UsersModel userData) {
    return _profileDataSource.addUser(userData);
  }

  @override
  Future<void> addUserWithID(UsersModel userData, String id) {
    return _profileDataSource.addUserWithID(userData, id);
  }

  @override
  Future<void> updateUser(UsersModel userData) {
    return _profileDataSource.updateUser(userData);
  }

  @override
  Future<void> deleteUser(String documentId) async {
    _profileDataSource.deleteUser(documentId);
  }

  // @override
  // Future<List<UsersModel>> retrieveUsers() {
  //   return _profileDataSource.retrieveUsers();
  // }

  @override
  Future<bool> checkIfDocExists(String documentId) {
    return _profileDataSource.checkIfDocExists(documentId);
  }
}
