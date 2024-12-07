import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro/presentation/state_holders/Store_info.dart';
import 'package:wempro/presentation/state_holders/building_Info_controller.dart';
import 'package:wempro/presentation/ui/screens/submit_screen.dart';
import 'package:wempro/presentation/ui/widgets/Additional_req.dart';
import 'package:wempro/presentation/ui/widgets/Bathroom_num.dart';
import 'package:wempro/presentation/ui/widgets/Bedroom_Num.dart';
import 'package:wempro/presentation/ui/widgets/Cleaning.dart';
import 'package:wempro/presentation/ui/widgets/Cleaning_time.dart';
import 'package:wempro/presentation/ui/widgets/Garage_cl.dart';
import 'package:wempro/presentation/ui/widgets/House_type.dart';
import 'package:wempro/presentation/ui/widgets/Outdoor_area.dart';
import 'package:wempro/presentation/ui/widgets/Parking.dart';
import 'package:wempro/presentation/ui/widgets/Pet_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BuildingInfoController buildingInfoController = Get.find<BuildingInfoController>();
  final StoreInfoController storeInfoController = Get.find<StoreInfoController>();
  Map<String, List<String>> selectedCheckboxValues = {};

  @override
  void initState() {
    super.initState();
    buildingInfoController.fetchBuildingInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
  title: Text("Input Types"),
  centerTitle: true, // Center the title in the AppBar
),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<BuildingInfoController>(
            builder: (controller) {
              final buildInfoFull = controller.buildingInfo?.jsonResponse;
              final attributes = buildInfoFull?.attributes;

              if (attributes == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: attributes.length,
                itemBuilder: (context, index) {
                  final attribute = attributes[index];
                  final id = "${attribute.id}";
                  final String type = "${attribute.type}";
                  final String title = "${attribute.title}";
                  final List<String>? options = attribute.options?.cast<String>();

                  switch (id) {
                    case '1':
                      return HouseType(type: type,title: title,options: options!);
                    case '2':
                      return BedroomNum(type: type,title: title,options: options!);
                    case '3':
                      return BathroomNum(type: type,title: title,options: options!);
                    case '4':
                      return Cleaning(type: type,title: title,options: options!);
                    case '5':
                      return GarageCl(type: type,title: title,options: options!);
                    case '6':
                      return OutdoorArea(type: type,title: title,options: options!);
                    case '7':
                      return CleaningTime(type: type,title: title);
                    case '8':
                      return PetProducts(type: type,title: title,options: options!);
                    case '9':
                      return AdditionalReq(type: type,title: title);
                    case '10':
                      return Parking(type: type,title: title,options: options!);
                    default:
                      return const SizedBox.shrink();
                  }
                },
              );
            },
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              if(storeInfoController.CFradio.length > 0 && storeInfoController.HTradio.length > 0 && storeInfoController.PPradio.length > 0 )  {
                  Get.to(SubmitScreen());
              }else{
                  Get.snackbar(
    "Alert", // Title
    "Complete all requirements", // Message
    snackPosition: SnackPosition.BOTTOM, // Position at the bottom
    backgroundColor: Colors.red, // Background color of the snackbar
    colorText: Colors.white, // Text color
    duration: Duration(seconds: 2), // Duration to show the snackbar
  );
              }
            
            },
            child: const Text("Submit"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ),
      ),
    );
  }}