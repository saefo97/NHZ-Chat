import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  List<String>  m= ["Hello", "Block","BYE"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text("NHZ Chat"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: m.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(bottom: 6.5),
            alignment: Alignment.centerRight,
            child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18.0),
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0),
                    )),
                child: Text(
                  m[index],
                  style: TextStyle(color: Colors.white),
                )),
          );
        },
      ),
      bottomNavigationBar: Container(
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
                      // TODO: Save to FB
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
