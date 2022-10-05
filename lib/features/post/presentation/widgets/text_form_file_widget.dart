import 'package:flutter/material.dart';

class TextFormFileWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool multipleLiene;
  final String name;
  const TextFormFileWidget({Key? key, required this.controller, required this.multipleLiene, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          controller: controller,
          validator: (val) => val!.isEmpty? "$name can't be empty" : null,
          decoration: InputDecoration(hintText: name),
          minLines: multipleLiene ? 6 : 1,
          maxLines: multipleLiene ? 6 : 1,
        ));
  }
}
