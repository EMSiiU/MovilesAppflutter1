import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';

class NotesDB{
  static final nameDB = "NOTESDB";
  static final versionDB = 1;

  //Conexion
  //el _ antepuesto a una variable indica que es privada. ? lo define como null
  static Database? _database;   

  //
  static Future <Database?> get database async{
      if(_database != null)
        return _database;
      return _database = await _initDatabase();
  }

  Future <Database> _initDatabase() async{
    Directory folder = await getApplicationDocumentsDirectory();
  }
}