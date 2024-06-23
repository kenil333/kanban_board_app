class CommentModel {
  final int id;
  final String message;
  final int taskid;

  CommentModel({
    required this.id,
    required this.message,
    required this.taskid,
  });

  factory CommentModel.fromJson(Map data) => CommentModel(
        id: int.parse(data["id"]),
        message: data["message"],
        taskid: int.parse(data["taskid"]),
      );
}
