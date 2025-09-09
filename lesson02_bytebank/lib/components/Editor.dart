import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String alias;
  final IconData? icon;

  const Editor({
    super.key,
    required this.controller,
    required this.label,
    required this.alias,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 20.0),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: alias,
        ),
      ),
    );
  }
}
