import 'package:flutter/material.dart';
import 'package:movie_booking/Views/movies_detail/widgets/expandableText_widget.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key});

  Widget card(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/images/movie_banner.jpg',
                    fit: BoxFit.cover,
                    width: 120,
                    height: 180,
                  ),
                )),
            const Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'film.title',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Text(
                      'hanh dong',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87),
                    ),
                    Text(
                      'running time',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget renderDetail(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      decoration: const BoxDecoration(color: Colors.black),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Align(
                alignment: Alignment.center,
                child: card(context),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                  const Text(
                    'Description :',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  ExpandableWidget(),
                  Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                  const Column(
                    children: [
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Release date: ',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'aaaa1',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Director: ',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'aaa2',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Cast: ',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'aaa3',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return renderDetail(context);
  }
}
