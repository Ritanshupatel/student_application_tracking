class ApplicationModel {
  String id;
  String studentId;
  String universityName;
  int stage; // Stage from 1 to 5

  ApplicationModel({
    required this.id,
    required this.studentId,
    required this.universityName,
    required this.stage,
  });

  // Convert Firestore document to ApplicationModel
  factory ApplicationModel.fromMap(Map<String, dynamic> data, String id) {
    return ApplicationModel(
      id: id,
      studentId: data['studentId'] ?? '',
      universityName: data['universityName'] ?? '',
      stage: data['stage'] ?? 1,
    );
  }

  // Convert ApplicationModel to Map
  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'universityName': universityName,
      'stage': stage,
    };
  }
}
