import 'package:flutter/material.dart';
import 'package:talent_sync/models/job.dart';

class JobDetailsScreen extends StatelessWidget {
  final Job job;

  const JobDetailsScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title.isNotEmpty ? job.title : "Job Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.title.isNotEmpty ? job.title : "Job Title",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.business, size: 18, color: Colors.indigo),
                const SizedBox(width: 6),
                Text(
                  job.company.isNotEmpty ? job.company : "Company",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.location_on, size: 18, color: Colors.red),
                const SizedBox(width: 6),
                Text(
                  job.location.isNotEmpty ? job.location : "Location",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Divider(height: 30),
            const Text(
              "Job Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              job.description.isNotEmpty
                  ? job.description
                  : "No description provided for this job. Please contact the company for details.",
              style: const TextStyle(fontSize: 15),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("Apply Now"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Applied Successfully ✅"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
