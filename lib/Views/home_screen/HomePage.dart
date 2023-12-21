import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:gap/gap.dart';
import 'package:movie_booking/Colors/colorvalues.dart';
import 'package:movie_booking/Views/home_screen/widgets/AutoScrolling.dart';
import 'package:movie_booking/Views/movies_detail/movieDetail_screen.dart';
import 'package:movie_booking/services/converter.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
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
  late Future<List<Film>> filmsFuture;
  @override
  void initState() {
    super.initState();
    filmsFuture = ListFeatured.fetchData("1-11-2023", "1-1-2024");
  }

  Widget _buildListItem(BuildContext context, int index, List<Film> films) {
    Film film = films[index];

    return SizedBox(
      width: 150,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Image.memory(
                toUint(film.posters),
                height: 200,
                fit: BoxFit.fitHeight,
              ),
              const Gap(10),
              Text(
                film.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
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
                      ))),
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 40.0,
                width: 100.0,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      buttonsColor,
                    ),
                  ),
                  onPressed: () {
                    print('ID of film clicked :' + film.id.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailPage(
                          film: film,
                        ),
                      ),
                    );
                  },
                  child: const Text('Booking'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<ui.Image> bytesToImage(Uint8List imgBytes) async {
    ui.Codec codec = await ui.instantiateImageCodec(imgBytes);
    ui.FrameInfo frame;
    try {
      frame = await codec.getNextFrame();
    } finally {
      codec.dispose();
    }
    return frame.image;
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
                // Customize this part based on your needs
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
    return AutoScrollingBanner();
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
              height: 330,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: FutureBuilder<List<Film>>(
                future: filmsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No Film available now');
                  } else {
                    List<Film> films = snapshot.data!;
                    return SizedBox(
                      height: 330, // Set a fixed height here
                      child: ScrollSnapList(
                        itemBuilder: (context, index) {
                          return _buildListItem(context, index, films);
                        },
                        itemCount: films.length,
                        itemSize: 150,
                        onItemFocus: (index) {},
                        dynamicItemSize: false,
                        initialIndex: 1,
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
          Container(
            decoration: const BoxDecoration(color: Colors.white70),
            height: 100,
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
        ],
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
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none))
        ],
      ),
      drawer: const CustomDrawer(),
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
