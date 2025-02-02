// import 'package:get/get.dart';

// class ExpandedDropdownController extends GetxController {
//   var isOpen = false.obs;


//   void toggleDropdown() {
//     isOpen.value = !isOpen.value;
//   }

//   void closeDropdown() {
//     isOpen.value = false;
//   }

  
//   // bool isOpened(){
//   //   return isOpen.value;

//   // }

//     RxMap<String, bool> buttonsStates = <String, bool>{

//     'Owner': false,
//     'Manager': false,
//     'Owner/Manager': false,
//     'Trainer': false,
//     'System Admin': false,
//     }.obs;

  

//   // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//         // MODULE D 1 M M 2 Manager Account Creation
  



//   var RoleSelected = "".obs;
//   // var RoleSelectedBool = false.obs;
//         var  RoleSelectedBool =false.obs;      



//     void selectOption(String option) {

//       RoleSelectedBool.value = !RoleSelectedBool.value;

     


//       RoleSelected.value = option;
//       print(RoleSelected);
//       print(RoleSelectedBool);



//       // closeDropdown();
//     }


//     RxList<String> languagesSelected =<String>[].obs;
  
//   void changeState_for_LanguageSelected(String uniqueButtonId, int languageListIndex){
    
//     print(RoleSelected);
    
//     RoleSelected.value=uniqueButtonId;
//     closeDropdown();


//     print(listOflanguageIndexesSelected.toString());
//     print(languagesSelected);
//   }

//   RxList<int> listOflanguageIndexesSelected = <int>[].obs;




//    bool isSelected(String id){
//     return buttonsStates[id] ?? false ;
    
//   }

// }

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ExpandedDropdownController extends GetxController {
  var isOpen = false.obs;

  void toggleDropdown() {
    isOpen.value = !isOpen.value;
  }

  void closeDropdown() {
    isOpen.value = false;
  }

  // Map to store selection state for each option
  RxMap<String, bool> buttonStates = <String, bool>{}.obs;

  var RoleSelected = "".obs;

  void selectOption(String option) {
    // Reset all button states to false
    buttonStates.updateAll((key, value) => false);

    // Mark the selected option as true
    buttonStates[option] = true;

    RoleSelected.value = option;
    print(RoleSelected);
    // print(buttonStates);
  }

  bool isSelected(String option) {
    return buttonStates[option] ?? false;
  }
}
