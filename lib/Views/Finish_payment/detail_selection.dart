import 'package:flutter/material.dart';
import 'package:movie_booking/Views/Finish_payment/comfirmPayment.dart';
import 'package:movie_booking/Views/selectionTheater/Alert.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/model/theater/theater.dart';
import 'package:movie_booking/services/converter.dart';
import 'package:movie_booking/utils/Timer/remainingTime.dart';

class SummaryPaymentPage extends StatefulWidget {
  const SummaryPaymentPage({
    Key? key,
    required this.film,
    required this.theater,
    required this.selectedSeats,
    required this.total,
    required this.remainingTimeInSeconds,
  }) : super(key: key);
  final int remainingTimeInSeconds;
  final Film film;
  final Theater theater;
  final List<String> selectedSeats;
  final double total;
  @override
  State<SummaryPaymentPage> createState() => _SummaryPaymentPageState();
}

class _SummaryPaymentPageState extends State<SummaryPaymentPage> {
  Widget renderInfo(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            'Movie infomation',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 90,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(
                        toUint(widget.film.posters),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.film.title,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        widget.film.categories
                            .map((category) => category.name)
                            .join(', '),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      Text(
                        widget.film.length,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, bottom: 10),
          child: Row(
            children: [
              const Icon(
                Icons.calendar_today,
                color: Colors.grey,
              ),
              Text(
                'Date time: ${widget.theater.date} | ${widget.theater.time}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, bottom: 10),
          child: Row(
            children: [
              const Icon(
                Icons.play_circle_fill,
                color: Colors.grey,
              ),
              Text(
                'Theater: ${widget.theater.number}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, bottom: 10),
          child: Row(
            children: [
              const Icon(
                Icons.chair_outlined,
                color: Colors.grey,
              ),
              const Text(
                'Seats: ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 150),
                    child: Text(
                      widget.selectedSeats
                          .map((seat) => seat.replaceAll(' ', ''))
                          .join(', '),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                      softWrap: true,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget renderOrdered(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            'Item Ordered',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.add_box_outlined,
                    color: Colors.grey,
                  ),
                  Text(
                    ' x${widget.selectedSeats.length} Adult Stand-2D',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              child: const Text(
                ' \$26',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget renderConfirmPayment(BuildContext context) {
    double price = widget.total;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: const Border(top: BorderSide(color: Colors.grey)),
        color: Colors.grey.shade500,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '\$$price',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
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
                int remainingTimeInSeconds =
                    _remainingTimeManager.remainingTimeInSeconds;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmPayment(
                        remainingTimeInSeconds: remainingTimeInSeconds,
                        movie: widget.film,
                        theater: widget.theater,
                        seats: widget.selectedSeats,
                        total: price,
                      ),
                    ));
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
    );
  }

  Widget renderBody(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            renderInfo(context),
            renderOrdered(context),
          ],
        )),
      ),
    );
  }

  late RemainingTimeManager _remainingTimeManager;
  @override
  void initState() {
    super.initState();

    _remainingTimeManager = RemainingTimeManager(
      context: context,
      setMinutes: widget.remainingTimeInSeconds ~/ 60,
      setSeconds: widget.remainingTimeInSeconds % 60,
      onTimerEnd: () {
        ShowAlert.showAlertDialog(context);
      },
    );
  }

  @override
  void dispose() {
    _remainingTimeManager.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment information'),
        actions: [
          StreamBuilder<int>(
            stream: _remainingTimeManager.remainingTimeStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return RemainingTimeManager.displayTimer(snapshot)!;
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('...'),
                );
              }
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          renderBody(context),
          renderConfirmPayment(context),
        ],
      ),
    );
  }
}
