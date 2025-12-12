import 'package:flutter/material.dart';

class DeliveryFilter extends StatelessWidget {
  final String selected;
  final Function(String) onFilterChange;

  const DeliveryFilter({
    super.key,
    required this.selected,
    required this.onFilterChange,
  });

  Widget _filterButton(String label) {
    final isSelected = label == selected;

    return GestureDetector(
      onTap: () => onFilterChange(label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _filterButton("All"),
        _filterButton("Pending"),
        _filterButton("Completed"),
        _filterButton("Cancelled"),
      ],
    );
  }
}
