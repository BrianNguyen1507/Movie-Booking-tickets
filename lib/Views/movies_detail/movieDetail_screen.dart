import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_booking/Views/buyticket_screen/buy_tickets_screen.dart';
import 'package:movie_booking/Views/index/index.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/Views/movies_detail/widgets/expandableText_widget.dart';
import 'package:movie_booking/services/converter.dart';

class MovieDetailPage extends StatefulWidget {
  final Film film;

  const MovieDetailPage({super.key, required this.film});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Widget renderbanner(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Image.memory(
        toUint(widget.film.posters),
        width: 150,
        height: 180,
        fit: BoxFit.cover,
      ),
    );
  }

  double total = 0.0;

  Widget renderBooking(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: double.infinity,
        child: SizedBox(
          height: 50.0,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 41, 189, 58),
                elevation: 0.0),
            onPressed: () {
              _onRegisterPress(context);
            },
            child: const Text(
              'BOOKING',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ));
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
              renderbanner(context),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Image.memory(
                      toUint(widget.film.posters),
                      width: 150,
                      height: 180,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${widget.film.title}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ), // Replace 'title' with the actual property name
                        Text(
                          'Running time: ${widget.film.length}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ), // Replace 'length' with the actual property name
                        Text(
                          'Date: ${widget.film.dateRelease}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ), // Replace 'dateRelease' with the actual property name
                        Text(
                          'Actor: ${widget.film.actor}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ), // Replace 'actor' with the actual property name
                        Text(
                          'Director: ${widget.film.director}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(20),
              const Text(
                'Discribe:',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ), //
              ExpandableWidget(content: widget.film.describe),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 30,
        elevation: 1,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const IndexPage(
                        title: '',
                      )),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
          constraints: const BoxConstraints.expand(),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      renderBody(context),
                      renderBooking(context),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

_onRegisterPress(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SeatSelectionScreen(),
      ));
}
