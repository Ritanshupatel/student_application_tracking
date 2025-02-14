import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationProvider with ChangeNotifier {
  int applicationStage = 1;

  Future<void> fetchApplicationStatus(String userId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('applications').doc(userId).get();
    if (doc.exists) {
      applicationStage = doc['stage'];
      notifyListeners();
    }
  }
}
