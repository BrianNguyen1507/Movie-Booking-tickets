import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({super.key});

  @override
  State<ExpandableWidget> createState() => _ExpandableState();
}

bool isExpanded = false;

String content =
    'In the heart of a bustling metropolis, where the vibrant pulse of urban life meets the tranquil embrace of greenery, a seamless fusion of contrasts unfolds. Towering skyscrapers reach for the heavens, casting shadows over bustling streets teeming with diverse faces and stories. Amidst the cacophony, hidden gems of serenity emerge—a pocket park adorned with blossoming flowers, a quiet café where time slows to a leisurely pace. The city breathes with a rhythm that harmonizes chaos and calm. This dynamic dance of elements creates a tapestry of experiences, where the energy of progress entwines with the timeless beauty of nature, shaping a unique and captivating urban narrative.';

class _ExpandableState extends State<ExpandableWidget> {
  Widget expandableText(String content) {
    return Column(
      children: [
        Text(
          isExpanded ? content : '${content.substring(0, 125)}...',
          maxLines: isExpanded ? null : 3,
        ),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            children: [
              Text(
                isExpanded ? '..Show less' : 'Show more..',
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return expandableText(content);
  }
}
