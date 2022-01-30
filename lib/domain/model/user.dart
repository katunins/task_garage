class User {
  int id;
  int bitrixid;
  String name;
  String avatar;

  User({required this.id, required this.bitrixid, required this.name, required this.avatar});

  Map<String, dynamic> toJson() {
    return {"id": id, "bitrixid": bitrixid, "name": name, "avatar": avatar};
  }
}
