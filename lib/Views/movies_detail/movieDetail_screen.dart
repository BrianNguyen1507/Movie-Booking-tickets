import 'package:flutter/material.dart';
import 'package:movie_booking/Views/movies_detail/widgets/detail_widget.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

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
      child: Image.asset(
        'assets/images/movie_banner.jpg',
        fit: BoxFit.fill,
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
            onPressed: () {},
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
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              renderbanner(context),
              const DetailWidget(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
