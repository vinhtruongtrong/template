import 'dart:developer' as developer;

class Logger {
  static void log(String message, {String tag = ''}) {
    developer.log(message, name: tag.isNotEmpty ? tag : (Logger).toString());
  }
}
