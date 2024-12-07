import 'package:flutter/material.dart';
import 'package:wempro/presentation/state_holders/Store_info.dart';
import 'package:get/get.dart';
import 'package:wempro/presentation/ui/screens/home_screen.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key});

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  final StoreInfoController storeInfoController = Get.find<StoreInfoController>();

  @override
  Widget build(BuildContext context) {
    // Fetch the formData map
    final allData = storeInfoController.formData;

    // Filter out entries where value length is less than 1
    final filteredData = allData.entries
        .where((entry) => entry.value.isNotEmpty)
        .toList();

    return GetBuilder<StoreInfoController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Submit Screen'),
          ),
          body: SingleChildScrollView(  // Wrapping the entire body with SingleChildScrollView
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(

                children: [
                  // Row with "Selected Input" and item count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Selected Input",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${filteredData.length} items",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // ListView.builder to display filtered data
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),  // Disable scrolling within ListView
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final key = filteredData[index].key;
                      final value = filteredData[index].value;

                      return ListTile(
                        leading: Icon(
                          Icons.check_circle, // Green check mark icon
                          color: Colors.green,
                        ),
                        title: Text('$key: $value'),
                      );
                    },
                  ),
                  // Divider
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 20,
                  ),
                  // Row with "Edit" and a getter arrow
                  InkWell(
                    onTap: () {
                      // You can add the navigation or action for "Edit"
 Get.offAll(HomeScreen());                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,  // Align vertically to center
                      children: [
                        Padding(
  padding: const EdgeInsets.only(left: 15.0),  // Apply 10 padding to the left
  child: Text(
    "Edit",
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,  // Text color remains black
    ),
  ),
)
,
                        IconButton(
  icon: Icon(
    Icons.arrow_forward_ios,  // Getter arrow icon
    size: 16,
    color: Colors.black,  // Arrow color set to green
  ),
  onPressed: () {
    // Handle "Edit" button press action
   Get.offAll(HomeScreen());
  },
)

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Get.offAll(HomeScreen());
              },
              child: const Text("Back"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Button spans full width
              ),
            ),
          ),
        );
      },
    );
  }
}
