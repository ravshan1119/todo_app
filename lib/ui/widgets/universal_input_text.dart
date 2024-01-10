import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class UniversalInputView extends StatefulWidget {
  const UniversalInputView({
    Key? key,
    required this.caption,
    required this.hintText,
    required this.inputType,
    required this.onChanged,
    required this.initialValue,
    this.isBigText = false,
  }) : super(key: key);

  final String caption;
  final bool isBigText;
  final String hintText;
  final String initialValue;
  final TextInputType inputType;
  final ValueChanged<String> onChanged;

  @override
  State<UniversalInputView> createState() => _UniversalInputViewState();
}

class _UniversalInputViewState extends State<UniversalInputView> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    textController.text = widget.initialValue;
    textController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.caption,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
          SizedBox(height: 14.h),
          SizedBox(
            height: widget.isBigText
                ? MediaQuery.of(context).size.height / 3
                : null,
            child: TextField(
              maxLines: widget.isBigText ? 50 : 1,
              inputFormatters: [],
              controller: textController,
              onChanged: widget.onChanged,
              keyboardType: widget.inputType,
              textInputAction: TextInputAction.next,
              cursorHeight: 25,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                hintText: widget.hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 18),
                fillColor: AppColors.C_363636,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.C_979797)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.C_979797)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.C_979797)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.C_979797)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.C_979797)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
