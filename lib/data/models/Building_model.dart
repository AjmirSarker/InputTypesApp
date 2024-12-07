import 'package:wempro/data/models/JsonResponse.dart';

class BuildingInfo {
  String? message;
  String? assignmentInstructionUrl;
  String? information;
  JsonResponse? jsonResponse;

  BuildingInfo(
      {this.message,
      this.assignmentInstructionUrl,
      this.information,
      this.jsonResponse});

  BuildingInfo.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    assignmentInstructionUrl = json['assignmentInstructionUrl'];
    information = json['information'];
    jsonResponse = json['json_response'] != null
        ?  JsonResponse.fromJson(json['json_response'])
        : null;
  }

 
}