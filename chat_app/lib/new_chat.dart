import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewChat extends StatelessWidget {
  NewChat({super.key});

  String user1 = "user1", user2 = "user2";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Chat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Crear nuevo chat entre\nuser1 y user2",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                var new_chat = <String, dynamic>{
                  "chatters": ["user1", "user2"],
                  "created_at": DateTime.now(),
                  "last_modified": DateTime.now(),
                };

                var chat = await FirebaseFirestore.instance
                    .collection('chats')
                    .add(new_chat);

                var new_message = <String, dynamic>{
                  "content": "Esta es una prueba",
                  "created_at": DateTime.now(),
                  "sender_id": "system",
                  "sender_name": "Sistema",
                };
                await FirebaseFirestore.instance
                    .collection("chats/${chat.id}/messages")
                    .add(new_message);
              },
              child: Text(
                "Crear Chat",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
