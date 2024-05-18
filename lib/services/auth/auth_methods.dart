import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evoltsoft/services/auth/auth_service.dart';
import 'package:evoltsoft/services/storage/storage_methods.dart';

class AuthMethods {
  final _user = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> submitDetails({
    required String fullName,
    required String userName,
    required String phoneNumber,
    required Uint8List file,
  }) async {
    String res = "error occured";
    try {
      if (fullName.isNotEmpty || userName.isNotEmpty || phoneNumber.isNotEmpty) {
        

        String photoURL =
            await StorageMethods().uploadImageToStorage('profilePic', file);

        await _firestore
            .collection('users')
            .doc(_user.getCurrentUser()!.uid)
            .set({
          "name": fullName,
          "uid": _user.getCurrentUser()!.uid,
          "userName": userName,
          "phoneNum": phoneNumber,
          'photoURL': photoURL,
        });
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
