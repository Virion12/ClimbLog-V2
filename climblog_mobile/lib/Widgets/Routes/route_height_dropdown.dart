import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeightPickerField extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const HeightPickerField({
    super.key,
    required this.controller,
    this.label = "Height (m)",
  });

  @override
  State<HeightPickerField> createState() => _HeightPickerFieldState();
}

class _HeightPickerFieldState extends State<HeightPickerField> {
  late final List<String> heights;

  @override
  void initState() {
    super.initState();
    heights = List.generate(99, (i) => (2 + i * 0.5).toStringAsFixed(1)); 

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return SizedBox(
              height: 250,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 40,
                scrollController: FixedExtentScrollController(
                  initialItem: heights.indexOf(widget.controller.text),
                ),
                onSelectedItemChanged: (index) {
                  setState(() {
                    widget.controller.text = heights[index];
                  });
                },
                children: heights
                    .map((h) => Center(
                          child: Text(
                            h,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ))
                    .toList(),
              ),
            );
          },
        );
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: widget.label,
            suffixIcon: const Icon(Icons.arrow_drop_down),
          ),
          validator: (v) => v == null || v.isEmpty ? "Select ${widget.label.toLowerCase()}" : null,
        ),
      ),
    );
  }
}
