import 'package:flutter/material.dart';
import 'package:movie_booking/model/item/item.dart';
import 'package:movie_booking/Views/store_screen/widgets/counterWidgets.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  // ignore: non_constant_identifier_names
  List<item> list_item = [
    item('assets/images/a1.png', 'Sprite', '300ml', 5, 102),
    item('assets/images/a5.png', 'Coca', '300ml', 5, 85),
    item(
        'assets/images/a3.png', 'Original Popcorn', 'Crispy, 1 piece', 10, 223),
    item('assets/images/a2.png', 'Honey Popcorn', 'Sweet, 1 piece', 12, 143),
    item('assets/images/combo1.png', 'Combo Special 1', 'HoneyPopcorn, coca',
        15, 63),
    item('assets/images/combo2.png', 'Combo Special 2',
        'OriginalPopcorn, pepsi', 13, 45),
  ];

  Widget _listfoods(BuildContext context, int index) {
    item foods = list_item[index];
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        color: Colors.grey.shade300,
        elevation: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 100,
              child: Image.asset(
                foods.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      foods.title,
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
                        foods.describe,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.center,
                      child: CounterWidget(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: Text(
                '\$${double.parse(foods.price.toString()).toStringAsFixed(1)}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderTitle(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      width: double.infinity,
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          'Store',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget renderListItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: List.generate(
            list_item.length,
            (index) => GestureDetector(
              onTap: () {
                print('Item tapped at index $index');
              },
              child: _listfoods(context, index),
            ),
          ),
        ),
      ),
    );
  }

  Widget renderPayment(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 130.0,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(bottom: 5, top: 10),
                child: const Text(
                  ' Subtotal:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(bottom: 5, top: 10),
                child: Text(
                  ' $total',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 41, 189, 58),
                  elevation: 0.0),
              onPressed: () {},
              child: const Text(
                'Finish Payment',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          )
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
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.black87,
              ),
              height: 40,
              width: double.infinity,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Food and drinks',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            renderListItem(context),
          ],
        )),
      ),
    );
  }

  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: [
            renderTitle(context),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    renderBody(context),
                    renderPayment(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
