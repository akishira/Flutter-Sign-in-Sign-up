import 'package:flutter/material.dart';
import 'global.dart';

class CustomTextformfield extends StatefulWidget {
  const CustomTextformfield({
    super.key,
    required this.label,
    this.hintText,
    this.validator,
    this.onChanged,
    this.controller,
    this.initialValue,
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.readOnly,
    this.onTap,
    this.maxLines,
    this.suffix,
    this.obscureText,
  });

  final String label;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? readOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final Widget? suffix;
  final bool? obscureText;

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.label,
        style: TextStyle(
          color: _errorText != null ? Colors.red : AppColors.backgroundColor,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style: const TextStyle(color: AppColors.textColor),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: widget.hintText,
              suffix: widget.suffix,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            initialValue: widget.initialValue,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            validator: widget.validator,
            onTap: widget.onTap,
            readOnly: widget.readOnly ?? false,
            maxLines: widget.maxLines,
            obscureText: widget.obscureText ?? false,
          ),
        ],
      ),
    );
  }
}
