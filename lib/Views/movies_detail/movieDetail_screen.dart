import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking/Views/selectionTheater/SelectionTheater.dart';

import 'package:movie_booking/Views/index/index.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/Views/movies_detail/widgets/expandableText_widget.dart';
import 'package:movie_booking/services/converter.dart';

class MovieDetailPage extends StatefulWidget {
  final Film film;

  const MovieDetailPage({Key? key, required this.film}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Widget renderbanner(BuildContext context) {
    return Image.memory(
      toUint(widget.film.posters),
      width: double.infinity,
      height: 150,
      fit: BoxFit.cover,
    );
  }

  DateTime convertToDate(String input) {
    var format = DateFormat('dd-MM-yyyy');
    return format.parse(input);
  }

  bool isFutureRelease = false;
  @override
  void initState() {
    super.initState();
    DateTime releaseDate = convertToDate(widget.film.dateRelease);
    isFutureRelease = releaseDate.isAfter(DateTime.now());
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.memory(
                      toUint(widget.film.posters),
                      width: 130,
                      height: 150,
                      fit: BoxFit.fitHeight,
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          widget.film.categories
                              .map((category) => category.name)
                              .join(', '),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                margin: const EdgeInsets.only(top: 20.0),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            const Text(
                              'Date release',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              widget.film.dateRelease,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            const Text(
                              'Running time',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              widget.film.length,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            Text(
                              'Language',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            Text(
                              'English',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Discribe',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.35,
                        ),
                        ExpandableWidget(
                          content: widget.film.describe,
                        ),
                      ]),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Director & Actor',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.35,
                      ),
                      Text(
                        ' ${widget.film.director} - ${widget.film.actor}',
                        style: const TextStyle(
                            fontSize: 15, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderBooking(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.grey[400],
      ),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      child: Container(
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
          onPressed: isFutureRelease
              ? null
              : () {
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
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
                ),
              ),
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
                    isFutureRelease
                        ? Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              color: Colors.blue,
                            ),
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Container(
                              decoration: const BoxDecoration(),
                              height: 50.0,
                              width: double.infinity,
                              child: const Center(
                                child: Text(
                                  'COMMING SOON',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : renderBooking(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onRegisterPress(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionTheater(
          movie: widget.film,
        ),
      ),
    );
  }
}
