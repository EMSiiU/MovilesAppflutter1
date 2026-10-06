// 28-08-2026
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/global_values.dart';
import 'package:flutter_application_1/components/theme_app.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/screens/add_note_screen.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/notes_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  //build con valueListener para cambiar de tema dinámicamente
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.banTheme,
      builder: (context,value , _) {

        ThemeData tema = ThemeData.light();
        switch(value){
          case 0: tema = ThemeData.dark(); break;
          case 1: tema = ThemeData.light(); break;
          case 2: tema = ThemeApp.warmTheme(); break;
        }

        return MaterialApp(
          routes: {
            "/dash" :(context) => DashboardScreen(),
            "/note" : (context) => NotesScreen(),
            "/add" : (context) => AddNoteScreen(),
            "/register" : (context) => RegisterScreen()
          },
          theme: tema,
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: LoginScreen(),
        );
      }
    );
  }
}