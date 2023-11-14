import 'package:intl/intl.dart';

extension DateExtension on String {
  String? convertToFormat({
    String currentFormat = 'yyyy-MM-dd',
    String toFormat = 'MM/dd/yyyy',
  }) {
    var inputFormat = DateFormat(currentFormat);
    var inputDate = inputFormat.parse(this);
    var outputFormat = DateFormat(toFormat);
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}
