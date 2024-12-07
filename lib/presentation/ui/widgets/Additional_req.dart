import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro/presentation/state_holders/Store_info.dart';
import 'package:wempro/presentation/state_holders/building_Info_controller.dart';

class AdditionalReq extends StatefulWidget {
  final String? type;
  final String? title;
  final List<String>? options;

  const AdditionalReq({super.key, this.type, this.title, this.options});

  @override
  State<AdditionalReq> createState() => _AdditionalReqState();
}

class _AdditionalReqState extends State<AdditionalReq> {
  // Use Get.find() safely with proper initialization
  final StoreInfoController storeInfoController = Get.find<StoreInfoController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreInfoController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title ?? '', // Title can be null, so using null-aware operator
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8), // Adds space between title and TextField
            TextField(
              maxLines: 3, // Set the maximum number of lines
              onChanged: (value) {
                storeInfoController.setADtext(value); // Pass text to controller
              },
              decoration: InputDecoration(
                hintText: 'Enter Additional',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
      },
    );
  }
}
