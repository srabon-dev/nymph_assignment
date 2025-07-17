import 'package:share_plus/share_plus.dart';

Future<void> shareRepeatText({required String text}) async {
  try {
    await SharePlus.instance.share(ShareParams(text: text));
  } catch (_) {

  }
}
