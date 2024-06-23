import 'package:get/get.dart';

import 'create_edit_task_controller.dart';

class CreateEditTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateEditTaskController>(() => CreateEditTaskController());
  }
}
