class DateTimeModel {
  final String day;
  final String number;
  List<String> availableTimes;
  String selectedTime;
  // Add selectedTime property

  DateTimeModel({
    required this.day,
    required this.number,
    required this.availableTimes,
    required this.selectedTime,
  });

  static List<DateTimeModel> listDate = [
    DateTimeModel(
        day: 'Sunday',
        number: '1',
        availableTimes: ['11:30 AM', '3:30 PM', '7:30 PM'],
        selectedTime: '11:30 AM'),
    DateTimeModel(
        day: 'Monday',
        number: '2',
        availableTimes: ['11:30 AM', '12:50 AM', '3:30 PM'],
        selectedTime: '11:30 AM'),
    DateTimeModel(
        day: 'Tueday',
        number: '3',
        availableTimes: ['7:30 PM', '9:00 PM', '10:30 PM'],
        selectedTime: '7:30 PM'),
    DateTimeModel(
        day: 'Wednesay',
        number: '4',
        availableTimes: ['11:30 AM', '3:30 PM', '7:30 PM'],
        selectedTime: '11:30 AM'),
    DateTimeModel(
        day: 'Thusday',
        number: '5',
        availableTimes: ['11:30 AM', '12:50 AM', '3:30 PM'],
        selectedTime: '11:30 AM'),
    DateTimeModel(
        day: 'Friday',
        number: '6',
        availableTimes: ['7:30 PM', '9:00 PM', '10:30 PM'],
        selectedTime: '7:30 PM'),
    DateTimeModel(
        day: 'Satuday',
        number: '7',
        availableTimes: ['11:30 AM', '3:30 PM', '7:30 PM'],
        selectedTime: '11:30 AM'),
  ];

  static List<String> listTime = [
    '11:30 AM',
    '12:50 AM',
    '3:30 PM',
    '7:30 PM',
    '9:00 PM',
    '10:30 PM',
  ];

  DateTimeModel copyWith({
    String? day,
    String? number,
    List<String>? availableTimes,
    String? selectedTime,
  }) {
    return DateTimeModel(
      day: day ?? this.day,
      number: number ?? this.number,
      availableTimes: availableTimes ?? this.availableTimes,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}
