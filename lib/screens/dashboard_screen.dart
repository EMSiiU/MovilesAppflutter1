import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ),
            ListTile(
              title: Text('Cambiar tema'),
              subtitle: Text("Claro / Oscuro"),
              leading: Icon(Icons.light_mode_outlined),
              trailing: Icon(Icons.chevron_right),
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

      //body: Image.asset('assets/lamar-franklin.gif'),
    );
  }
}