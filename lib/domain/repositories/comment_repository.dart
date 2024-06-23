import 'package:flutter/material.dart';

import '../../data/helpers/comment_db_helper.dart';
import '../../data/models/comment_model.dart';

class CommentRepository {
  Future<bool> addComment(
    String message,
    int taskid,
  ) async {
    try {
      final Map<String, String> data = {
        "id": DateTime.now().millisecondsSinceEpoch.toString(),
        "message": message,
        "taskid": taskid.toString(),
      };
      await CommentDbHelper.insert(data);
      return true;
    } catch (e) {
      debugPrint("=======>   TASK REPO CATCH ERROR:=> $e");
      return false;
    }
  }

  Future<List<CommentModel>> getComments(int taskid) async {
    try {
      final List<Map<String, dynamic>> list = await CommentDbHelper.getData(
        taskid.toString(),
      );
      List<CommentModel> commentList =
          list.map((e) => CommentModel.fromJson(e)).toList();
      if (commentList.length > 1) {
        commentList.sort((a, b) => a.id.compareTo(b.id));
      }
      return commentList;
    } catch (e) {
      debugPrint("=======>   TASK REPO CATCH ERROR:=> $e");
      return [];
    }
  }
}
