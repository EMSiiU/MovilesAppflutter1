import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {

    final txtTitle = TextFormField();
    final txtContent = TextFormField();
    final space = SizedBox(height: 5);
    final btnSave = ElevatedButton(
      onPressed: (){}, 
      child: Text('Save Note')
    );

    return Scaffold(
      appBar: AppBar(title:Text('Insertar Nota')),
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