import 'package:flutter/material.dart';

class TextFieldAddress extends StatefulWidget {
  final String labelText;
  final onValidate;
  final TextEditingController controller;
  const TextFieldAddress(
      {Key? key,
      required this.labelText,
      required this.onValidate,
      required this.controller})
      : super(key: key);

  @override
  State<TextFieldAddress> createState() => _TextFieldAddressState();
}

class _TextFieldAddressState extends State<TextFieldAddress> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        SizedBox(
          width: 75,
          child: Text(
            widget.labelText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
            child: TextFormField(
          controller: widget.controller,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
          validator: widget.onValidate,
        ))
      ]),
    );
  }
}
