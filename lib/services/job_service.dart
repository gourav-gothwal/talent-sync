import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/job.dart';

class JobService {
  final CollectionReference jobsCollection =
  FirebaseFirestore.instance.collection('jobs');

  // Add new job
  Future<void> addJob(Job job) async {
    try {
      await jobsCollection.add(job.toMap());
    } catch (e) {
      throw Exception("Failed to add job: $e");
    }
  }

  // Get all jobs (stream for realtime updates)
  Stream<List<Job>> getJobs() {
    return jobsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Job.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Get a single job by ID
  Future<Job?> getJobById(String id) async {
    try {
      DocumentSnapshot doc = await jobsCollection.doc(id).get();
      if (doc.exists) {
        return Job.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }
      return null;
    } catch (e) {
      throw Exception("Failed to fetch job: $e");
    }
  }

  // Update job
  Future<void> updateJob(String id, Job job) async {
    try {
      await jobsCollection.doc(id).update(job.toMap());
    } catch (e) {
      throw Exception("Failed to update job: $e");
    }
  }

  // Delete job
  Future<void> deleteJob(String id) async {
    try {
      await jobsCollection.doc(id).delete();
    } catch (e) {
      throw Exception("Failed to delete job: $e");
    }
  }
}
