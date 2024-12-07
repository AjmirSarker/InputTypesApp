import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro/presentation/state_holders/Store_info.dart';
import 'package:wempro/presentation/state_holders/building_Info_controller.dart';

class GarageCl extends StatefulWidget {
  final String? type;
  final String? title;
  final List<String>? options;
  const GarageCl({super.key, this.type, this.title, this.options});

  @override
  State<GarageCl> createState() => _GarageClState();
}

class _GarageClState extends State<GarageCl> {
  final StoreInfoController storeInfoController = Get.find<StoreInfoController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreInfoController>(
      builder: (storeInfoController) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              // Column to display the checkboxes for each option
              Column(
                children: widget.options?.asMap().entries.map((entry) {
                  int index = entry.key;
                  String option = entry.value;
                  return CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(option),
                    value: storeInfoController.selectCheckboxValuesGarage[index], // Use the index to get the checkbox state
                    onChanged: (bool? value) {
                      // Update logic to allow only one checkbox to be checked
                      storeInfoController.updateCheckboxOutGarage(index, value ?? false, option);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                }).toList() ?? [],
              ),
            ],
          ),
        );
      },
    );
  }
}
