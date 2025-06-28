import 'package:flutter/material.dart';

enum InputFieldType { email, password, name, phone, custom }

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool enabled;
  final bool autoFocus;
  final void Function(String)? onChanged;
  final InputFieldType type;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.obscureText,
    this.validator,
    this.controller,
    this.enabled = true,
    this.autoFocus = false,
    this.onChanged,
    this.type = InputFieldType.custom,
    this.suffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.obscureText ?? (widget.type == InputFieldType.password);
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) return 'Campo requerido';

    switch (widget.type) {
      case InputFieldType.name:
        if (value.length < 3) return 'Nombre inválido';
        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
          return 'Nombre solo debe contener letras';
        }
        break;

      case InputFieldType.email:
        final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value)) return 'Correo inválido';
        break;
      case InputFieldType.password:
        if (value.length < 6) return 'Mínimo 6 caracteres';
        break;
      case InputFieldType.phone:
        if (value.length < 8) return 'Teléfono inválido';
        break;
      default:
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType:
          widget.keyboardType ??
          (widget.type == InputFieldType.phone
              ? TextInputType.phone
              : TextInputType.text),
      obscureText: isObscured,
      enabled: widget.enabled,
      autofocus: widget.autoFocus,
      onChanged: widget.onChanged,
      validator: widget.validator ?? _defaultValidator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.icon, color: Colors.black87),
        suffixIcon:
            widget.type == InputFieldType.password
                ? IconButton(
                  icon: Icon(
                    isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () => setState(() => isObscured = !isObscured),
                )
                : widget.suffixIcon,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
