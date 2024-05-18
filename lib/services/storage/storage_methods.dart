import 'dart:typed_data';
import 'package:evoltsoft/services/auth/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final _user = AuthService();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref =
        _storage.ref().child(childName).child(_user.getCurrentUser()!.uid);

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }
}
