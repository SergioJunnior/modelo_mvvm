import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldComponent extends StatefulWidget {
  final String? hintText;
  final String? initialValue;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final TextEditingController? controller;
  final Color? inputColor;
  final double? borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final TextInputType? keyBoardType;

  const TextFieldComponent({
    super.key,
    this.inputColor,
    this.hintText,
    this.borderRadius,
    this.inputFormatters,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.obscureText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.keyBoardType,
  });

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          inputFormatters: widget.inputFormatters ?? [],
          initialValue: widget.initialValue,
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.obscureText ?? false,
          keyboardType: widget.keyBoardType,
          decoration: InputDecoration(
            fillColor: widget.inputColor ?? Colors.transparent,
            filled: true,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.deepPurple),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
              borderSide: BorderSide(
                color: widget.inputColor ?? Colors.deepPurpleAccent,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.suffixIcon != null
                    ? IconButton(
                      onPressed: widget.onSuffixIconPressed,
                      icon: widget.suffixIcon!,
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
