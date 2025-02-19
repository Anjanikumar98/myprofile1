import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String hint;
  final Function(String) onItemSelected;
  final double borderRadius;
  final double height;
  final double width;
  final EdgeInsets padding; // ✅ Add padding parameter
  final Color backgroundColor; // ✅ Add background color parameter

  const CustomDropdown({
    super.key,
    required this.items,
    required this.hint,
    required this.onItemSelected,
    this.borderRadius = 8.0,
    required this.height,
    required this.width,
    required this.padding, // ✅ Initialize padding
    required this.backgroundColor, // ✅ Initialize background color
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding, // ✅ Use dynamic padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.backgroundColor, // ✅ Use dynamic background color
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _selectedItem,
          hint: Text(
            widget.hint,
            style: const TextStyle(
              color: Color(0xFFBDBDBD),
              fontSize: 16,
            ),
          ),
          dropdownColor: widget.backgroundColor.withOpacity(0.5),
          items: widget.items.map((category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
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
