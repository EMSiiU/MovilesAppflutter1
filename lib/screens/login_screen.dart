import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/email_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controladores
  final conEmail = TextEditingController();
  final conPassword = TextEditingController();
  EmailAuth? _emailAuth;

  @override
  void initState() {
    super.initState();
    _emailAuth = EmailAuth();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    //SEPARADORES
    final spaceX = Container(width: 5,);
    final spaceY = SizedBox(height: 5,);

    final txtEmail = TextFormField(
      controller: conEmail,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder()
      ),
    );

    final txtPwd = TextFormField(
      controller: conPassword,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder()
      ),
    );

    final loading = Positioned(
      top: 160,
      child: CircularProgressIndicator()
    );

    final btnLogin = ElevatedButton(
      onPressed: (){
        isLoading = !isLoading;
        setState(() {});
        _emailAuth!.loginUser(email: conEmail.text, password: conPassword.text).then((value) {
          if(value){
            Navigator.pushNamed(context, "/dash");
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Something was wrong. Try again!"),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.red),
            );
          }
          isLoading = false;
          setState(() {});
        });
      }, 
      child: Row(
        children: [
          Icon(Icons.login),
          spaceX,
          Text('Login')
        ],
      )
    );

    final btnRegister = ElevatedButton(
      onPressed: (){
        Navigator.pushNamed(context, "/register");
      }, 
      child: Row(
        children: [
          Icon(Icons.person_add),
          spaceX,
          Text('Register')
        ],
      )
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/verticalGTA.jpg')
          ),
        ),
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset('assets/GTA6Logo.png', height: 170,),
            Positioned(
              bottom: 40,
              child: Container(
                padding: EdgeInsets.all(15),
                height:260,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 135, 0, 0.658),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  children: [
                    txtEmail,
                    spaceY,
                    txtPwd,
                    Divider(),
                    btnLogin,
                    btnRegister,
                  ],
                ),
              ),
            ),
            isLoading ? loading : Container()
            
          ],
        ),
      )
    );
  }
}