import 'dart:convert';

class BoardModel {
  final int id;
  final String name;
  final String description;
  final List<BoardColumns> columns;

  BoardModel({
    required this.id,
    required this.name,
    required this.description,
    required this.columns,
  });

  factory BoardModel.fromJson(Map data) => BoardModel(
        id: int.parse(data["id"]),
        name: data["name"],
        description: data["description"],
        columns: (jsonDecode(data["columns"]) as List)
            .map(
              (e) => BoardColumns.fromJson(e),
            )
            .toList(),
      );
}

class BoardColumns {
  final String name;
  final int totaltask;

  BoardColumns({
    required this.name,
    required this.totaltask,
  });

  factory BoardColumns.fromJson(Map data) => BoardColumns(
        name: data["name"],
        totaltask: data["totaltask"],
      );
}
