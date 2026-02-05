import 'package:flutter/material.dart';

import 'custom_chip.dart';

class ListOfChips extends StatefulWidget {
  const ListOfChips({super.key});

  @override
  State<ListOfChips> createState() => _ListOfChipsState();
}

class _ListOfChipsState extends State<ListOfChips> {
  String? _selectedLabel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomChip(
            label: 'All',
            isSelected: _selectedLabel == 'All',
            onSelected: (isSelected) {
              setState(() {
                _selectedLabel = isSelected ? 'All' : null;
              });
            },
          ),
          const SizedBox(width: 8),
          CustomChip(
            label: 'Breakfast',
            isSelected: _selectedLabel == 'Breakfast',
            onSelected: (isSelected) {
              setState(() {
                _selectedLabel = isSelected ? 'Breakfast' : null;
              });
            },
          ),
          const SizedBox(width: 8),
          CustomChip(
            label: 'Lunch',
            isSelected: _selectedLabel == 'Lunch',
            onSelected: (isSelected) {
              setState(() {
                _selectedLabel = isSelected ? 'Lunch' : null;
              });
            },
          ),
          const SizedBox(width: 8),
          CustomChip(
            label: 'Dinner',
            isSelected: _selectedLabel == 'Dinner',
            onSelected: (isSelected) {
              setState(() {
                _selectedLabel = isSelected ? 'Dinner' : null;
              });
            },
          ),
          const SizedBox(width: 8),
          CustomChip(
            label: 'Snacks',
            isSelected: _selectedLabel == 'Snacks',
            onSelected: (isSelected) {
              setState(() {
                _selectedLabel = isSelected ? 'Snacks' : null;
              });
            },
          ),
          const SizedBox(width: 8),
          CustomChip(
            label: 'Desserts',
            isSelected: _selectedLabel == 'Desserts',
            onSelected: (isSelected) {
              setState(() {
                _selectedLabel = isSelected ? 'Desserts' : null;
              });
            },
          ),
          const SizedBox(width: 8),
          CustomChip(
            label: 'Drinks',
            isSelected: _selectedLabel == 'Drinks',
            onSelected: (isSelected) {
              setState(() {
                _selectedLabel = isSelected ? 'Drinks' : null;
              });
            },
          ),
        ],
      ),
    );
  }
}

