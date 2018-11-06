import 'package:flutter/services.dart';

class CommonTool {
  static copyToClipboard(final String text) {
    if (text == null) return;
    Clipboard.setData(new ClipboardData(text: text));
  }
}
