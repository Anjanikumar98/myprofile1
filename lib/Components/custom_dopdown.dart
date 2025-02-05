import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String hint;
  final Function(String) onItemSelected;
  final double borderRadius;
  final double height;
  final double width;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.hint,
    required this.onItemSelected,
    this.borderRadius = 8.0,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          alignment: Alignment.bottomCenter,
          isExpanded: true,
          value: _selectedItem,
          hint: Text(
            widget.hint,
            style: const TextStyle(
              color: Color(0xFFBDBDBD),
              fontSize: 16,
            ),
          ),
          dropdownColor: Color(0xFF55A6C4).withOpacity(0.5),
          elevation: 1,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          items: widget.items.map((category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: widget.height,
                  width: widget.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
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
              setState(() {
                _selectedItem = value;
              });
              widget.onItemSelected(value);
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