import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'styles.dart';

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormatter = DateFormat('yyyy-MM-dd');
  final DateTime displayDate = displayFormatter.parse(date);
  final String formatted = serverFormatter.format(displayDate);
  return formatted;
}

String friendlyDate(DateTime date) {
  var displayDate = DateFormat("d MMM \nyyyy").format(date);
  return displayDate;
}

// String friendlyDateStraight(DateTime date) {
//   var displayDate = DateFormat("d MMM yyyy").format(date);
//   return displayDate;
// }

String friendlyDateWithTime(String rawDate) {

  var date = parseDateTime33(rawDate);
  // Format the date
  var displayDate = DateFormat("d MMM yyyy").format(date);

  // Get the time of the day
  var timeOfDay = TimeOfDay.fromDateTime(date).to12Hours();
  // var displayTime = "${timeOfDay.hour}:${timeOfDay.minute}";

  // Append the time of the day to the formatted date
  var displayDateTime = '$displayDate | $timeOfDay';

  return displayDateTime;
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min:00";
  }

  String to12Hours() {
    final hour = this.hour;
    final minute = this.minute;
    final period = hour < 12 ? 'AM' : 'PM';

    // Convert to 12-hour format
    final hourIn12HourFormat = hour == 0 || hour == 12 ? 12 : hour % 12;

    final hourString = hourIn12HourFormat.toString().padLeft(2, "0");
    final minuteString = minute.toString().padLeft(2, "0");

    return "$hourString:$minuteString $period";
  }
}

Future<TimeOfDay> showTime(BuildContext context) async {
  TimeOfDay selectedTime = TimeOfDay.now();
  var timeOfDay = await showTimePicker(
    builder: (BuildContext context, Widget? child) {
      return Theme(data: timePickerTheme(), child: child ?? const Text(""));
    },
    initialTime:
        TimeOfDay(hour: selectedTime.hour, minute: selectedTime.minute),
    context: context,
  );

  timeOfDay = timeOfDay ?? TimeOfDay.now();

  return timeOfDay;
}

bool isLaterThanToday(String? dateString) {
  if (dateString == null) {
    return false;
  }
  // Parse the input date string
  List<String> dateParts = dateString.split('-');
  if (dateParts.length != 3) {
    // Invalid date format
    return false;
  }

  int year = int.tryParse('20${dateParts[0]}') ?? 0;
  int month = int.tryParse(dateParts[1]) ?? 0;
  int day = int.tryParse(dateParts[2]) ?? 0;

  DateTime inputDate = DateTime(year, month, day);

  // Get today's date
  DateTime today = DateTime.now();

  // Compare the input date with today's date
  return inputDate.isAfter(today);
}

String formatHumanReadableDate(DateTime date) {
  DateFormat format = DateFormat("EE, MMM d, y");
  return format.format(date);
}

String parseDateString(String? dateString) {
  try {
    if (dateString == null) {
      // Handle null case as needed
      throw const FormatException('Date string is null');
    }

    return friendlyDateWithTime(dateString);
  } catch (e) {
    print('Error parsing date: $e');
    // You can choose to handle the error in a different way if needed
    return "";
  }
}

DateTime parseDateTime(String dateTimeString) {
  DateFormat format = DateFormat();

  try {
    DateTime dateTime = format.parse(dateTimeString);

    return dateTime;
  } catch (e) {
    print("Error parsing date-time: $e");
    return DateTime.fromMillisecondsSinceEpoch(1641031200000, isUtc: true);
  }
}

DateTime parseDateTime33(String dateTimeString) {
  String modifiedString = addSpaceToDate(dateTimeString);

  DateFormat format = DateFormat("yyyy-MM-dd hh:mm aa");
  return format.parse(modifiedString);

}

String addSpaceToDate(String dateTimeString) {
  return "${dateTimeString.substring(0, 9 + 1)} ${dateTimeString.substring(9 + 1)}";
}
