// Estudiante: Waren Sanchez || Matrícula: 2023-1198

class Event {
  final String id;
  final String title;
  final String description;
  final String date;
  final String imagePath;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'imagePath': imagePath,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
      imagePath: map['imagePath'],
    );
  }
}
