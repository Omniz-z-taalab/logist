// import 'package:injectable/injectable.dart';
// import 'package:logger/logger.dart';
//
// import 'index.dart';
//
// @singleton
// class AppLogger {
//   AppLogger() {
//     final Level level = _validateLevel();
//     _logger = Logger(
//       printer: PrettyPrinter(),
//       level: level,
//     );
//   }
//   late Logger _logger;
//
//   Level _validateLevel({Level level = Level.verbose}) {
//     final BuildModes buildMode = BuildMode.getMode();
//     if (buildMode != BuildModes.debug) {
//       level = Level.error;
//     }
//     return level;
//   }
//
//   void verbose(dynamic message) {
//     _logger.v(message);
//   }
//
//   void debug(dynamic message) {
//     _logger.d(message);
//   }
//
//   void info(dynamic message) {
//     _logger.i(message);
//   }
//
//   void warning(dynamic message) {
//     _logger.w(message);
//   }
//
//   void error(dynamic message) {
//     _logger.e(message);
//   }
//
//   void fatalError(dynamic message) {
//     _logger.wtf(message);
//   }
// }
