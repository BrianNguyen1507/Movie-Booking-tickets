import 'dart:convert';

class Theater {
  final String date;
  final String time;
  final int col;
  final int row;
  final int number;
  final int filmID;

  Theater({
    required this.date,
    required this.time,
    required this.col,
    required this.row,
    required this.number,
    required this.filmID, required List seat,
  });

  factory Theater.fromJson(Map<String, dynamic> jsonData) {
    String datetime = jsonData['time'];
    List<String> splitDatetime = datetime.split(' ');
    String date = splitDatetime[0];
    String time = splitDatetime[1];

    int column = jsonData['column'];
    int row = jsonData['row'];
    int numberTheater = jsonData['numberThreater'];
    int film = jsonData['film'];

    return Theater(
      time: time,
      date: date,
      col: column,
      row: row,
      number: numberTheater,
      filmID: film, seat: [],
    );
  }

  get seat => null;
}
