import 'package:flutter/material.dart';

class DropdownComponent extends StatelessWidget {
  final String selectedValue;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const DropdownComponent({
    super.key,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFF9747FF), // Stroke color from your XML
          width: 2,
        ),
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        onChanged: (String? newValue) {
          // Notify the parent widget only if a new value is selected
          if (newValue != null) {
            onChanged(newValue); // Notify parent widget
          }
        },
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        isExpanded: true,
        underline: SizedBox(),
        icon: Icon(Icons.arrow_drop_down),
      ),
    );
  }
}

// class DropdownComponent extends StatelessWidget {
//   final String selectedValue;
//   final List<String> options;
//   final ValueChanged<String?> onChanged;
//
//   const DropdownComponent({
//     Key? key,
//     required this.selectedValue,
//     required this.options,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 362,
//       height: 40,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: Color(0xFF9747FF),
//           width: 2,
//         ),
//       ),
//       child: DropdownButton<String>(
//         value: selectedValue,
//         onChanged: (String? newValue) {
//           if (newValue != null) {
//             onChanged(newValue);
//           }
//         },
//         items: options.map((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//         isExpanded: true,
//         underline: SizedBox(),
//         icon: Icon(Icons.arrow_drop_down),
//       ),
//     );
//   }
// }