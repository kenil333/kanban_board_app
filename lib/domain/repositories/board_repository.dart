import 'dart:convert';

import 'package:flutter/material.dart';

import '../../data/helpers/board_db_helper.dart';
import '../../data/models/board_model.dart';
import '../../data/models/task_model.dart';
import '../../utils/app_text.dart';

class BoardRepository {
  List<Map> columnsList = [
    {"name": AppText.todo, "totaltask": 0},
    {"name": AppText.inProgress, "totaltask": 0},
    {"name": AppText.done, "totaltask": 0},
  ];

  Future<List<BoardModel>> getBoards() async {
    try {
      final List<Map<String, dynamic>> list = await BoardDbHelper.getData();
      List<BoardModel> boardList =
          list.map((e) => BoardModel.fromJson(e)).toList();
      if (boardList.length > 1) {
        boardList.sort((a, b) => b.id.compareTo(a.id));
      }
      return boardList;
    } catch (e) {
      debugPrint("=======>   BOARD REPO CATCH ERROR:=> $e");
      return [];
    }
  }

  Future<bool> creteBoard(
    String name,
    String description,
  ) async {
    try {
      final Map<String, String> data = {
        "id": DateTime.now().millisecondsSinceEpoch.toString(),
        "name": name,
        "description": description,
        "columns": jsonEncode(columnsList),
      };
      await BoardDbHelper.insert(data);
      return true;
    } catch (e) {
      debugPrint("=======>   BOARD REPO CATCH ERROR:=> $e");
      return false;
    }
  }

  Future<bool> updateBoard(int bid, List<TaskModel> taskList) async {
    try {
      Map mapData = {
        AppText.todo: 0,
        AppText.inProgress: 0,
        AppText.done: 0,
      };
      taskList.map((e) {
        mapData[e.column] += 1;
      }).toList();
      List<Map> data = [];
      mapData.forEach((key, value) {
        data.add({"name": key, "totaltask": value});
      });
      await BoardDbHelper.updateData(
        bid,
        {"columns": jsonEncode(data)},
      );
      return true;
    } catch (e) {
      debugPrint("=======>   BOARD REPO CATCH ERROR:=> $e");
      return false;
    }
  }
}
