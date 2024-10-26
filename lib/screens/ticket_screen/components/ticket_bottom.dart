import 'package:flutter/material.dart';

class TicketBottomSection extends StatelessWidget {
  const TicketBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Steve Rogers",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(117, 97, 83, 1),
            ),
          ),
          const Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Travel Date',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                  Text(
                    '09 Feb',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Flight No',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                  Text(
                    '6E1221',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                ],
              )),
            ],
          ),
          const Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gate',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                  Text(
                    'B9',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seat',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                  Text(
                    '10A',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Class',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                  Text(
                    'Economy',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                ],
              )),
            ],
          ),
          const Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.flight_takeoff,
                    color: Color.fromRGBO(117, 97, 83, 1),
                  ),
                  Text(
                    'Boarding',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                  Text(
                    '7:30AM',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.flight_land,
                    color: Color.fromRGBO(117, 97, 83, 1),
                  ),
                  Text(
                    'Arrival',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                  Text(
                    '12:30AM',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                ],
              )),
            ],
          ),
          Image.asset(
            'assets/bar_code.png',
            color: const Color.fromRGBO(117, 97, 83, 1),
          )
        ],
      ),
    );
  }
}