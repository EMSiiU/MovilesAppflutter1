import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/firestore_note.dart';

class AddNoteScreenCloud extends StatefulWidget {
  const new({super.key});

  @override
  State<AddNoteScreenCloud> createState() => _AddNoteScreenCloudState();
}

class _AddNoteScreenCloudState extends State<AddNoteScreenCloud> {
  FirestoreNotes? notesDB;
  final conTitle = TextEditingController();
  final conContent = TextEditingController();
  //NotesDAO? note;
  Map<String, dynamic>? note;

  @override
  void initState() {
    super.initState();
    notesDB = FirestoreNotes();
  }

  @override
  Widget build(BuildContext context) {


    //recuperar el objeto de la otra pantalla (notes_screen) para editarlo
    if(ModalRoute.of(context)!.settings.arguments != null){
      note = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      conTitle.text = note!["title"];
      conContent.text = note!["content"];
    }


    final txtTitle = TextFormField(
      controller: conTitle,
      decoration: InputDecoration(
        labelText: 'Title', 
        prefixIcon: Icon(Icons.title)
      ),
    );
    final txtContent = TextFormField(
      controller: conContent,
      maxLines: 3,
      decoration: InputDecoration(
        labelText: 'Content', 
        prefixIcon: Icon(Icons.text_rotate_vertical_sharp)
      ),
    );
    final space = SizedBox(height: 5);
    final btnSave = ElevatedButton(
      onPressed: (){
        if(note == null){
          notesDB!.insertNote({
            "title" : conTitle.text,
            "content": conContent.text,
            "dateNote":"2026-09-25"
          }).then((value) { //revisar que el value es int. Si value > 0 entonces fue correcto
            if(value){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Note Created Successfuly"),
                  duration: Duration(seconds: 3),
                )
              );
              Navigator.pop(context);
            }
          });
        }else{
          notesDB!.updateNote({
            "idNote" : note!["idNote"],
            "title" : conTitle.text,
            "content" : conContent.text
          }, note!["idNote"]).then((value){
            if(value){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Note Edited Successfuly"),
                  duration: Duration(seconds: 3),
                )
              );
              Navigator.pop(context);
            }
          });
        }

      }, 
      child: Text('Save Note')
    );

    return Scaffold(
      appBar: AppBar(title:Text('Insert Note Cloud')),
      body: Column(
        children: [
          txtTitle,
          space,
          txtContent,
          space,
          btnSave
        ],
      ),
    );
  }
}