import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/email_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //crear contorladores
  final conEmail = TextEditingController();
  final conPassword = TextEditingController();
  
  EmailAuth? _emailAuth;
  @override
  void initState() {
    super.initState();
    _emailAuth = EmailAuth();
  }
  @override
  Widget build(BuildContext context) {
    //SEPARADORES
    final spaceY = SizedBox(height: 10,);
    
    //Create elements

    final txtEmail = TextFormField(
      controller: conEmail,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
        hintText: 'example@email.com',
        prefixIcon: Icon(Icons.email)
      ),
    );

    final txtPassword = TextFormField(
      controller: conPassword,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
        prefixIcon: Icon(Icons.password)
      ),
    );

    final btnRegister = ElevatedButton(
      onPressed: (){
        _emailAuth!.createUser(email: conEmail.text, password: conPassword.text).then((value) {
          if(value){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("User Registred Successfuly!"),
                duration: Duration(seconds: 3),
              )
            );
          Navigator.pop(context);
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Something was wrong. Try again!"),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.red),
            );
          }
        });
      }, 
      child: Text('Register')
    );

  
    return Scaffold(
      appBar: AppBar(title: Text('Create an Account')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              txtEmail,
              spaceY,
              txtPassword,
              spaceY,
              btnRegister
            ],
          ),
        ),
        ),
    );
  }
}