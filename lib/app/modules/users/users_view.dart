import 'package:chat_app/app/data/models/index.dart';
import 'package:chat_app/app/modules/users/users_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../core/widgets/empty_data.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Friend List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .where("uid", isNotEqualTo: controller.uidOfCurrentUser.value)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              QuerySnapshot users = snapshot.data as QuerySnapshot;
              if (users.docs.isNotEmpty) {
                return ListView.builder(
                  itemCount: users.docs.length,
                  itemBuilder: (context, index) {
                    UsersModel user = UsersModel.fromJson(
                        users.docs[index].data() as Map<String, dynamic>);
                    return ListTile(
                      onTap: () {
                        controller.goToChatDetail(user);
                      },
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              user.avatar.toString(),
                            ),
                            radius: 30,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Icon(
                              Icons.circle,
                              size: 16,
                              color:
                                  user.isActive! ? Colors.green : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      title: Text(user.fullName.toString()),
                      subtitle: Text(user.email.toString()),
                      trailing: const Icon(Icons.navigate_next),
                    );
                  },
                );
              } else {
                return emptyData(
                  Assets.images.emptyData.path,
                  title: "You don't have Friend ! Make friend",
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
