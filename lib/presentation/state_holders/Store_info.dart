import 'package:get/get.dart';
import 'package:wempro/data/models/Building_model.dart';
import 'package:wempro/data/models/network_response.dart';
import 'package:wempro/data/network_caller/network_caller.dart';

class StoreInfoController extends GetxController {
  String HTradio = "";
  String NBdropdown = "1";
  String NBbathdropdown = "1";
  String CFradio = "";
  String GCcheckbox = "";
  String OAcheckbox = "";
  String CTtext = "";
  String PPradio = "";
  String ADtext = "";
  String PSAdropdown = "No Parking";
  List<bool> selectCheckboxValuesOutdoor = [false, false];
  List<bool> selectCheckboxValuesGarage = [false, false];

  // This will hold the form data
  Map<String, String> formData = {};

  // Initialize the form data
  @override
  void onInit() {
    super.onInit();
    updateFormData();
  }

  // Method to update form data
  void updateFormData() {
    formData = {
      "House type": HTradio,
      "Number of Bedrooms": NBdropdown,
      "Number of Bathrooms": NBbathdropdown,
      "Cleaning Frequency": CFradio,
      "Include Garage Cleaning": GCcheckbox,
      "Include Outdoor Area": OAcheckbox,
      "Preferred Cleaning Time": CTtext,
      "Pet-friendly Products": PPradio,
      "Additional Requests": ADtext,
      "Parking Space Availability": PSAdropdown,
    };
    update(); // This will notify any listeners
  }

  void setHTradio(String value) {
    HTradio = value;
    updateFormData(); // Update formData when value changes
  }

  void setNBdropdown(String value) {
    NBdropdown = value;
    updateFormData();
  }

  void setNBbathdropdown(String value) {
    NBbathdropdown = value;
    updateFormData();
  }

  void setCFradio(String value) {
    CFradio = value;
    updateFormData();
  }

  void setGCcheckbox(String value) {
    GCcheckbox = value;
    updateFormData();
  }

  void setOAcheckbox(String value) {
    OAcheckbox = value;
    updateFormData();
  }

  void setCTtext(String value) {
    CTtext = value;
    updateFormData();
  }

  void setPPradio(String value) {
    PPradio = value;
    updateFormData();
  }

  void setADtext(String value) {
    ADtext = value;
    updateFormData();
  }

  void setPSAdropdown(String value) {
    PSAdropdown = value;
    updateFormData();
  }

  // Update checkbox for outdoor area and trigger update
  void updateCheckboxOutdoor(int index, bool value, String data) {
    // Uncheck all checkboxes before checking the current one
    for (int i = 0; i < selectCheckboxValuesOutdoor.length; i++) {
      selectCheckboxValuesOutdoor[i] = false;
    }

    // Check the selected checkbox
    selectCheckboxValuesOutdoor[index] = value;
    update();  // Ensure widget rebuild after change

    // Directly replace or add the new data to the stored value
    OAcheckbox = value ? data : '';  
    updateFormData();// Reset or set the new value
    update();  // Trigger the update
  }

  // Update checkbox for garage and trigger update
  void updateCheckboxOutGarage(int index, bool value, String data) {
    // Uncheck all checkboxes before checking the current one
    for (int i = 0; i < selectCheckboxValuesGarage.length; i++) {
      selectCheckboxValuesGarage[i] = false;
    }

    // Check the selected checkbox
    selectCheckboxValuesGarage[index] = value;
    update();  // Ensure widget rebuild after change

    // Directly replace or add the new data to the stored value
    GCcheckbox = value ? data : '';
    updateFormData();// Reset or set the new value
    update();  // Trigger the update
  }
}
