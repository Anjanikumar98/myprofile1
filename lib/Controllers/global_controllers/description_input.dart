import 'package:get/get.dart';

class DescriptionInputFieldController extends GetxController {
  final RxString _currentFocusedFieldId = ''.obs;

  void requestFocus(String uniqueDescriptionInputFieldId) {
    if (_currentFocusedFieldId.value != uniqueDescriptionInputFieldId) {
      _currentFocusedFieldId.value = uniqueDescriptionInputFieldId;
    }
  }

  void removeFocus() {
    _currentFocusedFieldId.value = '';
  }

  bool isFieldFocused(String uniqueDescriptionInputFieldId) =>
      _currentFocusedFieldId.value == uniqueDescriptionInputFieldId;
}

// Form Controller for Validation
class FormController extends GetxController {
  var titleController = ''.obs;
  var taglineController = ''.obs;
  var descriptionController = ''.obs;
  var selectedBusinessType = ''.obs;
  var isFormValid = false.obs;

  void validateForm() {
    isFormValid.value = titleController.value.trim().isNotEmpty &&
        selectedBusinessType.value.isNotEmpty &&
        taglineController.value.trim().isNotEmpty &&
        descriptionController.value.trim().isNotEmpty;
  }
}



// RxBool focusNodeEnabled = false.obs;
//
//  Map<int, FocusNode> focusNodesMap = {};
//  var focusedIndex = -1.obs;
//
//
// int addNewFocusNode(){
//   int newIndex = focusNodesMap.length;
//
//   FocusNode newFocusNode = FocusNode();
//   newFocusNode.addListener((){
//     focusedIndex = newFocusNode.hasFocus ? newIndex : -1 ;
//   });
//
//   focusNodesMap[newIndex] = newFocusNode;
//   return newIndex;
// }
//
// FocusNode? returnFocusNodeForSpecificIndex(int index){
//   return focusNodesMap[index];
// }
//
//
//
// //A map of focus nodes with keys as index and values as focus Nodes.
// //Whenever a new TextField is created, addFocusNode is called and a newFocusNode is created
