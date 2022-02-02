class TaskActionRequest {
  final String action;
  final String? message;
  final int taskId;

  TaskActionRequest(
      {required this.action, this.message, required this.taskId});
}