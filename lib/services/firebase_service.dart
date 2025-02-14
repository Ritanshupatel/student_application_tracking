import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_application_tracking/models/application_model.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetch application status from Firestore
  Future<ApplicationModel?> getApplicationStatus(String studentId) async {
    var snapshot = await _db
        .collection('applications')
        .where('studentId', isEqualTo: studentId)
        .get();

    if (snapshot.docs.isNotEmpty) {
      var doc = snapshot.docs.first;
      return ApplicationModel.fromMap(doc.data(), doc.id);
    }
    return null;
  }

  // Update application stage
  Future<void> updateApplicationStage(String applicationId, int newStage) async {
    await _db.collection('applications').doc(applicationId).update({
      'stage': newStage,
    });
  }
}
