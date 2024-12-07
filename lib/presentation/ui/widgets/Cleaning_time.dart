import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro/presentation/state_holders/Store_info.dart';

class CleaningTime extends StatefulWidget {
  final String? type;
  final String? title;
  final List<String>? options;

  const CleaningTime({super.key, this.type, this.title, this.options});

  @override
  State<CleaningTime> createState() => _CleaningTimeState();
}

class _CleaningTimeState extends State<CleaningTime> {
  // Use Get.find() to access StoreInfoController
  final StoreInfoController storeInfoController = Get.find<StoreInfoController>();

  @override
  Widget build(BuildContext context) {
    // Use GetBuilder with a specific controller type
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
                storeInfoController.setCTtext(value); // Pass text to controller
              },
              decoration: InputDecoration(
                hintText: 'Enter Time',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
      },
    );
  }
}
