import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validation;
  final bool isObsecure;
  final int? maxLines;
  final TextInputType? type;
  final ValueChanged<String>? onChanged;
  const CustomTextField({
    super.key,
    required this.title,
    this.prefix,
    this.suffix,
    this.controller,
    this.validation,
    this.isObsecure = false,
    this.maxLines = 1,
    this.type,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      style: Theme.of(context).textTheme.headlineLarge,
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: Theme.of(context).splashColor,
      keyboardType: type,
      maxLines: maxLines,
      obscureText: isObsecure,
      validator: validation,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        hintText: title,
        hintStyle: Theme.of(context).textTheme.headlineLarge,
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(start: 16, end: 10),
          child: prefix,
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0),
        suffixIcon: suffix,
        suffixIconConstraints: BoxConstraints(minWidth: 0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).splashColor),
          borderRadius: .circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).splashColor),
          borderRadius: .circular(16),
        ),
      ),
    );
  }
}
