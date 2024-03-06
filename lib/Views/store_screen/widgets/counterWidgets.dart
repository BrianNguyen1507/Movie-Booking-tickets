import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            // Xử lý sự kiện khi nút '-' được nhấn
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(
              eccentricity: BorderSide.strokeAlignCenter,
            ),
            backgroundColor: Colors.grey.shade500,
          ),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              '-',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          child: Text(
            '0',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Xử lý sự kiện khi nút '+' được nhấn
          },
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(
                eccentricity: BorderSide.strokeAlignCenter,
              ),
              backgroundColor: const Color(0xFF53B175)),
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text(
              '+',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
