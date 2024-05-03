import 'package:bakwan/common/models/base.dart';
import 'package:bakwan/common/style/button.dart';
import 'package:bakwan/common/style/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownForm<T extends BaseModel> extends StatelessWidget {
  final String label;
  final String hint;
  final String noDataHint;
  final Future<List<T>> itemArray;
  final RxInt state;
  final bool isDisabled;

  const CustomDropDownForm({
    super.key,
    required this.label,
    required this.hint,
    required this.noDataHint,
    required this.itemArray,
    required this.state,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isDisabled,
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: context.textTheme.bodySmall,
            ),
            SizedBox(
              height: UIConst.standardGapHeight,
            ),
            FutureBuilder<List<T>>(
              future: itemArray,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return DropdownButtonFormField<int>(
                    value: null,
                    items: snapshot.data!.map((e) {
                      return DropdownMenuItem(
                        value: e.id,
                        child: Text(
                          e.name,
                          style: context.textTheme.bodyMedium,
                        ),
                      );
                    }).toList(),
                    onChanged: isDisabled
                        ? null
                        : (value) {
                            state.value = value!;
                          },
                    hint: Text(
                      hint,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: state.value == 0 ? Colors.black : Colors.grey,
                      ),
                    ),
                    decoration: dropDownButtonDecoration,
                    elevation: 0,
                  );
                } else {
                  return DropdownButtonFormField(
                    value: null,
                    items: const [],
                    onChanged: null,
                    hint: Text(noDataHint),
                    decoration: dropDownButtonDecoration,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFreeTextForm extends StatelessWidget {
  final String label;
  final String hint;
  final RxString state;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  const CustomFreeTextForm({
    super.key,
    required this.label,
    required this.hint,
    required this.state,
    this.controller,
    this.validator,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall,
        ),
        SizedBox(
          height: UIConst.standardGapHeight,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          onChanged: (value) => state.value = value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(UIConst.standardRad),
            ),
            hintText: hint,
            hintStyle: context.textTheme.bodyMedium!.copyWith(
              color: UIConst.hintTextColor,
            ),
          ),
          style: context.textTheme.bodyMedium!.copyWith(
            color: UIConst.formValueTextColor,
          ),
          maxLines: maxLines ?? 1,
        ),
      ],
    );
  }
}
