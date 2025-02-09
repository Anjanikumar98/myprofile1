import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/global_controllers/description_input.dart';

class DescriptionInputField extends StatefulWidget {
  const DescriptionInputField({
    super.key,
    required this.enabled, 
    required this.textEditingController, 
    required this.hintText, 
    required this.uniqueTextInputFieldId, 
  });

  final DescriptionInputFieldController textEditingController;
  final String hintText;
  final String uniqueTextInputFieldId;
  final bool enabled;

  @override
  State<DescriptionInputField> createState() => _DescriptionInputFieldState();
}

class _DescriptionInputFieldState extends State<DescriptionInputField> {
  // Reference to the controller that manages the focus state of the input fields.
  final _DescriptionInputFieldController = Get.put(DescriptionInputFieldController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      // Check if the current input field is focused.
      bool isFocused = _DescriptionInputFieldController.isFieldFocused(widget.uniqueTextInputFieldId);

      return GestureDetector(
        onTap: () {
          if (widget.enabled) {
            // Request focus if the field is enabled.
            _DescriptionInputFieldController.requestFocus(widget.uniqueTextInputFieldId);
          } else {
            print('Field is disabled');
          }
        },
        child: widget.enabled
            ? _buildEditableField(screenWidth, screenHeight, isFocused)
            : _buildDisabledField(screenWidth, screenHeight),
      );
    });
  }

  // Builds the UI for the editable state of the input field.
  Widget _buildEditableField(double screenWidth, double screenHeight, bool isFocused) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: screenWidth * (350 / 360),
      height: screenHeight * 0.1775,
      decoration: BoxDecoration(
        color: isFocused ? Colors.transparent : const Color(0xFF2F5B6C),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isFocused ? const Color(0xFFB8FE22) : Colors.transparent,
          width: isFocused ? 1.5 : 0.01,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isFocused ? screenWidth * (348 / 360) : screenWidth * (350 / 360),
          height: isFocused ? screenHeight * 0.1725 : screenHeight * 0.1775,
          decoration: BoxDecoration(
            color: const Color(0xFF2F5B6C),
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextField(
            cursorColor: const Color(0xFFF4F4F4),
            cursorHeight: 15,
            maxLines: null, // Allows multiline input.
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Color(0xFFCCCCCC),
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
              hintText: isFocused ? '' : widget.hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                bottom: isFocused ? 13 : 14,
                left: isFocused ? 19 : 20,
                top: 12,
                right: 20,
              ),
            ),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            onTap: () {
              _DescriptionInputFieldController.requestFocus(widget.uniqueTextInputFieldId);
            },
          ),
        ),
      ),
    );
  }

  // Builds the UI for the disabled state of the input field.
  Widget _buildDisabledField(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.only(bottom: (20 / 800) * screenHeight),
      child: Container(
        height: screenHeight * 0.1775,
        width: screenWidth * (350 / 360),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xFF2F5B6C),
        ),
        child: TextField(
          enabled: false,
          cursorColor: Colors.white10,
          cursorHeight: 6,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              bottom: 12, left: 20, top: 12, right: 20,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.3, color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFDF0030),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.5,
                color: Color(0xFFB8FE22),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          maxLength: 1000,
          buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null,
        ),
      ),
    );
  }
}

// Custom focus node that always disables focus for certain UI elements.
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
