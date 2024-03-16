import 'dart:convert';
import 'dart:typed_data';
import 'package:movie_booking/Views/home_screen/widgets/AutoScrolling.dart';
import 'package:movie_booking/Views/movies_detail/movieDetail_screen.dart';
import 'package:movie_booking/services/converter.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/Views/home_screen/widgets/CustomDrawer.dart';
import 'package:movie_booking/services/fetchingData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Film>> filmsShowing;
  late Future<List<Film>> filmsFuture;
  static Future<Uint8List> bytesToImage(String base64String) async {
    try {
      Uint8List imgBytes = base64Decode(base64String);
      return imgBytes;
    } catch (e) {
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    filmsShowing = ListFeatured.fetchData("1-11-2023", "1-1-2024");
    filmsFuture = ListFeatured.fetchData("1-1-2024", "1-12-2025");
  }

  Widget _buildListItem(BuildContext context, int index, List<Film> films) {
    Film film = films[index];

    return FutureBuilder<Uint8List>(
      future: bytesToImage(film.posters),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(
                    film: film,
                  ),
                ),
              );
            },
            child: SizedBox(
              width: 200,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: ClipRRect(
                  child: Column(
                    children: [
                      if (snapshot.data != null)
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Image.memory(
                            snapshot.data!,
                            height: 230,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Center(
                          child: Text(
                            film.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            film.categories
                                .map((category) => category.name)
                                .join(', '),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _listHorizon(BuildContext context, int index, List<Film> films) {
    Film film = films[index];

    return Card(
      color: Colors.grey.shade100,
      elevation: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              children: [
                Image.memory(
                  toUint(film.posters),
                  height: 200,
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(height: 8),
                Text(
                  film.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget renderbanner(BuildContext context) {
    return const AutoScrollingBanner();
  }

  Widget searchbar(BuildContext context) {
    return Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 8,
            blurRadius: 10,
            offset: const Offset(0, 1),
          )
        ], borderRadius: BorderRadius.circular(30)),
        child: Align(
          alignment: Alignment.center,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 255, 255),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ));
  }

  Widget renderNowShowing(BuildContext context) {
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
              decoration: const BoxDecoration(color: Colors.white70),
              width: 200,
              height: 100,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Now Showing',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: FutureBuilder<List<Film>>(
                future: filmsShowing,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No film available',
                          style: TextStyle(color: Colors.grey)),
                    );
                  } else {
                    List<Film> films = snapshot.data!;
                    return SizedBox(
                        height: 330,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: films.length,
                          itemBuilder: (context, index) {
                            return _buildListItem(context, index, films);
                          },
                        ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderComingSoon(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        children: [
          Divider(
            thickness: 10.0,
            color: Colors.grey[300],
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.white70),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                'Comming Soon',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: const SizedBox(
              width: double.infinity,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: FutureBuilder<List<Film>>(
              future: filmsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'No film available',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                } else {
                  List<Film> films = snapshot.data!;
                  return SizedBox(
                      height: 330,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: films.length,
                        itemBuilder: (context, index) {
                          return _buildListItem(context, index, films);
                        },
                      ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 30,
        elevation: 1,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const CustomDrawer(),
      drawerEnableOpenDragGesture: true,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            renderbanner(context),
            Stack(
              children: [
                renderNowShowing(context),
                searchbar(context),
              ],
            ),
            renderComingSoon(context),
          ],
        ),
      ),
    );
  }
}
