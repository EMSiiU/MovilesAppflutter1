import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future <void> createUser({required String email, required String password}) async{
    try{
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      credentials.user!.sendEmailVerification();
    }catch(e){
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
