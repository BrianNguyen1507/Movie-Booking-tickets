class Seat {
  final String id;
  bool isReserved;
  bool isSelected;
  String day;
  String time;

  Seat(this.id,
      {this.isReserved = false,
      this.isSelected = false,
      required this.day,
      required this.time});
}
