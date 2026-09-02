import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    //SEPARADORES
    final spaceX = Container(width: 5,);
    final spaceY = SizedBox(height: 5,);

    final txtUser = TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),
    );
    final txtPwd = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),
    );

    final loading = Positioned(
      top: 160,
      child: CircularProgressIndicator()
    );

    final btnLogin = ElevatedButton(
      onPressed: (){
        setState(() {isLoading = !isLoading;});
        Future.delayed(Duration(seconds: 4)).then((value) { 
          Navigator.pushNamed(context, "/dash");
          isLoading = false;
          setState(() {});
        });
        
      }, 
      child: Row(
        children: [
          Icon(Icons.login),
          spaceX,
          Text('Iniciar Sesión')
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
            Image.asset('assets/GTA6Logo.png', height: 200,),
            Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.all(15),
                height: 211,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 135, 0, 0.658),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  children: [
                    txtUser,
                    spaceY,
                    txtPwd,
                    Divider(),
                    btnLogin
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