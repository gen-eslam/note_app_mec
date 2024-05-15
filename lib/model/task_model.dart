class TaskModel {
  int? id;
  String title, note;
  int color, isCompleted;

  TaskModel(
      {this.id,
      required this.title,
      required this.note,
      required this.color,
      this.isCompleted = 0});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      note: json['note'],
      color: json['color'],
      isCompleted: json['isCompleted'],
    );
  }
  Map<String,dynamic> toJson()

  {
    return {
      'title':title,
      'note':note,
      'color':color,
      'isCompleted':isCompleted
    };
  }
  TaskModel copyWith({
    int? id,
    String? title,
    String? note,
    int? color,
    int? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      color: color ?? this.color,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, note: $note, color: $color, isCompleted: $isCompleted)';
  }

  

}
