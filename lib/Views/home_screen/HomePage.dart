import 'package:movie_booking/Colors/ColorValues.dart';
import 'package:movie_booking/Views/home_screen/widgets/AutoScrolling.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking/model/film/film.dart';
import 'package:movie_booking/Views/home_screen/widgets/CustomDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Film> ListFilm = [
    Film('assets/images/movie_banner.jpg', 'John Wick 4',
        'Kịch tính, Lãng mạng', 20, DateTime(2023, 08, 24)),
    Film('assets/images/movie_banner.jpg', 'Đêm kinh hoàng', 'Kinh dị', 10,
        DateTime(2023, 08, 24)),
    Film('assets/images/movie_banner.jpg', 'Kẻ kiến tạo', 'Viễn tưởng', 25,
        DateTime(2023, 08, 24)),
    Film('assets/images/movie_banner.jpg', 'Vầng trăng máu', 'Hình sự, Gây cấn',
        50, DateTime(2023, 08, 24)),
    Film('assets/images/movie_banner.jpg', 'DumpStack', 'Kinh dị', 25,
        DateTime(2023, 08, 24)),
    Film('assets/images/movie_banner.jpg', '123123123', 'Hình sự, Gây cấn', 50,
        DateTime(2023, 08, 24)),
  ];
  Widget _listHorizon(BuildContext context, int index) {
    Film film = ListFilm[index];
    return Card(
      color: Colors.grey.shade100,
      elevation: 0,
      child: ClipRRect(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              film.imagePath,
              fit: BoxFit.cover,
              width: 120,
              height: 180,
            ),
            Container(
              padding: const EdgeInsets.only(right: 30),
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      film.title,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        DateFormat('dd-MM-yyyy').format(film.dateRelease),
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Film film = ListFilm[index];
    return SizedBox(
      width: 150,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
            children: [
              Image.asset(
                film.imagePath,
                fit: BoxFit.cover,
                width: 150,
                height: 210,
              ),
              Text(
                film.title,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    film.describe,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54),
                  ),
                ),
              ),
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
                    onPressed: () {},
                    child: const Text('Booking')),
              ),
            ],
          ),
        ),
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
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                color: Colors.white70,
                padding: const EdgeInsets.only(),
                child: ScrollSnapList(
                  itemBuilder: _buildListItem,
                  itemCount: ListFilm.length,
                  itemSize: 150,
                  onItemFocus: (index) {},
                  dynamicItemSize: true,
                  initialIndex: 1,
                ),
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
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: List.generate(
                  ListFilm.length,
                  (index) => GestureDetector(
                    onTap: () {
                      print('Item tapped at index $index');
                    },
                    child: _listHorizon(context, index),
                  ),
                ),
              ),
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
