import 'package:flutter/material.dart';

import '../../data/helpers/task_db_helper.dart';
import '../../data/models/task_model.dart';
import '../../utils/app_text.dart';

class TaskRepository {
  Future<bool> creteTask(
    String title,
    String description,
    int boardid,
  ) async {
    try {
      final Map<String, String> data = {
        "id": DateTime.now().millisecondsSinceEpoch.toString(),
        "title": title,
        "description": description,
        "boardid": boardid.toString(),
        "column": AppText.todo,
        "timelog": "",
      };
      await TaskDbHelper.insert(data);
      return true;
    } catch (e) {
      debugPrint("=======>   TASK REPO CATCH ERROR:=> $e");
      return false;
    }
  }

  Future<List<TaskModel>> getTasks(int boardid) async {
    try {
      final List<Map<String, dynamic>> list = await TaskDbHelper.getData(
        boardid.toString(),
      );
      List<TaskModel> taskList =
          list.map((e) => TaskModel.fromJson(e)).toList();
      if (taskList.length > 1) {
        taskList.sort((a, b) => a.id.compareTo(b.id));
      }
      return taskList;
    } catch (e) {
      debugPrint("=======>   TASK REPO CATCH ERROR:=> $e");
      return [];
    }
  }

  Future<bool> updateTaskColumn(int tid, String column) async {
    try {
      await TaskDbHelper.updateData(tid, {"column": column});
      return true;
    } catch (e) {
      debugPrint("=======>   TASK REPO CATCH ERROR:=> $e");
      return false;
    }
  }

  Future<bool> updateTaskDetails(
    int tid,
    String title,
    String description,
  ) async {
    try {
      await TaskDbHelper.updateData(tid, {
        "title": title,
        "description": description,
      });
      return true;
    } catch (e) {
      debugPrint("=======>   TASK REPO CATCH ERROR:=> $e");
      return false;
    }
  }

  Future<bool> updateTimeLog(
    int tid,
    String timelog,
  ) async {
    try {
      await TaskDbHelper.updateData(tid, {
        "timelog": timelog,
      });
      return true;
    } catch (e) {
      debugPrint("=======>   TASK REPO CATCH ERROR:=> $e");
      return false;
    }
  }
}
