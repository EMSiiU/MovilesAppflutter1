import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreNotes{
  FirebaseFirestore conn = FirebaseFirestore.instance;
  CollectionReference? notesCollection;
  FirestoreNotes(){
    notesCollection = conn.collection("notes");
  }

  Stream <QuerySnapshot> selectNote(){
    return notesCollection!.snapshots();
  }
  
  insertNote(Map <String, dynamic> note) async {
    notesCollection!.doc().set(note);
  }

  deletetNote(String id) async {
    notesCollection!.doc(id).delete();
  }

  updateNote(Map <String, dynamic> note, String id) async {
    notesCollection!.doc(id).update(note);
  }
}