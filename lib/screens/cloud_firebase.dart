import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecludeapp/collectionRoute/collection_route.dart';
import 'package:firebasecludeapp/const/constant.dart';
import 'package:flutter/material.dart';

class DatabaseCloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud fireStore'),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              // userCollection
              //     .add({'name': 'hii', 'address': 'surat'})
              //     .then((value) => print('add success'))
              //     .catchError((e) => print(e));

              // userCollection
              //     .add({
              //       'name12': 'hardik',
              //       'address': 'surat',
              //     })
              //     .then((value) => print('add Success'))
              //     .catchError((e) => print('Error ===>>> $e'));

              //   userCollection
              //       .add({
              //         'name': 'test1',
              //         'address': 'surat',
              //         'list': [10, 20, 30]
              //       })
              //       .then((value) => print('add success'))
              //       .catchError((e) => print(e));
              // },
            },
            child: Text('Add'),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: userCollection.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<DocumentSnapshot> docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${docs[index].get('name')}'),
                    subtitle: Text('${docs[index].get('address')}'),
                    trailing: IconButton(
                      onPressed: () {
                        userCollection
                            .doc(docs[index].id)
                            .delete()
                            .then((value) => print('delete success'))
                            .catchError((e) {
                          print('delete Error $e');
                        });
                        userCollection
                            .doc('hKFu0EStgXZnjRiAEc48')
                            .update({'name': 'helloddf'})
                            .then((value) => print('success'))
                            .catchError((e) => print(e));
                        userCollection
                            .doc(kFirebaseAuth.currentUser!.uid)
                            .set({
                              'name': 'test1',
                              'address': 'surat',
                              'list': [10, 20, 30]
                            })
                            .then((value) => print('add success'))
                            .catchError((e) => print(e));
                      },
                      icon: Icon(Icons.cancel),
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
