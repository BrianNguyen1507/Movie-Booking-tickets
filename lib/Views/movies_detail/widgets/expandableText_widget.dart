import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  final String content;
  const ExpandableWidget({required this.content, Key? key}) : super(key: key);

  @override
  State<ExpandableWidget> createState() => _ExpandableState();
}

bool isExpanded = false;

class _ExpandableState extends State<ExpandableWidget> {
  Widget expandableText(String content) {
    return Column(
      children: [
        Text(
          isExpanded ? content : '${content.substring(0, 90)}...',
          maxLines: isExpanded ? null : 2,
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
    return expandableText(widget.content);
  }
}
