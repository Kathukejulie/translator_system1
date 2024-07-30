import 'package:cloud_firestore/cloud_firestore.dart';

class ContractsDatabaseService {
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

  Stream<List<Map<String, dynamic>>> readAllData() => FirebaseFirestore.instance
          .collection(_collection)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      });

  // Update a document

  Future<void> updateData(Map<String, dynamic> data, String contractId) async {
    await FirebaseFirestore.instance
        .collection(_collection)
        .doc(contractId)
        .update(data);
  }

  // Delete a document

  Future<void> deleteData(String id) async {
    await FirebaseFirestore.instance.collection(_collection).doc(id).delete();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> readDataByProjectId(
      String projectId) async {
    return await FirebaseFirestore.instance
        .collection(_collection)
        .where('projectId', isEqualTo: projectId)
        .limit(1)
        .get();
  }

  String get _collection => "contracts";
}
