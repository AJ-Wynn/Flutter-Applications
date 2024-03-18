import 'package:flutter/material.dart';

class FilterPills extends StatefulWidget {
  final Function(String) onSelected;

  const FilterPills({Key? key, required this.onSelected}) : super(key: key);

  @override
  State<FilterPills> createState() => _FilterPillsState();
}

class _FilterPillsState extends State<FilterPills> {
  final List<String> filters = ['All tasks', 'Not started', 'In progress', 'Completed'];
  String selectedFilter = 'All tasks';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(vertical: 8),
      // Creates a scrollable box
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 12),
            // .map() passes each element of a list to a function then new element gets added to resulting list
            ...filters.map((filter) {
              final isSelected = filter == selectedFilter;
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: FilterChip(
                  // if isSelected is true, then this filter pill is highlighted
                  selected: isSelected,
                  label: Text(filter, style: Theme.of(context).textTheme.bodyMedium),
                  selectedColor: const Color(0xFFE8DEF8),
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: isSelected ? Colors.transparent : const Color(0xFF79747E),
                  ),

                  onSelected: (isSelected) {
                    if (isSelected) {
                      // Update the internal data of this object
                      setState(() {
                        selectedFilter = filter;
                      });
                      widget.onSelected(filter);
                    }
                  },
                ),
              );
            }).toList(),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
