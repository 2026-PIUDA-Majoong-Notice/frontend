import 'package:flutter/material.dart';

import '../model/record_add_type.dart';
import 'selectable_record_type_button.dart';


class RecordTypeSelectStep extends StatelessWidget {
  final Set<RecordAddType> selectedTypes;
  final ValueChanged<RecordAddType> onTypeTap;

  const RecordTypeSelectStep({
    super.key,
    required this.selectedTypes,
    required this.onTypeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 45,
        crossAxisSpacing: 45,
        mainAxisExtent: 150,
        padding: const EdgeInsets.symmetric(horizontal: 55),
        children: RecordAddType.values.map((type) {
          return SelectableRecordTypeButton(
            icon: type.icon,
            label: type.label,
            isSelected: selectedTypes.contains(type),
            onTap: () => onTypeTap(type),
          );
        }).toList(),
      ),
    );
  }
}