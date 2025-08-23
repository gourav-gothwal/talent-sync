class Job {
  final String id;
  final String title;
  final String company;
  final String location;
  final String salary;
  final String description;
  final String applyUrl;
  final bool isSaved;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.description,
    required this.applyUrl,
    this.isSaved = false,
  });

  /// Create Job object from Firestore/Map
  factory Job.fromMap(Map<String, dynamic> data, String documentId) {
    return Job(
      id: documentId,
      title: data['title'] ?? 'Untitled Job',
      company: data['company'] ?? 'Unknown Company',
      location: data['location'] ?? 'Not specified',
      salary: data['salary'] ?? 'Not disclosed',
      description: data['description'] ?? 'No description provided.',
      applyUrl: data['applyUrl'] ?? '',
      isSaved: data['isSaved'] ?? false,
    );
  }

  /// Convert Job object to Map (for Firestore saving)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'company': company,
      'location': location,
      'salary': salary,
      'description': description,
      'applyUrl': applyUrl,
      'isSaved': isSaved,
    };
  }

  /// Copy Job with updated fields (useful for updating saved status, etc.)
  Job copyWith({
    String? id,
    String? title,
    String? company,
    String? location,
    String? salary,
    String? description,
    String? applyUrl,
    bool? isSaved,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      company: company ?? this.company,
      location: location ?? this.location,
      salary: salary ?? this.salary,
      description: description ?? this.description,
      applyUrl: applyUrl ?? this.applyUrl,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
