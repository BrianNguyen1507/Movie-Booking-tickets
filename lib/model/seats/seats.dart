class Seat {
  final List<List<int>> seats;
  final String datetime;
  Seat(
    this.seats, {
    required this.datetime,
  });

  factory Seat.fromJson(Map<String, dynamic> jsonData) {
    String datetime = jsonData['time'];
    List<List<int>> parsedSeats = [];
    List<dynamic> seatRows = jsonData['seat'];
    for (var row in seatRows) {
      List<int> parsedRow = [];
      for (var seat in row) {
        parsedRow.add(seat);
      }
      parsedSeats.add(parsedRow);
    }
    return Seat(parsedSeats, datetime: datetime);
  }
}
