// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.hint,
    this.prefix,
    this.sufix,
    this.obscure = false,
    this.textInputType,
    required this.onChanged,
    this.enabled,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? sufix;
  final bool obscure;
  final TextInputType? textInputType;
  final Function(String) onChanged;
  final bool? enabled;


    
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(32),
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            prefixIcon: prefix,
            suffixIcon: sufix),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}

