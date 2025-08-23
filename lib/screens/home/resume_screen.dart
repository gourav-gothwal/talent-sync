import 'package:flutter/material.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  String? uploadedResume;

  void uploadResume() async {
    // Mock upload: In a real app, integrate file picker & Firebase Storage
    setState(() {
      uploadedResume = "My_Resume.pdf";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Resume uploaded successfully ✅")),
    );
  }

  void analyzeResume() {
    if (uploadedResume == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please upload a resume first ⚠️")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ResumeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            uploadedResume == null
                ? const Icon(Icons.picture_as_pdf, size: 100, color: Colors.grey)
                : Column(
              children: [
                const Icon(Icons.check_circle,
                    size: 100, color: Colors.green),
                const SizedBox(height: 8),
                Text(
                  uploadedResume!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: uploadResume,
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Resume"),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: analyzeResume,
              icon: const Icon(Icons.analytics),
              label: const Text("Analyze Resume"),
            ),
          ],
        ),
      ),
    );
  }
}
