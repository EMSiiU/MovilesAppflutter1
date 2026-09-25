import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/notes_db.dart';

class AddNoteScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  NotesDB? notesDB;

  @override
  void initState() {
    super.initState();
    notesDB = NotesDB();
  }

  @override
  Widget build(BuildContext context) {
    final conTitle = TextEditingController();
    final conContent = TextEditingController();
    final txtTitle = TextFormField(
      controller: conTitle,
    );
    final txtContent = TextFormField(
      controller: conTitle,
      maxLines: 8
    );
    final space = SizedBox(height: 5);
    final btnSave = ElevatedButton(
      onPressed: (){
        notesDB!.INSERT({
          "title" : conTitle.text,
          "content": conContent.text,
          "dateNote":"2026-09-25"
        }).then((value) { //revisar que el value es int. Si value > 0 entonces fue correcto
          if(value>0){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Note Created Successfuly"),
                duration: Duration(seconds: 3),
              )
            );
          }
        });
        Navigator.pop(context);
      }, 
      child: Text('Save Note')
    );

    return Scaffold(
      appBar: AppBar(title:Text('Insert Note')),
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