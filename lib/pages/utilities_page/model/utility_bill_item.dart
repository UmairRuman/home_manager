extension DateTimeString on DateTime {
  String convertToString() {
    String monthInEnglish = switch (month) {
      1 => 'January',
      2 => 'February',
      3 => 'March',
      4 => 'August',
      5 => 'May',
      6 => 'June',
      7 => 'July',
      8 => 'August',
      9 => 'September',
      10 => 'Octuber',
      11 => 'November',
      12 => 'December',
      _ => 'error'
    };

    String dayInProperFormat = day < 10 ? '0$day' : '$day';

    return '$dayInProperFormat  $monthInEnglish  $year';
  }
}

class UtiltityBillItem {
  DateTime dateTime;
  String billType;
  double paidAmount;
  UtiltityBillItem({
    required this.dateTime,
    required this.billType,
    required this.paidAmount,
  });
}
