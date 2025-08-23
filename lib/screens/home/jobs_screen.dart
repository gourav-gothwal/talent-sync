import 'package:flutter/material.dart';
import 'package:talent_sync/models/job.dart';
import 'package:talent_sync/services/job_service.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Jobs")),
      body: StreamBuilder<List<Job>>(
        stream: JobService().getJobs(), // returns Stream<List<Job>>
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No jobs found"));
          }

          final jobs = snapshot.data!;
          return ListView.builder(
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              final job = jobs[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                elevation: 3,
                child: ListTile(
                  leading: const Icon(Icons.work, color: Colors.indigo),
                  title: Text(job.title),
                  subtitle: Text(job.company),
                  trailing: Text(job.location,
                      style: const TextStyle(color: Colors.grey)),
                  onTap: () => _showJobDetails(context, job),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showJobDetails(BuildContext context, Job job) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(job.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Company: ${job.company}"),
            Text("Location: ${job.location}"),
            const SizedBox(height: 10),
            const Text("Description:"),
            Text(job.description),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Applied Successfully ✅")),
              );
            },
            child: const Text("Apply"),
          ),
        ],
      ),
    );
  }
}
