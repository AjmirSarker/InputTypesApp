// building_info_controller.dart
import 'package:get/get.dart';
import 'package:wempro/data/models/Building_model.dart';
import 'package:wempro/data/models/network_response.dart';
import 'package:wempro/data/network_caller/network_caller.dart';

class BuildingInfoController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  BuildingInfo? _buildingInfo;
  String url= "http://team.dev.helpabode.com:54292/api/wempro/flutter-dev/coding-test-2024/";

  String? get errorMessage => _errorMessage;
  bool get inProgress => _inProgress;
  BuildingInfo? get buildingInfo => _buildingInfo;

  Future<bool> fetchBuildingInfo() async {
    _inProgress = true;
    bool isSuccess = false;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: url);

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _buildingInfo = BuildingInfo.fromJson(response.responserData);
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
