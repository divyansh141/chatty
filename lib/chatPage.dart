import 'package:Chatty/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // var x = auth.currentUser.email;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chatty',
          style: TextStyle(color: Color(0xff37ebea)),
        ),
        leading: Image.asset(
          'assets/images/chatty_trans.png',
          scale: 10,
        ),
        backgroundColor: Color(0xff013a4a),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              try {
                await auth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
      backgroundColor: Color(0xff013a4a),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff3790ea),
        onPressed: () => Navigator.pushNamed(context, 'searchPage'),
        child: Icon(Icons.search),
      ),
      body: Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(color: Colors.white, fontSize: 34),
                  ),
                  Text(
                    auth.currentUser.email ?? 'Username',
                    style: TextStyle(color: Colors.white, fontSize: 34),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.amber,
                ),
                onPressed: () => Navigator.pushNamed(context, 'inbox'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
