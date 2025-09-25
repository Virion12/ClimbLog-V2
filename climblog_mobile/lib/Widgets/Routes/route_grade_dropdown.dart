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
          builder: (_) {
            return SizedBox(
              height: 250,
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
