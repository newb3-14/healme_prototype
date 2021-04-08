import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  //adding user info to cloud firestore
  Future addUserDataBase(
      String userid, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userid)
        .set(userInfoMap);
  }
}
