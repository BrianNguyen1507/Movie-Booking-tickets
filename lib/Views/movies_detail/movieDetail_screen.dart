import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget renderBannerDetail(BuildContext context) {
    return Container(
      child: const Text('building'),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
