import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class GetMessages extends StatelessWidget {
  final String chat_id;

  const GetMessages({
    super.key,
    required this.chat_id,
  });

  Widget avatar_draw(String user_id, document) {
    if (document.data()["sender_id"] == user_id) {
      return ListTile(
        tileColor: Colors.amber,
        title: Text("${document.data()["content"]}"),
        subtitle: Text("${document.data()["sender_name"]}"),
        leading: CircleAvatar(
          child: Text("${document.data()["sender_name"].toString()[0]}"),
        ),
      );
    } else {
      return ListTile(
        tileColor: Colors.amber,
        title: Text("${document.data()["content"]}"),
        subtitle: Text("${document.data()["sender_name"]}"),
        trailing: CircleAvatar(
          child: Text("${document.data()["sender_name"].toString()[0]}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var new_message_text = TextEditingController();

    String user_id = "user1";
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensajes'),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 500,
                width: 300,
                child: FirestoreListView(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  pageSize: 15,
                  query: FirebaseFirestore.instance
                      .collection("chats/${chat_id}/messages")
                      .orderBy("created_at"),
                  itemBuilder: (BuildContext context,
                      QueryDocumentSnapshot<Map<String, dynamic>> document) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: avatar_draw(user_id, document),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: new_message_text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Escriba aqui...'),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  var new_message = <String, dynamic>{
                    "content": new_message_text.text,
                    "created_at": DateTime.now(),
                    "sender_id": "user1",
                    "sender_name": "Alejandro Sotelo",
                  };

                  await FirebaseFirestore.instance
                      .collection("chats/${chat_id}/messages")
                      .add(new_message);

                  await FirebaseFirestore.instance
                      .collection("chats")
                      .doc(chat_id)
                      .update({"last_modified": DateTime.now()});
                },
                color: Colors.blue,
                child: Text("Enviar"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
