import 'dart:async';
import 'dart:io';

import 'package:flutter_application_1/database/notes_dao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class NotesDB{
  static final nameDB = "NOTESDB";
  static final versionDB = 1;

  //Conexion
  //el _ antepuesto a una variable indica que es privada. ? lo define como null
  static Database? _database;   

  // Si existe se recupera y si no existe se llama 
  Future <Database?> get database async{
      if(_database != null)
        return _database;
      return _database = await _initDatabase();
  }

  Future <Database> _initDatabase() async{
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB); //Ruta + nameDB. Metodo join permite unir 2 variables
    
    //generar conexión
    return openDatabase(
      pathDB, 
      version: versionDB,
      onCreate: createTables //donde se crea las tablas (no la bd)
    );
  }

  //Funcion para generar tablas
  FutureOr<void> createTables(Database db, int version) {
    String query = '''
      CREATE TABLE tblNotes(
        idNote INTEGER PRIMARY KEY,
        title VARCHAR(35),
        content TEXT,
        dateNote CHAR(10)
      )
      ''';
      db.execute(query);
  }

  //Metodos del CRUD
  Future<int> INSERT(Map<String, dynamic> note) async{
    //ver si existe la conexión
    var conexion = await database;
    return conexion!.insert("tblNotes", note);
  }
  Future<int> UPDATE(Map<String, dynamic> note) async{
    var conexion = await database;
    return conexion!.update("tblNotes", note, where: "idNote = ?", whereArgs: [note['idNote']]);

  }
  Future<int> DELETE(int idNote) async{
    var conexion = await database;
    return conexion!.delete("tblNotes", where: "idNote = ?", whereArgs: [idNote]);
  }


  Future<List<NotesDAO>> SELECT() async{
    var conexion = await database;
    final res = await conexion!.query("tblNotes"); //regresa una lista
    //el return es una lista de objetos -> List<NotesDAO> list
    return res.map((note) => NotesDAO.fromMap(note)).toList();  //recorre la lista y se mete al dao donde regresa map, se debe de convertir a lista
  }
}