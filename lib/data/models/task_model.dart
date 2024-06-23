class TaskModel {
  final int id;
  final String title;
  final String description;
  final int boardid;
  final String column;
  String timelog;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.boardid,
    required this.column,
    required this.timelog,
  });

  factory TaskModel.fromJson(Map data) => TaskModel(
        id: int.parse(data["id"]),
        title: data["title"],
        description: data["description"],
        boardid: int.parse(data["boardid"]),
        column: data["column"],
        timelog: data["timelog"],
      );
}
