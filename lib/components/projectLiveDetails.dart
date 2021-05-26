import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProjectsLiveDetails extends StatelessWidget {
  final int projectId;

  ProjectsLiveDetails(this.projectId);

  @override
  Widget build(BuildContext context) {
    // get the course document using a stream


    Stream<DocumentSnapshot> docStream = FirebaseFirestore.instance.collection('_projects_data').doc('project_' + projectId.toString()).snapshots();

    return StreamBuilder<DocumentSnapshot>(
        stream: docStream,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var documentMap = snapshot.data.data();
            //List documentList = documentMap.keys;
            if (documentMap == null) {
              return Center(
                child: Text('error loading data'),
              );
            }

            return Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(documentMap['title'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text('Invitation Codes:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text('916597 - Alice'),
                    Text('126534 - Bob'),
                    Text('579861 - Carol'),
                    Text('192833 - Diana'),
                    Text('784962 - Ella'),
                    Text('369598 - George'),

/*                    SizedBox(height: 20),
                    Text('Welcome Text:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text(documentMap['description']),*/

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text('Starts: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        Text('15.01.2021 12:00'),
                      ],
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text('Ends: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        Text('19.01.2021 12:00'),
                      ],
                    ),

                    SizedBox(height: 20),

                    RaisedButton(onPressed: (){}, child: Text('export JSON', style: TextStyle(color: Colors.white),), color: Colors.blue,)
                  ],
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
