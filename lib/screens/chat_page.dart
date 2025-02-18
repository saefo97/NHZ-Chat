import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nhzchat/components/loading_screen.dart';
import 'package:provider/provider.dart';

import '../auth_service.dart';
import '../theme_provider.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  TextEditingController messageController = TextEditingController();

  final AuthService _authService = AuthService();

  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        title: Text("NHZ Chat"),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 36.0,
            ),
            ListTile(
              leading: Icon(Icons.sunny),
              trailing: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                 return Switch(
                    activeColor: Colors.blue.shade900,
                    thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                          (Set<WidgetState> states) {
                        if (isSwitched) {
                          return Icon(Icons.nightlight_round, color: Colors.orange.shade700);
                        } else {
                          return Icon(Icons.sunny, color: Colors.orange.shade700);
                        }
                      },
                    ),
                    value: themeProvider.isDarkMode,
                    onChanged: (val) {
                      themeProvider.toggleTheme();
                    },
                  );
                },
              ),
              title: Text("Dark Theme"),),
            ListTile(
              onTap: () async {
                await _authService.signOut();
              },
              title: Text("Sign Out"),
              leading: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('messages')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: LoadingScreen());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("لا توجد رسائل بعد 😃"));
          }
          return ListView.builder(
            reverse: true,
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 74.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var message = snapshot.data!.docs[index];
              String textMessage = message['text'];

              return Container(
                padding: EdgeInsets.only(bottom: 6.5),
                alignment:
                    message['email'] == FirebaseAuth.instance.currentUser?.email
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: message['email'] ==
                      FirebaseAuth.instance.currentUser?.email
                      ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width*3/4
                      ),
                      padding: EdgeInsets.all(10.0),
                      decoration: message['email'] ==
                              FirebaseAuth.instance.currentUser?.email
                          ? BoxDecoration(
                              color: Colors.blue.shade700,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(18.0),
                                topLeft: Radius.circular(18.0),
                                topRight: Radius.circular(18.0),
                              ),
                            )
                          : BoxDecoration(
                              color: Colors.blue.shade200,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.0),
                                topRight: Radius.circular(18.0),
                                bottomRight: Radius.circular(18.0),
                              )),
                      child: Text(
                        textMessage,
                        style: TextStyle(
                            color: message['email'] ==
                                    FirebaseAuth.instance.currentUser?.email
                                ? Colors.white
                                : Colors.blue.shade900,
                            fontSize: 16),
                      ),
                    ),
                    Text(message['email'],
                    style: TextStyle(
                      fontSize: 10.0,
                      color: message['email'] ==
                          FirebaseAuth.instance.currentUser?.email
                          ? Colors.purple : Colors.deepPurple
                    ),

                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: messageController,
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(hintText: "Message"),
              ),
            ),
            SizedBox(
              width: 18.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(100.0)),
              child: IconButton(
                  onPressed: () {
                    if (!messageController.text.isEmpty) {
                      FirebaseFirestore.instance.collection('messages').add({
                        'text': messageController.text.trim(),
                        'email': FirebaseAuth.instance.currentUser?.email,
                        'time': Timestamp.now()
                      });
                      print("hi");
                      messageController.clear();
                    }
                  },
                  color: Colors.white,
                  icon: Icon(Icons.send)),
            ),
          ],
        ),
      ),
    );
  }
}

// ListView(
// padding: EdgeInsets.all(8.0),
// children: [
//
// Align(
// alignment: Alignment.centerRight,
// child: Container(
// padding: EdgeInsets.all(10.0),
// decoration: BoxDecoration(
// color: Colors.blue.shade700,
// borderRadius: BorderRadius.only(
// bottomLeft:  Radius.circular(18.0),
// topLeft:  Radius.circular(18.0),
// topRight:  Radius.circular(18.0),
// )
// ),
// child: Text("BYE",
// style: TextStyle(
// color: Colors.white
// ),
// )),
// ),
// Align(
// alignment: Alignment.centerLeft,
// child: Container(
// padding: EdgeInsets.all(10.0),
// decoration: BoxDecoration(
// color: Colors.blue.shade200,
// borderRadius: BorderRadius.only(
// topLeft:  Radius.circular(18.0),
// topRight:  Radius.circular(18.0),
// bottomRight: Radius.circular(18.0),
//
// )
// ),
// child: Text("HI",
// )),
// ),
//
// ],
// ),
