import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    this.label,
    this.isSelected = false,
    this.onSelected,
  });

  final String? label;
  final bool isSelected;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected?.call(!isSelected);
      },
      child: Chip(
        label: Text(
          label ?? '',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isSelected ? Colors.deepPurpleAccent : Colors.white,
      ),
    );
  }
}