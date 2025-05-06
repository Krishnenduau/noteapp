import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final bool isPasswordField;
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback? onToggleVisibility;
  final int maxLines;

  const CommonTextField({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.isPasswordField = false,
    required this.controller,
    required this.onChanged,
    this.onToggleVisibility,
    this.maxLines = 1, // default to single-line input
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 16,
        ),
        suffixIcon:
            isPasswordField
                ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: onToggleVisibility,
                )
                : null,
      ),
    );
  }
}
