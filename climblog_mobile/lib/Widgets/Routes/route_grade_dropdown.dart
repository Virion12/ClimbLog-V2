import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradePickerField extends StatefulWidget {
  final TextEditingController controller;
  final List<String> grades;
  final String label;

  const GradePickerField({
    super.key,
    required this.controller,
    required this.grades,
    this.label = "Grade",
  });

  @override
  State<GradePickerField> createState() => _GradePickerFieldState();
}

class _GradePickerFieldState extends State<GradePickerField> {
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
                        initialItem: widget.grades.indexOf(widget.controller.text),
                      ),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          widget.controller.text = widget.grades[index];
                        });
                      },
                      children: widget.grades
                          .map((g) => Center(
                                child: Text(
                                  g,
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