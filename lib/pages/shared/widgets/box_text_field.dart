import 'package:cripstv_academy/config/colors.dart';
import 'package:cripstv_academy/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


typedef StringCallback<T> = String? Function(String?);

/// App Themed Customizable TextField
///
/// with default validator,
///
/// To use without default validator, set [validator] value:
/// ```dart
/// validator: (val)=> null,
/// ```
class BoxTextField extends StatefulWidget {
  final bool? readOnly;
  final StringCallback? validator;
  final String? label;
  final bool? obscureText;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final AutovalidateMode? autoValidateMode;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? formatters;

  const BoxTextField({
    super.key,
    this.validator,
    this.label,
    this.obscureText,
    this.onTap,
    this.controller,
    this.readOnly,
    this.textInputAction = TextInputAction.done,
    this.textInputType,
    this.autoValidateMode,
    this.prefix,
    this.suffix,
    this.hint,
    this.maxLines,
    this.maxLength,
    this.onEditingComplete,
    this.focusNode,
    this.onChanged,
    this.minLines,
    this.formatters,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<BoxTextField> {
  late bool hide;
  @override
  void initState() {
    super.initState();
    hide = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final suffixIcon = (widget.obscureText ?? false)
        ? IconButton(
            onPressed: () {
              if (mounted) setState(() => hide = !hide);
            },
            icon: !hide
                ? const Icon(Icons.visibility_outlined,
                    color: CustomColors.grey)
                : const Icon(Icons.visibility_off_outlined,
                    color: CustomColors.grey),
          )
        : widget.suffix;

    return Container(
      decoration: BoxDecoration(
        color: CustomColors.white.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(3)),
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
        onEditingComplete: widget.onEditingComplete,
        autovalidateMode: widget.autoValidateMode,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        readOnly: widget.readOnly ?? false,
        controller: widget.controller,
        onTap: widget.onTap,
        onChanged: widget.onChanged,
        obscureText: hide,
        inputFormatters: widget.formatters,
        minLines: widget.minLines,
        maxLines: widget.maxLines ?? widget.minLines ?? 1,
        validator: widget.validator ?? defaultValidator,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.grey[4]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.grey[4]!.withOpacity(0.5),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: CustomColors.primary,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.error),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColors.error),
          ),
          isDense: false,
          isCollapsed: false,
          contentPadding: EdgeInsets.fromLTRB(10, 5,
              widget.obscureText == null && suffixIcon != null ? 36 : 10, 5),
          labelText: widget.label,
          labelStyle: TextStyles(color: CustomColors.grey[2]).textBodyLarge,
          hintText: widget.hint,
          hintStyle: TextStyles(color: CustomColors.grey[3]).textBodyLarge,
          counterText: '',
          counterStyle: null,
          prefix: widget.prefix,
          suffixIcon: suffixIcon,
          fillColor: CustomColors.grey[2],
        ),
      ),
    );
  }

  String? defaultValidator(String? val) =>
      (val?.isEmpty ?? true) ? "Field cannot be empty" : null;
}
