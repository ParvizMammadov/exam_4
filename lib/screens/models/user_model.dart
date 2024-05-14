class UserModel {
  final int id;
  final String title;
  final bool completed;
  UserModel({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'], title: json['title'], completed: json['completed']);
}
