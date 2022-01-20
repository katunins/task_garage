class User {
  int id;
  int bitrixid;
  String name;
  String avatar;

  User({required this.id,
    required this.bitrixid,
    required this.name,
    required this.avatar});
}


const body = {
  "id": 2,
  "bitrixid": 235,
  "type": "master",
  "name": "Алина_Галыбина",
  "avatar": "https://cdn-ru.bitrix24.ru/b1888745/main/2e0/2e0c29255e8f2e3d591c5d43661072cc/avatar.png",
  "created_at": "2021-02-01T07:17:06.000000Z",
  "updated_at": "2021-03-11T07:05:36.000000Z"
};