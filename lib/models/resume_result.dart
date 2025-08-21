class ResumeResult {
  final double matchPercentage;
  final List<String> missingSkills;
  final String feedback;

  ResumeResult({
    required this.matchPercentage,
    required this.missingSkills,
    required this.feedback,
  });

  factory ResumeResult.fromMap(Map<String, dynamic> data) {
    return ResumeResult(
      matchPercentage: (data['matchPercentage'] ?? 0).toDouble(),
      missingSkills: List<String>.from(data['missingSkills'] ?? []),
      feedback: data['feedback'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'matchPercentage': matchPercentage,
      'missingSkills': missingSkills,
      'feedback': feedback,
    };
  }
}
