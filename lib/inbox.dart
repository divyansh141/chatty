import 'package:Chatty/databaseHandle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  TextEditingController msgController = TextEditingController();

  // sendMessage() {
  //   if (msgController.text.isNotEmpty) {
  //     Map<String, String> messageMap = {
  //       "message": msgController.text,
  //       "sender": FirebaseAuth.instance.currentUser.email,
  //     };
  //     DatabaseMethods.getMessages(chatRoomId, messageMap);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage('assets/images/chatty_trans.png'),
        ),
        title: Text('Username'),
        backgroundColor: Color(0xff013a4a),
      ),
      backgroundColor: Color(0xff013a4a),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.81,
              color: Colors.transparent,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(24),
                shape: BoxShape.rectangle,
              ),
              child: TextField(
                controller: msgController,
                cursorColor: Color(0xff37ebea),
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.keyboard, color: Colors.white),
                  suffixIcon: Icon(Icons.send, color: Color(0xff37ebea)),
                  hintText: 'Type a message',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
