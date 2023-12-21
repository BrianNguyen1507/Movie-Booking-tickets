import 'package:flutter/material.dart';
import 'package:movie_booking/Views/Finish_payment/finish_payment_screen.dart';
import 'package:movie_booking/Views/movies_detail/movieDetail_screen.dart';
import 'package:movie_booking/model/seats/seats.dart';
import 'package:movie_booking/model/datetime/datetime.dart';

class SeatSelectionScreen extends StatefulWidget {
  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  DateTimeModel selectedDateTime = DateTimeModel.listDate.first;

  late List<List<Seat>> seatRows = [[]]; // Initialize to an empty list

  @override
  void initState() {
    super.initState();
    seatRows = generateSeats();
  }

  Map<String, int> countSeatOccurrences(List<String> seats) {
    Map<String, int> seatCounts = {};
    for (var seatId in seats) {
      seatCounts[seatId] = (seatCounts[seatId] ?? 0) + 1;
    }
    return seatCounts;
  }

  void handleTimeSelection(String time) {
    setState(() {
      selectedDateTime = selectedDateTime.copyWith(selectedTime: time);
      seatRows = generateSeats();
    });
  }

  void handleDateSelection(DateTimeModel date) {
    setState(() {
      selectedDateTime = date.copyWith();
      seatRows = generateSeats();
    });
  }

  List<List<Seat>> generateSeats() {
    return List.generate(
      6,
      (rowIndex) => List.generate(
        6,
        (seatIndex) {
          final seatId =
              '${String.fromCharCode(65 + rowIndex)}${seatIndex + 1}';
          final day = selectedDateTime.day;
          final time = selectedDateTime.selectedTime; // Use selectedTime
          final isReserved = isSeatReserved(seatId, day, time);
          return Seat(
            seatId,
            isReserved: isReserved,
            day: day,
            time: time,
          );
        },
      ),
    );
  }

//dump data seats not available
  bool isSeatReserved(String seatId, String day, String time) {
    if ((day == 'Sunday' &&
            time == '11:30 AM' &&
            (seatId == 'A1' || seatId == 'A2' || seatId == 'A3')) ||
        (day == 'Monday' &&
            time == '11:30 AM' &&
            (seatId == 'D1' || seatId == 'D2' || seatId == 'D3'))) {
      return true;
    }
    return false;
  }

  List<String> getSelectedSeats() {
    List<String> selectedSeats = [];
    for (var row in seatRows) {
      for (var seat in row) {
        if (seat.isSelected) {
          selectedSeats.add(seat.id);
        }
      }
    }
    return selectedSeats;
  }

  Widget renderSelectDate(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: DateTimeModel.listDate.map((date) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 30,
              child: ElevatedButton(
                onPressed: () => handleDateSelection(date),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.grey[800],
                ),
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget renderSelectTime(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: selectedDateTime.availableTimes.map((time) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () => handleTimeSelection(time),
            style: ElevatedButton.styleFrom(
              backgroundColor: time == selectedDateTime.selectedTime
                  ? Colors.orange
                  : Colors.grey[800],
            ),
            child: Text(time),
          ),
        );
      }).toList(),
    );
  }

  Widget renderScreenTv(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 400.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Colors.black,
              width: 10.0,
            ),
          ),
          child: const Center(
            child: Text(
              'Screen',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget renderSeats(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: seatRows.length,
        itemBuilder: (context, rowIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: seatRows[rowIndex].map((seat) {
              return InkWell(
                onTap: () {
                  if (!seat.isReserved) {
                    setState(() {
                      seat.isSelected = !seat.isSelected;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: seat.isSelected
                        ? Colors.orange
                        : seat.isReserved
                            ? Colors.red
                            : Colors.green,
                  ),
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      seat.id,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget renderNote(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5, left: 10),
              height: 20,
              width: 20,
              decoration: const BoxDecoration(color: Colors.red),
            ),
            const Text('Not available', style: TextStyle(color: Colors.white))
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5, left: 10),
              height: 20,
              width: 20,
              decoration: const BoxDecoration(color: Colors.green),
            ),
            const Text('Available', style: TextStyle(color: Colors.white))
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5, left: 10),
              height: 20,
              width: 20,
              decoration: const BoxDecoration(color: Colors.orange),
            ),
            const Text('Selected', style: TextStyle(color: Colors.white))
          ],
        ),
      ],
    );
  }

  Widget renderConfirmPayment(BuildContext context) {
    List<String> selectedSeats = getSelectedSeats();
    int totalSelectedSeats = selectedSeats.length;
    double numseat = 13.0; //dummy toltal of tickets
    double total = numseat * totalSelectedSeats;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
        color: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date: ${selectedDateTime.day}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Text(
                      'Time: ${selectedDateTime.selectedTime}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Text(
                      'Seats: $totalSelectedSeats',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(bottom: 5, top: 10),
                  child: Text(
                    ' \$$total',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 40.0,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 41, 189, 58),
                  elevation: 0.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SummaryPaymentPage(),
                    ),
                  );
                }, //event to payment session selected
                child: const Text(
                  'Finish Payment',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 1,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(
            //   context,
            //   MaterialPageRoute(builder: (context) => const MovieDetailPage(filmId: film.id,)),
            // );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Session Selection'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Date Selection
          renderSelectDate(context),
          // Time Selection
          renderSelectTime(context),
          renderNote(context),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          //TV Screen
          renderScreenTv(context),
          // Seat Selection
          renderSeats(context),
          // Selected Information
          renderConfirmPayment(context),
        ],
      ),
    );
  }
}
