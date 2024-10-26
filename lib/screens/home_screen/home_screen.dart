import 'package:flutter/material.dart';
import 'package:trip_parallax/screens/home_screen/components/bottom_section.dart';
import 'package:trip_parallax/screens/home_screen/components/top_section.dart';

enum Trip { oneway, round }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 233, 216, 1),
      appBar: AppBar(
        foregroundColor: const Color.fromRGBO(117, 97, 83, 1),
        backgroundColor: const Color.fromRGBO(249, 233, 216, 1),
        title: const Text("My Trips"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.tune))],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Column(
          children: [
            Expanded(child: TripTopSection()),
            SizedBox(
              height: 10,
            ),
            Expanded(child: TripBottomSection()),
          ],
        ),
      ),
    );
  }
}
