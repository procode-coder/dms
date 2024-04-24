import 'package:logger/logger.dart';

class Log {
  static Logger logger = Logger();

  static void verbose(String message, [dynamic error]) {
    logger.t(message);
  }

  static void debug(String message, [dynamic error]) {
    logger.d(message);
  }

  static void info(String message, [dynamic error]) {
    logger.i(message);
  }

  static void warning(String message, [dynamic error]) {
    logger.w(message);
  }

  static void error(String message, [dynamic error]) {
    logger.e(message);
  }

  static void failure(String message, [dynamic error]) {
    logger.f(message);
  }
}
