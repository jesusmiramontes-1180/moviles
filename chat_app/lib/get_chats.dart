import 'package:chat_app/get_messages.dart';
import 'package:chat_app/new_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class GetChats extends StatelessWidget {
  GetChats({super.key});

  @override
  Widget build(BuildContext context) {
    String user = "user1";

    return Scaffold(
      appBar: AppBar(
        title: Text('Messenger 1998'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 450,
              width: 300,
              child: FirestoreListView(
                padding: EdgeInsets.symmetric(horizontal: 18),
                pageSize: 15,
                query: FirebaseFirestore.instance
                    .collection("chats")
                    .where("chatters", arrayContains: user),
                itemBuilder: (BuildContext context,
                    QueryDocumentSnapshot<Map<String, dynamic>> document) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          tileColor: Colors.amber,
                          title: Text("Chat ID: ${document.id}"),
                          subtitle: FirestoreQueryBuilder<Map<String, dynamic>>(
                            query: FirebaseFirestore.instance
                                .collection('chats/${document.id}/messages'),
                            builder: (context, snapshot, _) {
                              return Text(
                                  "Ultimo mensaje recibido el: ${document.data()["last_modified"].toDate()}\n${snapshot.docs.length} mensajes");
                            },
                          ),
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => GetMessages(
                                  chat_id: document.id,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Abrir chat",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewChat(),
                  ),
                );
              },
              color: Colors.blue,
              child: Text(
                "Crear nuevo chat",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemPublic {}
