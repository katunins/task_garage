import 'package:task_garage/domain/model/task_list.dart';

class TaskDetail {
  TaskDetail({
    required this.deal,
    required this.nextTask,
    required this.taskId
  });

  late final Deal? deal;
  late final NextTask? nextTask;
  final int taskId;
}

class Deal {
  Deal({
    required this.products,
    required this.params,
  });

  late final Map<String, dynamic>? products;
  late final Map<String, dynamic>? params;

}


const json = {
  "deal": {
    "products": {
      "1": {
        "productname": "Печать фотографий",
        "Формат": "10х15",
        "Тип печати": "Шелк",
        "Обрезка": "Фото в размер",
        "Ссылка на макет": "cloud.mail.ru/public/6Ju5/BAkGKhtCg",
        "Количество": "20"
      }
    },
    "params": {
      "comment": null,
      "Доставка": "До склада",
      "delivery": true,
      "workdays": "2",
      "uniondata": [
        "10997",
        "11021"
      ],
      "deal": "22 #10997",
      "dealid": 36215,
      "managernote": "+коробка для фото крышка-дно из белого эфалина с тонкой лентой",
      "Срок готовности": "2022-02-01",
      "manager": "Аня Согдеева"
    }
  },
  "nextTask": {
    "id": 42845,
    "name": "Упаковка",
    "master": 8,
    "templateid": 188,
    "time": 6,
    "status": "finished",
    "mastercomment": null,
    "taskidbefore": 42844,
    "start": "2022-01-31 09:00:00",
    "end": "2022-01-31 09:06:00",
    "buffer": 90,
    "line": 1,
    "position": 2,
    "generalinfo": "Печать фотографий 10х15",
    "info": null,
    "dealid": 36215,
    "manager": "Аня Согдеева",
    "managernote": 1,
    "deal": "22 #10997",
    "created_at": "2022-01-28T07:35:42.000000Z",
    "updated_at": "2022-01-28T13:25:58.000000Z",
    "masterName": {
      "id": 8,
      "bitrixid": 8039,
      "type": "master",
      "name": "Игорь",
      "avatar": "https://bitrix2.cdnvideo.ru/b1888745/resize_cache/57511/ff58db95aecdfa09ae61b51b5fd8f63f/main/07d/07de187c7407fa6a2f48428b6b9ae1db/avatar.png?h=korobook.bitrix24.ru",
      "created_at": "2021-06-23T13:59:22.000000Z",
      "updated_at": "2021-06-23T13:59:22.000000Z"
    }
  }
};