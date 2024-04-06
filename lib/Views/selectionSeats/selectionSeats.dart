import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_booking/Views/Finish_payment/detail_selection.dart';
import 'package:movie_booking/Views/selectionSeats/minutesRemainingConfig.dart';
import 'package:movie_booking/Views/selectionTheater/Alert.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/model/seats/seats.dart';
import 'package:movie_booking/model/theater/theater.dart';
import 'package:movie_booking/services/fetching/fetchSeater.dart';

class SelectionSeats extends StatefulWidget {
  final Theater theater;
  final Film film;
  const SelectionSeats({Key? key, required this.theater, required this.film})
      : super(key: key);

  @override
  State<SelectionSeats> createState() => _SelectionSeatsState();
}

class _SelectionSeatsState extends State<SelectionSeats> {
  late List<Seat> seats = [];
  bool isLoading = false;
  late List<List<int>> contain = [];
  List<String> selectedSeats = [];
  late TransformationController _transformationController;

  late double sumTotal;
  late Timer _timer;
  int _secondsRemaining = setMinutes * 60;

  @override
  void initState() {
    super.initState();
    fetchDataSeats();
    _startTimer();
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _resetTransformation() {
    _transformationController.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;

    String minutesStr = (minutes < 10 ? '0' : '') + minutes.toString();
    String secondsStr = (seconds < 10 ? '0' : '') + seconds.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Selection Seats',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '$minutesStr:$secondsStr',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: tvScreen(),
                        ),
                      ),
                      Center(
                        child: InteractiveViewer(
                          panEnabled: true,
                          boundaryMargin: const EdgeInsets.all(100),
                          minScale: 0.1,
                          maxScale: 5.0,
                          constrained: true,
                          transformationController: _transformationController,
                          child: renderSeats(),
                          onInteractionEnd: (_) {
                            _resetTransformation();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: renderNote(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: renderConfirmPayment(context),
          ),
        ],
      ),
    );
  }

  Future<void> fetchDataSeats() async {
    setState(() {
      isLoading = true;
    });
    try {
      String date = '${widget.theater.date} ${widget.theater.time}';
      Seat? fetchedSeats =
          await FetchSeats.fetchDataSeats(date, widget.theater.number);
      if (fetchedSeats != null) {
        setState(() {
          seats = fetchedSeats.seats.cast<Seat>();
          contain = fetchedSeats.seats;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget renderConfirmPayment(BuildContext context) {
    int numberSeats = selectedSeats.length;
    double price = widget.film.price;
    double total = price * numberSeats;
    sumTotal = total;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: const Border(top: BorderSide(color: Colors.grey)),
        color: Colors.grey.shade500,
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
                    Row(
                      children: [
                        Text(
                          widget.theater.date,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          ' | ${widget.theater.time}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Text(
                      'Seats: ${selectedSeats.length}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(bottom: 5, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Text(
                        '$total',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10.0,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  elevation: 15.0,
                ),
                onPressed: () {
                  if (selectedSeats.isNotEmpty && total > 0.0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SummaryPaymentPage(
                            total: sumTotal,
                            film: widget.film,
                            theater: widget.theater,
                            selectedSeats: selectedSeats,
                          );
                        },
                      ),
                    );
                  } else {
                    ShowAlert.showAlertDialog(context);
                  }
                },
                child: const Text(
                  'FINISH PAYMENT',
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

  Widget renderNote() {
    return Center(
      child: Row(
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
              const Text('Not available', style: TextStyle(color: Colors.black))
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
              const Text('Available', style: TextStyle(color: Colors.black))
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
              const Text('Selected', style: TextStyle(color: Colors.black))
            ],
          ),
        ],
      ),
    );
  }

  Widget tvScreen() {
    return Column(
      children: [
        Container(
          height: 10,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        ),
        const Text(
          'Screen',
          style: TextStyle(
              color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget renderSeats() {
    List<String> rowLabels = List.generate(
      widget.theater.row,
      (index) => String.fromCharCode(65 + index),
    );
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.theater.row,
              (rowIndex) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.theater.col,
                    (colIndex) {
                      int value =
                          contain.isNotEmpty ? contain[rowIndex][colIndex] : 0;
                      Color color = value == 1 ? Colors.red : Colors.green;
                      String seatId = '${rowLabels[rowIndex]} $colIndex';
                      return TextButton(
                        onPressed: () {
                          selectionSeats(seatId);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: selectedSeats.contains(seatId)
                              ? Colors.orange
                              : color,
                          padding: const EdgeInsets.all(10.0),
                          minimumSize: const Size(30.0, 30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          seatId,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void selectionSeats(String seatId) {
    List<String> rowLabels = List.generate(
      widget.theater.row,
      (index) => String.fromCharCode(65 + index),
    );

    setState(() {
      int rowIndex = rowLabels.indexOf(seatId.substring(0, 1));
      int colIndex = int.parse(seatId.substring(2));

      if (contain.isNotEmpty && contain[rowIndex][colIndex] == 1) {
        return;
      }
      if (selectedSeats.contains(seatId)) {
        selectedSeats.remove(seatId);
      } else {
        selectedSeats.add(seatId);
      }
      selectedSeats.sort((a, b) {
        String rowA = a.substring(0, 1);
        String rowB = b.substring(0, 1);
        int colA = a.runes.elementAt(1);
        int colB = b.runes.elementAt(1);
        if (colA == colB) {
          return rowA.compareTo(rowB);
        } else {
          return colA.compareTo(colB);
        }
      });
    });
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      setState(() {
        if (_secondsRemaining == 0) {
          timer.cancel();
          ShowAlert.showAlertDialog(context);
        } else {
          _secondsRemaining--;
        }
      });
    });
  }
}
