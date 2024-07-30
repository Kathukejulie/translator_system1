import 'package:cloud_firestore/cloud_firestore.dart';

class TranslationProjectsDatabaseService {
  // Create a new document

  Future<void> createData(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection(_collection)
        .doc(data['id'])
        .set(data);
  }

  // Read a single document

  Future<DocumentSnapshot<Map<String, dynamic>>> readData(String id) async =>
      await FirebaseFirestore.instance.collection(_collection).doc(id).get();

  // Read all documents
 // Read all documents as a Future
  Future<List<Map<String, dynamic>>> getAllData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(_collection)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Stream<List<Map<String, dynamic>>> streamAllData() =>
      FirebaseFirestore.instance
          .collection(_collection)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      });

  // Update a document

  Future<void> updateData(Map<String, dynamic> data) async =>
      await FirebaseFirestore.instance
          .collection(_collection)
          .doc(data['id'])
          .update(data);

  // Delete a document

  Future<void> deleteData(String id) async {
    await FirebaseFirestore.instance.collection(_collection).doc(id).delete();
  }

  changeStatus({required bool status, required String documentId}) async =>
      await FirebaseFirestore.instance
          .collection(_collection)
          .doc(documentId)
          .update({"isComplete": status});

  String get _collection => "projects";
}
