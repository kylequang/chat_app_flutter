import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UsersDataSource {
  Future<QuerySnapshot<Map>> getUsersListForCurrentUser(String uid);
  Future<DocumentSnapshot> getCurrentUserByUid(String uid);
  User? getUidOfCurrentUser();
  void updateActiveUser(String uid, bool status);
}

class UsersDataSourceImpl implements UsersDataSource {
  @override
  Future<QuerySnapshot<Map>> getUsersListForCurrentUser(String uid) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('uid', isNotEqualTo: uid)
        .get();
  }

  @override
  Future<DocumentSnapshot> getCurrentUserByUid(String uid) async {
    return await FirebaseFirestore.instance.collection('users').doc(uid).get();
  }

  @override
  User? getUidOfCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  @override
  void updateActiveUser(String uid, bool status) {
    print('run updateActiveUser data source');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'isActive': status});
  }
}
