import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfoData {
  
  final CollectionReference _collection =
      Firestore.instance.collection("users");

  static String premiumuser = "0";
  
  Future upLoadUserData(String username, String phno, String country , String password) async {
    //phno
    return await _collection
        .document(phno)
        .setData({'UserName': username, 'PhoneNo': phno, 'Country': country , "Password" : password , "Premium" : premiumuser});
  }
}
