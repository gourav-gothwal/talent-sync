import 'package:flutter/material.dart';
import 'package:talent_sync/models/job.dart';
import 'job_details_screen.dart';

class SavedJobsScreen extends StatefulWidget {
  const SavedJobsScreen({super.key});

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  // Use Job model instead of Map
  List<Job> savedJobs = [
    Job(
      id: "1",
      title: "Flutter Developer",
      company: "TechCorp",
      location: "Remote",
      salary: "₹8 LPA",
      description: "We are looking for a Flutter developer with 2+ years of experience.",
      applyUrl: "https://example.com/apply/flutter",
    ),
    Job(
      id: "2",
      title: "Data Scientist",
      company: "AI Labs",
      location: "Bangalore, India",
      salary: "₹12 LPA",
      description: "Work with large datasets and build AI/ML solutions for business problems.",
      applyUrl: "https://example.com/apply/datascientist",
    ),
  ];

  void removeJob(int index) {
    setState(() {
      savedJobs.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Job removed from saved list ❌")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Jobs"),
      ),
      body: savedJobs.isEmpty
          ? const Center(
        child: Text(
          "No saved jobs yet 📭",
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: savedJobs.length,
        itemBuilder: (context, index) {
          final job = savedJobs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(job.title),
              subtitle: Text("${job.company} • ${job.location}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => removeJob(index),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => JobDetailsScreen(job: job),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
