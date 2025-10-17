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
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (_) {
            return SizedBox(
              height: 250,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Expanded(
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
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
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
            labelStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
            filled: true,
            fillColor: const Color(0xFFF8F9FA),
            suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[200]!, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF00a896), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          validator: (v) => v == null || v.isEmpty ? "Select ${widget.label.toLowerCase()}" : null,
        ),
      ),
    );
  }
}