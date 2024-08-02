class Task {
  /// data class
  static const String collectionName = 'tasks';

  String id;

  String title;

  String description;

  DateTime dateTime;

  bool isDone;

  Task(
      {this.id = '',
      required this.title,
      required this.description,
      required this.dateTime,
      this.isDone = false});

  /// json => object
  Task.fromFireStore(Map<String, dynamic> data)
      : this(
            id: data['id'] as String,
            title: data['title'] as String,
            description: data['description'] as String,
            dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
            isDone: data['isDone'] as bool);

  /// object => json
  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isDone': isDone
    };
  }
}

/// developer   object
/// firebase    json  (map)
/// json => object
/// object => json
/// {}    []
