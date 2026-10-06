import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    //SEPARADO
    final spaceY = SizedBox(height: 10,);
    
    //Create elements
    final txtEmail = TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
        hintText: 'example@email.com'
      ),
    );

    final txtPassword = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      ),
    );

    final btnRegister = ElevatedButton(
      onPressed: (){

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