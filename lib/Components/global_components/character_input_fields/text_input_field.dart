import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controllers/character_input_field/text_input_field_controller.dart';

class TextInputField extends StatefulWidget {
  const TextInputField(
      {super.key,
      required this.enabled,
      required this.textEditingController,
      required this.hintText,
      required this.uniqueTextInputFieldId,
      this.width,
      this.validator,
      this.keyboardType});

  final TextEditingController textEditingController;
  final String hintText;
  final String uniqueTextInputFieldId;
  final bool enabled;
  final double? width;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  final _textInputFieldController = Get.put(TextInputFieldController());

// int fetchedIndexForFocusNode = _textInputFieldController.ad

  @override
  Widget build(BuildContext context) {
    // final FocusNode _focusNode = FocusNode();
    // bool _isFocused = false;

    double deviceHeight = MediaQuery.of(context).size.height;
    //double deviceWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      bool focusedOrNot = _textInputFieldController
          .isFieldFocused(widget.uniqueTextInputFieldId);
      return GestureDetector(
          onTap: () {
            //when the text field is tapped, get the focus on that very field by calling the controller
            if (widget.enabled == true) {
              _textInputFieldController
                  .requestFocus(widget.uniqueTextInputFieldId);
            } else if (widget.enabled == false) {
              print('it is false**********************************');
            }
          },
          child: widget.enabled
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: /*focusedOrNot ? 318 :*/ 326,
                  height: /*focusedOrNot ? 37 :*/ 45,
                  decoration: BoxDecoration(
                    color: focusedOrNot
                        ? Colors.transparent
                        : const Color(0xFF2F5B6C),
                    borderRadius: BorderRadius.circular(8),
                    border: focusedOrNot
                        ? Border.all(color: const Color(0xFFB8FE22), width: 1.5)
                        : Border.all(color: Colors.transparent, width: 0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: focusedOrNot ? 318 : 326,
                      height: focusedOrNot ? 37 : 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2F5B6C),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        cursorColor: Color(0xFFF4F4F4),
                        cursorHeight: 15,
                        controller: widget.textEditingController,
                        //obscureText: obscureText,
                        onTapOutside: (event) {
                          _textInputFieldController.removeFocus();
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              color: Color(0xFFCCCCCC),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: 'Poppins'),
                          hintText: focusedOrNot ? '' : widget.hintText,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              bottom: focusedOrNot ? 13 : 14,
                              left: focusedOrNot ? 19 : 20,
                              top: 12,
                              right: 20),
                        ),

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),

                        //focusNode: AlwaysDisabledFocusNode(),
                        onTap: () {
                          _textInputFieldController
                              .requestFocus(widget.uniqueTextInputFieldId);
                        },
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                      /*top: (5/800)*deviceHeight,*/
                      bottom: (20 / 800) * deviceHeight),
                  child: Container(
                    height: deviceHeight * (45 / 800),
                    width: 326,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xFF2F5B6C),
                    ),
                    child: TextField(
                      enabled: false,
                      onTap: () {
                        //containerWidth = 200;
                      },
                      //onEditingComplete: ,
                      //focusNode
                      onTapOutside: (event) {
                        // containerWidth = 324;
                      },

                      cursorColor: Colors.white10,
                      cursorHeight: 6,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            bottom: 12, left: 20, top: 12, right: 20),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 0.3, color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                          gapPadding: 2,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFDF0030),
                            width: 1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          gapPadding: 1,
                        ),
                        enabledBorder: OutlineInputBorder(
                          gapPadding: 2,
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            strokeAlign: 2,
                            width: 1.5,
                            style: BorderStyle.solid,
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.5,
                                strokeAlign: 2,
                                color: Color(0xFFB8FE22),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(8),
                            gapPadding: 2),
                      ),

                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      maxLength: 30,
                      buildCounter: (context,
                          {required currentLength,
                          required isFocused,
                          required maxLength}) {
                        return null;
                      },
                    ),
                  ),
                ));

      // return Padding(
      //   padding: EdgeInsets.only(/*top: (5/800)*deviceHeight,*/ bottom: (20/800)*deviceHeight),
      //   child: Container(
      //     height: deviceHeight*(45/800),
      //     width: 326,
      //     decoration: const BoxDecoration(
      //       borderRadius: BorderRadius.all(Radius.circular(8)),
      //       color: Color(0xFF2F5B6C),
      //     ),
      //
      //
      //
      //     child: TextField(
      //       onTap: () {
      //         //containerWidth = 200;
      //       },
      //       //onEditingComplete: ,
      //       //focusNode
      //       onTapOutside: (event) {
      //         // containerWidth = 324;
      //       },
      //
      //
      //       decoration: InputDecoration(
      //         contentPadding: EdgeInsets.only(bottom: 12, left: 20, top: 12,right: 20),
      //
      //
      //
      //         errorBorder: OutlineInputBorder(
      //           borderSide: BorderSide(
      //             color: Color(0xFFDF0030),
      //             width: 1.5,
      //             style: BorderStyle.solid,
      //           ),
      //           borderRadius: BorderRadius.circular(8),
      //           gapPadding: 1,
      //         ),
      //
      //
      //
      //         enabledBorder: OutlineInputBorder(
      //           gapPadding: 2,
      //           borderRadius: BorderRadius.circular(8),
      //           borderSide: BorderSide(
      //             strokeAlign: 2,
      //             width: 1.5,
      //             style: BorderStyle.solid,
      //             color: Colors.transparent,
      //           ),
      //
      //         ),
      //
      //
      //
      //         focusedBorder: OutlineInputBorder(
      //             borderSide: BorderSide(
      //                 width: 1.5,
      //                 strokeAlign: 2,
      //                 color: Color(0xFFB8FE22),
      //                 style: BorderStyle.solid
      //             ),
      //             borderRadius: BorderRadius.circular(8),
      //             gapPadding: 2
      //         ),
      //
      //
      //
      //
      //
      //       ),
      //       cursorColor: Colors.white,
      //       cursorHeight: 18,
      //       style: TextStyle(
      //         fontSize: 14,
      //         fontFamily: 'Poppins',
      //         fontWeight: FontWeight.w500,
      //         color: Colors.white,
      //
      //       ),
      //       maxLength: 30,
      //       buildCounter: (context, {required currentLength, required isFocused, required maxLength}) {
      //         return null;
      //       }  ,
      //     ),
      //   ),
      // );
    });
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
