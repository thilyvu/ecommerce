import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String label;
  final String text;
  final int maxLines;
  final bool isEnabled;
  final ValueChanged<String> onChanged;

  const InputWidget({
    Key? key,
    required this.label,
    required this.onChanged,
    this.maxLines = 1,
    this.isEnabled = true,
    required this.text,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: TextEditingController(text: widget.text),
          enabled: widget.isEnabled,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
          onChanged: widget.onChanged,
        )
      ],
    );
  }
}
