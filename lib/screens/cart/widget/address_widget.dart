import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  const AddressWidget(
      {Key? key,
      required this.name,
      required this.phone,
      required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("CUSTOMER INFO", style: Theme.of(context).textTheme.headline5),
        _buildAddressInfo("Name: ", name),
        _buildAddressInfo("Phone: ", phone),
        _buildAddressInfo("Address: ", address),
      ],
    );
  }

  Padding _buildAddressInfo(String label, String text) => Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(text, style: TextStyle(fontSize: 15))
        ],
      ));
}
