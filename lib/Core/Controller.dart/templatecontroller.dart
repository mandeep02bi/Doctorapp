import 'package:doctor/Core/Controller.dart/templating.dart';
import 'package:get/get.dart';

class TemplateController extends GetxController {
  var selectedTab = TemplateType.medicine.obs;

  var medicineList = <String>[].obs;
  var labList = <String>[].obs;
  var consentList = <String>[].obs;

  void switchTab(TemplateType type) {
    selectedTab.value = type;
  }

  void addItem(String value) {
    if (selectedTab.value == TemplateType.medicine) {
      medicineList.add(value);
    } else if (selectedTab.value == TemplateType.lab) {
      labList.add(value);
    } else {
      consentList.add(value);
    }
  }

  List<String> get currentList {
    switch (selectedTab.value) {
      case TemplateType.medicine:
        return medicineList;
      case TemplateType.lab:
        return labList;
      case TemplateType.consent:
        return consentList;
    }
  }
}