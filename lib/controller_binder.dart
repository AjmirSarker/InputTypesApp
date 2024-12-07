

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:wempro/data/models/Building_model.dart';
import 'package:wempro/data/network_caller/network_caller.dart';
import 'package:wempro/presentation/state_holders/Store_info.dart';
import 'package:wempro/presentation/state_holders/building_Info_controller.dart';

class ControllerBinder extends Bindings  {

  @override
  void dependencies(){
    Get.put( Logger());
    Get.put(NetworkCaller(logger : Get.find<Logger>()));
    Get.put(BuildingInfoController());
    Get.put(StoreInfoController());



  }
}