import '../../../../core/core_export.dart';

class RepeatTextFontPicker extends StatelessWidget {
  const RepeatTextFontPicker({
    super.key,
    required this.availableFonts,
    required this.selectedFont,
  });

  final List<String> availableFonts;
  final ValueNotifier<String> selectedFont;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ValueListenableBuilder(
        valueListenable: selectedFont,
        builder: (_, font, _) {
          print(font);
          return DropdownButton<String>(
            isExpanded: true,
            value: font,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 28,
            underline: const SizedBox(),
            style: GoogleFonts.getFont(font, fontSize: 16, color: Colors.black),
            onChanged: (String? newFont) {
              if (newFont != null) {
                selectedFont.value = newFont;
              }
            },
            items: availableFonts.map<DropdownMenuItem<String>>((String font) {
                  return DropdownMenuItem<String>(
                    value: font,
                    child: Text(
                      font,
                      style: GoogleFonts.getFont(font, fontSize: 16),
                    ),
                  );
                },
            ).toList(),
          );
        },
      ),
    );
  }
}
