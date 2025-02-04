import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String hint;
  final String? selectedItem;
  final Function(String) onItemSelected;
  final double borderRadius;
  final double height;
  final double width;

  CustomDropdown({
    Key? key,
    required this.items,
    required this.hint,
    required this.selectedItem,
    required this.onItemSelected,
    this.borderRadius = 8.0,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          alignment: Alignment.bottomCenter,
          isExpanded: true,
          value: selectedItem,
          hint: Text(
            hint,
            style: const TextStyle(
              color: Color(0xFFBDBDBD),
              fontSize: 16,
            ),
          ),
          dropdownColor: Color(0xFF55A6C4).withOpacity(0.5),
          elevation: 01,
          borderRadius: BorderRadius.circular(borderRadius),
          items: items.map((category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: const Color(0xFF2F5B6C),
                  ),
                  child: Center(
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onItemSelected(value);
            }
          },
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFBDBDBD),
          ),
        ),
      ),
    );
  }
}
