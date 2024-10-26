import 'package:flutter/material.dart';

class TicketTopSection extends StatelessWidget {
  const TicketTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          "assets/map.png",
          fit: BoxFit.cover,
          color: Colors.grey.shade300,
        )),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'del'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(117, 97, 83, 1)),
                          ),
                          const Text(
                            'New Delhi',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(117, 97, 83, 1)),
                          ),
                        ],
                      )),
                  const Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.flight,
                            color: Color.fromRGBO(117, 97, 83, 1),
                          )),
                      Text(
                        '1hr 15min',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(117, 97, 83, 1)),
                      ),
                    ],
                  )),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'jfk'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(117, 97, 83, 1)),
                          ),
                          const Text(
                            'New York',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(117, 97, 83, 1)),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
