import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  // Convert DateTime to String
  String stringDate = date.toLocal().toString().split(' ')[0];

  // Parse the input date string
  DateTime parsedDate = DateTime.parse(stringDate);

  // Define the output date format
  DateFormat formatter = DateFormat('EEEE, MMM d');

  // Format the parsed date
  String formattedDate = formatter.format(parsedDate);

  return formattedDate;
}
