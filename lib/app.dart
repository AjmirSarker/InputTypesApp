import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro/controller_binder.dart';
import 'package:wempro/presentation/state_holders/building_Info_controller.dart';
import 'package:wempro/presentation/ui/screens/home_screen.dart';

class Wempro extends StatefulWidget {
  const Wempro({super.key});

  @override
  State<Wempro> createState() => _WemproState();
}

 Future<void> _loadProduct() async {
    Get.find<BuildingInfoController>().fetchBuildingInfo();
  }

class _WemproState extends State<Wempro> {
  @override
  void initState() {
    super.initState();
     Get.put(BuildingInfoController());
    // _loadProduct();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         inputDecorationTheme:const InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(
           color: Color.fromARGB(221, 1, 97, 100),

          ),
         
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color:  Color.fromARGB(255, 4, 151, 170),

            )
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color:  Color.fromARGB(255, 4, 151, 170),
            )
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.red
            )
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.red
            )
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)
            ),
            backgroundColor: const Color.fromARGB(255, 72, 104, 104),
            foregroundColor: Colors.white
          )
        )
      ),
      home: const SafeArea(child: HomeScreen()),
      initialBinding: ControllerBinder(),
    );
  }
}