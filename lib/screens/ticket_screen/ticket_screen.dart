import 'package:flutter/material.dart';

import '../clipper.dart';
import '../dotted_line.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 233, 216, 1),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        foregroundColor: const Color.fromRGBO(117, 97, 83, 1),
        backgroundColor: const Color.fromRGBO(249, 233, 216, 1),
        title: const Text("Boarding Pass"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return ClipPath(
            clipper: TicketClipper(
              position: constraints.maxHeight * 0.46,
              radius: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.blue,
                      )),
                  CustomPaint(
                    painter: DottedMiddlePath(),
                    child: SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.yellow,
                      )),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
