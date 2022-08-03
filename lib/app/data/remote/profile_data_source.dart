import 'package:chat_app/app/data/models/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ProfileDataSource {
  Future<DocumentReference> addUser(UsersModel userData);

  Future<void> addUserWithID(UsersModel userData, String id);

  Future<void> updateUser(UsersModel userData);

  Future<void> deleteUser(String documentId);

  Future<bool> checkIfDocExists(String documentId);

  // Future<List<UsersModel>> retrieveUsers();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final collectionPath = "users";

  @override
  Future<DocumentReference> addUser(UsersModel userData) {
    return _db.collection(collectionPath).add(userData.toJson());
  }

  @override
  Future<void> addUserWithID(UsersModel userData, String id) async {
    await _db.collection(collectionPath).doc(id).set(userData.toJson());
  }

  @override
  Future<void> deleteUser(String documentId) async {
    await _db.collection(collectionPath).doc(documentId).delete();
  }

  // @override
  // Future<List<UsersModel>> retrieveUsers() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //       await _db.collection(collectionPath).get();
  //   return snapshot.docs
  //       .map((docSnapshot) => UsersModel.fromDocumentSnapshot(docSnapshot))
  //       .toList();
  // }

  @override
  Future<void> updateUser(UsersModel userData) async {
    await _db.collection(collectionPath).doc(userData.id).update(
          userData.toJson(),
        );
  }

  @override
  Future<bool> checkIfDocExists(String documentId) {
    return _db
        .collection(collectionPath)
        .doc(documentId)
        .get()
        .then((value) => value.exists);
  }
}
