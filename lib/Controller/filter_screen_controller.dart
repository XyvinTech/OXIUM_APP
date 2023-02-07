import 'package:freelancer_app/Model/filterModel.dart';
import 'package:get/state_manager.dart';

class FilterScreenController extends GetxController {
  RxInt selectedParent = 0.obs;
  RxInt reload = 0.obs;
  List<String> parentList = [
    'Charger Status',
    'AC/DC',
    'Charger Type',
    'Charger Capacity',
    'Facilities',
  ];

  List<RxList<FilterModel>> filterList = [
    RxList([
      FilterModel(title: 'Available', isSelected: false),
      FilterModel(title: 'Busy', isSelected: false),
      FilterModel(title: 'Not Available', isSelected: false),
    ]),
    RxList([
      FilterModel(title: 'AC', isSelected: false),
      FilterModel(title: 'DC', isSelected: false),
    ]),
    RxList([
      FilterModel(title: 'CSS', isSelected: false),
      FilterModel(title: 'GBT', isSelected: false),
      FilterModel(title: 'Type 2', isSelected: false),
      FilterModel(title: 'IEC_60309', isSelected: false),
      FilterModel(title: 'CHAdeMO', isSelected: false),
    ]),
    RxList([
      FilterModel(title: '50 kW', isSelected: false),
      FilterModel(title: 'DC', isSelected: false),
    ]),
    RxList([
      FilterModel(title: 'Rest Room', isSelected: false),
      FilterModel(title: 'Hotel', isSelected: false),
      FilterModel(title: 'Cafe', isSelected: false),
      FilterModel(title: 'Shopping', isSelected: false),
    ]),
  ];

  resetFilter() {
    filterList.forEach((element) {
      for (int i = 0; i < element.length; i++) {
        element[i].isSelected = false;
      }
    });
    reload++;
  }
}
