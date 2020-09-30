import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  searchUser(String username) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
  }

  getMessages(String chatRoomId, messageMap) {
    FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chats')
        .add(messageMap)
        .catchError((e) {
      print(e);
    });
  }
}
