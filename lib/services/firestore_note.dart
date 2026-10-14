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
  
  Future<bool> insertNote(Map <String, dynamic> note) async {
    try{
      notesCollection!.doc().set(note);
      return true;
    }catch(e){
      print(e);
      return false;
    }  
  }

  Future<bool> deletetNote(String id) async {
    try{
      notesCollection!.doc(id).delete();
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }

  Future<bool> updateNote(Map <String, dynamic> note, String id) async {
    try{
      notesCollection!.doc(id).update(note);
      return true;
    }catch(e){
      print(e);
      return false;
    }
    
  }
}