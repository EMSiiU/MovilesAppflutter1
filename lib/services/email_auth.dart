import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future <bool> createUser({required String email, required String password}) async{
    try{
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      credentials.user!.sendEmailVerification();
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }

    Future <bool> loginUser({required String email, required String password}) async{
    try{
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      
      if(credentials.user!.emailVerified){
        return true;
      }
      return false;
    }catch(e){
      return false;
    }
  }
}
