import 'package:flutter/services.dart';

import '../../../../core/core_export.dart';

class RepeatTextInputsActionWidget extends StatelessWidget {
  const RepeatTextInputsActionWidget({
    super.key,
    required this.onTap,
    required this.repeatText,
    required this.repeatNumber,
  });

  final VoidCallback onTap;
  final TextEditingController repeatText;
  final TextEditingController repeatNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        TextFormField(
          controller: repeatText,
          maxLines: 5,
          minLines: 3,
          keyboardType: TextInputType.text,
          style: Theme.of(context).textTheme.titleSmall,
          decoration: const InputDecoration(
            hintText: "Enter repeat text",
          ),
          validator: (value) {
            final trimmed = value?.trim() ?? '';
            if (trimmed.isEmpty) {
              return "Please enter repeat text";
            }
            return null;
          },
        ),
        TextFormField(
          controller: repeatNumber,
          keyboardType: TextInputType.number,
          style: Theme.of(context).textTheme.titleSmall,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(5),
          ],
          decoration: const InputDecoration(
            hintText: "Number",
          ),
          validator: (value) {
            final trimmed = value?.trim() ?? '';
            if (trimmed.isEmpty) {
              return "Please enter repeat number";
            }

            final parsedValue = int.tryParse(trimmed);
            if (parsedValue == null) {
              return "Please enter valid number";
            }
            if (parsedValue < 2 || parsedValue > 10000) {
              return "Please enter number between 2 and 10,000";
            }
            return null;
          },
        ),
        ElevatedButton(
          onPressed: onTap,
          child: const Text("Run"),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
