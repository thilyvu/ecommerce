import 'package:flutter/material.dart';

class TextFieldCheckout extends StatefulWidget {
  final String labelText;
  final onValidate;
  final TextEditingController controller;
  const TextFieldCheckout(
      {Key? key,
      required this.labelText,
      required this.onValidate,
      required this.controller})
      : super(key: key);

  @override
  State<TextFieldCheckout> createState() => _TextFieldCheckoutState();
}

class _TextFieldCheckoutState extends State<TextFieldCheckout> {
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
