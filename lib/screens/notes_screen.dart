import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database/notes_db.dart';

class NotesScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  //crear objeto para las operaciones
  NotesDB? notesDB;

  @override
  void initState() {
    super.initState();
    notesDB = NotesDB();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        leading: Container(), //quitar el volver default
      ),
      endDrawer:Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Emilio Zuñiga"), 
              accountEmail: Text("Emilio@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/avatarCJ.jpg'), //Imagen local
                //backgroundImage:NetworkImage("https://i.pravatar.cc/300") //imagen de internet
              ),  
            ),
            ListTile(
              title: Text('Practica 1 (titulo)'),
              subtitle: Text("App de práctica (subtitulo)"),
              leading: Icon(Icons.check),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, "/dash");
              },
            ),
            ListTile(
              title: Text('Lista de Notas'),
              subtitle: Text("App Notes"),
              leading: Icon(Icons.notes),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, "/note");
              },
            ),
            ListTile(
              title: Text('Cerrar sesión'),
              subtitle: Text("Salir del sistema"),
              leading: Icon(Icons.logout),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/");
              }
            )
          ],
        ),
      ),

      //futurebuilder ejecuta la petición en segundo plano (el future) y espera para construir (el builder) si termina correctamente
      // hay un tercer estado que es "en ejecución", además del "exitoso" y "fallido"

      body: FutureBuilder(
        future: notesDB!.SELECT(),  
        builder: (context, snapshot) { //snapshot -> trae la lista de objetos
          if(snapshot.hasData){
            //lista que se va a estar autoincrementando para mostrar las notas
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                return Text(snapshot.data![index].title!);
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
}