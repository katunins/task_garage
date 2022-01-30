import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_garage_flutter/models/data.dart';
import 'package:task_garage_flutter/models/helpers.dart';
import 'package:task_garage_flutter/widgets/dealBadge.dart';
import 'package:task_garage_flutter/widgets/infoBadge.dart';
import 'package:task_garage_flutter/widgets/lightBadge.dart';
import 'package:task_garage_flutter/widgets/productDetail.dart';
import 'package:task_garage_flutter/widgets/productParams.dart';
import 'package:task_garage_flutter/widgets/stuckBadge.dart';
import 'package:task_garage_flutter/widgets/taskBlockAlert.dart';

class ItemTask extends StatelessWidget {
  const ItemTask(
      {Key? key,
      required this.item,
      required this.isDeadlineAlert,
      required this.detail})
      : super(key: key);
  final Map<String, dynamic> item;
  final Map<String, dynamic> detail;
  final bool isDeadlineAlert;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: isDeadlineAlert ? Colors.red[100] : Colors.grey[200],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              DealNameBadge(
                  text: item['deal'], isActive: item['status'] != 'finished'),
              if (item['info'] != null) const InfoBadge(),
              if (item['stuck'] != null) const StuckBadge(),
              Expanded(child: Container()),
              LightBadge(text: getTimeFromString(item['start'])),
              LightBadge(text: getDifference(item['start'], item['end'])),
            ],
          ),
          const SizedBox(height: 4.0),
          Text(item['name'],
              style: const TextStyle(fontWeight: FontWeight.w700)),
          Text(item['generalinfo'],
              style: const TextStyle(fontWeight: FontWeight.w400)),
          ...getProductDetail(item: item, context: context, detail: detail),
        ],
      ),
    );
  }
}