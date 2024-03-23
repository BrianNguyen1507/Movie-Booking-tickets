import 'package:flutter/material.dart';
import 'package:movie_booking/Views/selectionSeats/selectionSeats.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/model/theater.dart';
import 'package:movie_booking/services/fetchThreater.dart';

class SelectionTheater extends StatefulWidget {
  final Film movie;

  const SelectionTheater({Key? key, required this.movie}) : super(key: key);

  @override
  _SelectionTheaterState createState() => _SelectionTheaterState();
}

class _SelectionTheaterState extends State<SelectionTheater> {
  late List<Theater> theaters = [];
  String? selectedDate;
  int? selectedTheaterNumber;
  String? selectedTheaterTime;

  @override
  void initState() {
    super.initState();
    fetchTheaterData();
  }

  Future<void> fetchTheaterData() async {
    try {
      FetchTheater fetchTheater = FetchTheater();
      List<Theater> fetchedTheaters =
          await fetchTheater.fetchTheaterData(widget.movie.id);

      setState(() {
        theaters = fetchedTheaters;
      });
    } catch (e) {
      print('Error fetching theater data: $e');
    }
  }

  List<Widget> renderTimesForSelectedTheater(List<Theater> theaters) {
    if (selectedTheaterNumber == null || selectedDate == null) {
      return [];
    }

    List<Widget> theaterTimes = [];
    Set<String> selectedTimes = <String>{};

    List<Theater> filteredTheaters = theaters
        .where((theater) =>
            theater.date == selectedDate &&
            theater.number == selectedTheaterNumber)
        .toList();

    for (Theater theater in filteredTheaters) {
      bool isSelected = selectedTheaterTime == theater.time;

      theaterTimes.add(
        Card(
          color: isSelected ? Colors.grey : null,
          child: InkWell(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedTheaterTime = null;
                } else {
                  selectedTheaterTime = theater.time;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SelectionSeats(film: widget.movie,
                        theater: theater,
                      ),
                    ),
                  );
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                theater.time,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
        ),
      );

      if (isSelected) {
        selectedTimes.add(theater.time);
      }
    }

    if (selectedTimes.length > 1) {
      setState(() {
        selectedTheaterTime = null;
      });
    }

    return theaterTimes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      
        title: Text(
          widget.movie.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: dateSelecetion(theaters),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (selectedDate != null)
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ...renderTheaterNumbers(theaters),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  List<Widget> dateSelecetion(List<Theater> theaters) {
    Set<String> uniqueDates = theaters.map((theater) => theater.date).toSet();
    List<Widget> dateRow = [];

    for (String date in uniqueDates) {
      dateRow.add(
        Card(
          color: selectedDate == date ? Colors.grey : null,
          child: InkWell(
            onTap: () {
              setState(() {
                selectedDate = selectedDate == date ? null : date;
                selectedTheaterNumber = null;
                selectedTheaterTime = null;
              });
            },
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(date,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
            ),
          ),
        ),
      );
    }
    return dateRow;
  }

  List<Widget> renderTheaterNumbers(List<Theater> theaters) {
    if (selectedDate == null) {
      return [];
    }

    Set<int> theaterNumbers = {};
    for (Theater theater in theaters) {
      if (theater.date == selectedDate) {
        theaterNumbers.add(theater.number);
      }
    }

    List<Widget> theaterWidgets = [];
    for (int number in theaterNumbers) {
      List<Theater> theatersForNumber = theaters
          .where((theater) =>
              theater.date == selectedDate && theater.number == number)
          .toList();

      List<Widget> timeWidgets =
          renderTimesForSelectedTheater(theatersForNumber);

      Widget timeRow = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: timeWidgets,
      );

      ExpansionTile theaterWidget = ExpansionTile(
        iconColor: Colors.black,
        dense: true,
        title: Row(children: [
          const Icon(Icons.play_circle_fill),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Theater: $number',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ]),
        children: [timeRow],
        onExpansionChanged: (isOpen) {
          setState(() {
            if (isOpen) {
              selectedTheaterNumber = number;
            } else {
              selectedTheaterNumber = null;
              selectedTheaterTime = null;
            }
          });
        },
      );
      theaterWidgets.add(theaterWidget);
    }

    return theaterWidgets;
  }
}
