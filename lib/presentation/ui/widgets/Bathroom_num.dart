import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro/presentation/state_holders/Store_info.dart';
import 'package:wempro/presentation/state_holders/building_Info_controller.dart';

class BathroomNum extends StatefulWidget {
  final String? type ;
final String? title ;
final List<String>? options;
  const BathroomNum({super.key, this.type, this.title, this.options});

  @override
  State<BathroomNum> createState() => _BathroomNumState();
}

class _BathroomNumState extends State<BathroomNum> {
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
              Text(widget.title ?? '', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value:storeInfoController.NBbathdropdown ,
                onChanged: (newValue) {
              
                  storeInfoController.setNBbathdropdown(newValue.toString());
                },
                items: widget.options?.map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],  // Gray background
                  enabledBorder: InputBorder.none, 
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),  // Black border
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  
  }
}