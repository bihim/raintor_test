import 'package:logger/logger.dart';
import 'package:raintor_test/config/di/injector.dart';

final logger = getIt<Logger>();

String convertToJsonString(String input) {
  // Step 1: Add double quotes around keys
  final keyQuoted = input.replaceAllMapped(
    RegExp(r'(\w+):'),
        (match) => '"${match[1]}":',
  );

  // Step 2: Add double quotes around unquoted string values
  final valueQuoted = keyQuoted.replaceAllMapped(
    RegExp(r':\s*([A-Za-z_][\w@.\-]*)'),
        (match) {
      final value = match[1]!;
      // Check if the value is a number, boolean, or null
      if (RegExp(r'^\d+(\.\d+)?$').hasMatch(value) ||
          value == 'true' ||
          value == 'false' ||
          value == 'null') {
        return ': $value';
      } else {
        return ': "$value"';
      }
    },
  );

  return valueQuoted;
}
