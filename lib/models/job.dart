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

  factory Job.fromMap(Map<String, dynamic> data, String documentId) {
    return Job(
      id: documentId,
      title: data['title'] ?? '',
      company: data['company'] ?? '',
      location: data['location'] ?? '',
      salary: data['salary'] ?? '',
      description: data['description'] ?? '',
      applyUrl: data['applyUrl'] ?? '',
      isSaved: data['isSaved'] ?? false,
    );
  }
  
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
}
