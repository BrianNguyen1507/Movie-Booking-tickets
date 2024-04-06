import 'dart:convert';
import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_booking/Views/home_screen/widgets/AutoScrolling.dart';
import 'package:movie_booking/Views/movies_detail/movieDetail_screen.dart';
import 'package:movie_booking/Views/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/Views/home_screen/widgets/CustomDrawer.dart';
import 'package:movie_booking/services/fetching/fetchingData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Film>> filmsShowing;
  late Future<List<Film>> filmsFuture;
  late Future<List<Film>> search;

  static Future<Uint8List> bytesToImage(String base64String) async {
    try {
      Uint8List imgBytes = base64Decode(base64String);
      return imgBytes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();

    filmsShowing = ListFeatured.fetchData("1-11-2023", "1-1-2024");
    filmsFuture = ListFeatured.fetchData("1-1-2024", "1-12-2025");
  }

  Widget _buildNowShowingItem(
      BuildContext context, int index, List<Film> films) {
    Film film = films[index];

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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FutureBuilder<Uint8List>(
                  future: bytesToImage(film.posters),
                  builder: (BuildContext context,
                      AsyncSnapshot<Uint8List> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Image.memory(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                film.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                film.categories.map((category) => category.name).join(', '),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '4.0',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.play_circle_sharp,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Showing',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
                child: Column(
                  children: [
                    if (snapshot.data != null)
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.memory(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          ),
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
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        film.dateRelease,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget renderbanner(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: AutoScrollingBanner(),
    );
  }

  Widget renderNowShowing(BuildContext context) {
    return Container(
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
              height: 60,
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
                    return CarouselSlider.builder(
                      itemCount: films.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return _buildNowShowingItem(context, index, films);
                      },
                      options: CarouselOptions(
                        height: 470,
                        viewportFraction: 0.55,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        padEnds: true,
                      ),
                    );
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
            padding: const EdgeInsets.only(top: 35, bottom: 30),
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
                    ),
                  );
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
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        toolbarHeight: 30,
        elevation: 1,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchPage();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const CustomDrawer(),
      drawerEnableOpenDragGesture: true,
      extendBody: true,
      body: RefreshIndicator(
        backgroundColor: Colors.white70,
        color: Colors.blue,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              renderbanner(context),
              Stack(
                children: [
                  renderNowShowing(context),
                ],
              ),
              renderComingSoon(context),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _onRefresh() async {
  return await Future.delayed(
    const Duration(milliseconds: 100),
  );
}
