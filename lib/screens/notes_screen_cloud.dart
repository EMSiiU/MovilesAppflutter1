import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database/notes_dao.dart';
import 'package:flutter_application_1/database/notes_db.dart';
import 'package:flutter_application_1/services/firestore_note.dart';

class NotesScreenCloud extends StatefulWidget {
  const new({super.key});

  @override
  State<NotesScreenCloud> createState() => _NotesScreenCloudState();
}

class _NotesScreenCloudState extends State<NotesScreenCloud> {
  //crear objeto para las operaciones
  FirestoreNotes? _firestoreNotes;

  @override
  void initState() {
    super.initState();
    _firestoreNotes = FirestoreNotes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: Text('Notes List'),
        //leading: Container(), //quitar el volver default
      ),
      body: StreamBuilder(
        stream: _firestoreNotes!.selectNote(),  
        builder: (context, snapshot) { //snapshot -> trae la lista de objetos
          if(snapshot.hasData){
            //lista que se va a estar autoincrementando para mostrar las notas
            return ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, index){
                return ItemNote(snapshot.data!.docs[index]);
              }
            );
          }else{
            if(snapshot.hasError){
              return Center(child: Text('Algo salió mal, no trae datos'));
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.note_add),
        onPressed: ()=> Navigator.pushNamed(context, "/add").then((value){
          setState(() {});
        })
      ),
    );
  }

  Widget ItemNote(QueryDocumentSnapshot<Object?> note){
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Center(child: Text('10')),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(note.get("title")),
                  Text(note.get("content"), maxLines: 2, overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
            IconButton(onPressed: () {
              Navigator.pushNamed(context, '/add', arguments: note).then((value){
                setState(() {});
              });
            }, icon: Icon(Icons.edit)),
            IconButton(onPressed: ()async{
              return showDialog(context: context, builder: (context) =>_buildAlertDialog(note.id));
            }, icon: Icon(Icons.delete))
          ],
        ),
      )
    );
  }

  Widget _buildAlertDialog(String idNote) {
    return AlertDialog(
      title: Text('System Alert'),
      content:
          Text("Are you sure you want delete the note? :)"),
      actions: [
        TextButton(
            child: Text("Accept"),
            onPressed: () {
              // notesDB!.DELETE(idNote).then((value){
              //   String msg = (value == 1) ? "Note deleted successfuly" : "Something was wrong"; 
                
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       content: Text(msg),
              //       duration: Duration(seconds: 3),
              //     )
              //   );
              // });
              // Navigator.of(context).pop();
              // setState(() {});
              
            }),

        TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}