import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:cripstv_academy/config/config.dart';

import '../shared.dart';

class CustomSearchBar extends HookWidget {
  final String? text;
  final Function(String?)? onSearch;
  final VoidCallback? onFieldTap;
  final VoidCallback? onFilterTap;
  final VoidCallback? onClear;
  const CustomSearchBar({
    Key? key,
    this.onSearch,
    this.text,
    this.onFieldTap,
    this.onFilterTap,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchText = useTextEditingController();
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onTap: onFieldTap,
            controller: searchText,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.grey[4]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: CustomColors.grey[2]!.withOpacity(0.5),
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
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5
              ),
              labelText: null,
              labelStyle: null,
              hintText: text ?? "Search for an event",
              hintStyle: TextStyles(color: CustomColors.grey[3]).textBodyLarge,
              counterText: '',
              counterStyle: null,
              filled: true,
              fillColor: const Color(0xFFF3F3F3),
              suffixIcon: IconButton(
                  onPressed: () {
                    searchText.clear();
                    onClear?.call();
                  },
                  icon: const Icon(
                      Icons.close,
                      color: CustomColors.grey
                  ),
                  padding: EdgeInsets.zero,
                  iconSize: 21,
                ),
            ),
            readOnly: onFieldTap != null,
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (text) {
              if (onSearch != null) onSearch!(text.trim());
            },
          ),
        ),

        const SizedBox(width: 10),

        GestureDetector(
          onTap: () {
            if (onSearch != null) onSearch!(searchText.text.trim());
          },
          child: Container(
            height: Constants.screenHeight * 0.06,
            width: Constants.screenHeight * 0.06,
            decoration: const BoxDecoration(
                color: CustomColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: const SizedBox(
              height: 18,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SVG(
                  "assets/icons/search.svg",
                  color: CustomColors.white,
                  height: 18,
                  width: 18,
                ),
              ),
            )
          ),
        ),
      ],
    );
  }

}
