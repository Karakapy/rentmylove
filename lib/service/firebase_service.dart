import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{
  late FirebaseFirestore _firestore;

  Future<void> initializeFirebase() async {
    _firestore = FirebaseFirestore.instance;
  }

  FirebaseFirestore getFirestore() {
    return _firestore;
  }

}

final firebaseService = FirebaseService();
