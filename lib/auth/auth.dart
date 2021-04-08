import 'package:firebase_auth/firebase_auth.dart';
import 'package:prototype/shared/database.dart';

class UserData{
  final String uid;

  UserData({this.uid});
}

class AuthService{
final FirebaseAuth _auth = FirebaseAuth.instance;

UserData _userFromFirebase(User user){
  return user != null ? UserData(uid: user.uid) : null;
}


//sing in with email and pass
Future signInWithEmailandPass(String email, String password) async {
  try{
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    print (user.uid);
    return _userFromFirebase(user);
  }catch(e){
    print(e);
  }
}

Future registerWithEmailandPass(String email, String password) async{
  try{
    UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    Map<String, dynamic> userInfoMap = {
      "email" : user.email,
      //"username": user.email.replaceAll("@", "")
    };
    DatabaseMethod().addUserDataBase(user.uid, userInfoMap);
    return _userFromFirebase(user);
  }catch(e){
    print(e);
  }
}

}