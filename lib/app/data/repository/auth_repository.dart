import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../remote/auth_data_source.dart';

abstract class AuthRepository {
  Future<UserCredential> register(String email, String password);

  Future<UserCredential> login(String email, String password);
  Future<void> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  final _authDataSource = Get.find<AuthDataSource>();

  @override
  Future<UserCredential> login(String email, String password) async {
    return await _authDataSource.login(email, password);
  }

  @override
  Future<void> logout() async {
    await _authDataSource.logout();
  }

  @override
  Future<UserCredential> register(String email, String password) async {
    return await _authDataSource.register(email, password);
  }
}
