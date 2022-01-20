class ApiUser {
  final int id;
  final int bitrixid;
  final String name;
  final String avatar;

  ApiUser.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        bitrixid = map['bitrixid'],
        name = map['name'],
        avatar = map['avatar'];
}