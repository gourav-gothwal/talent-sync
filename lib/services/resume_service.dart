import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/resume_result.dart';

class ResumeService {
  final String apiUrl = "https://your-api-endpoint.com/resume"; // replace with your API

  // Upload resume file and get screening results
  Future<ResumeResult> uploadResumeAndGetResult(String filePath) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(apiUrl));
      request.files.add(await http.MultipartFile.fromPath('resume', filePath));

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        final Map<String, dynamic> jsonResponse = json.decode(responseData);

        return ResumeResult.fromMap(jsonResponse);
      } else {
        throw Exception("Failed to get resume result. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error uploading resume: $e");
    }
  }

  // Direct API call with raw text
  Future<ResumeResult> analyzeResumeText(String resumeText) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"resumeText": resumeText}),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return ResumeResult.fromMap(jsonResponse);
      } else {
        throw Exception("Failed to analyze resume. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error analyzing resume: $e");
    }
  }
}
