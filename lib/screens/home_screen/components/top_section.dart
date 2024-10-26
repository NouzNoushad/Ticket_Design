import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trip_parallax/screens/ticket_screen/ticket_screen.dart';

import '../../clipper.dart';
import '../../dotted_line.dart';

class TripTopSection extends StatefulWidget {
  const TripTopSection({
    super.key,
  });

  @override
  State<TripTopSection> createState() => _TripTopSectionState();
}

class _TripTopSectionState extends State<TripTopSection>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: TabBar(
              dividerHeight: 0,
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              labelColor: Colors.white,
              labelPadding: const EdgeInsets.symmetric(vertical: 8),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromRGBO(117, 97, 83, 1),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              tabs: const [Text('One-Way'), Text('Round Trip')]),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: TabBarView(controller: _tabController, children: [
          _buildOnewayContainer(),
          const Center(
            child: Text('Round Trip'),
          ),
        ]))
      ],
    );
  }

  Widget _buildOnewayContainer() {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = 8.0;
    return PageView.builder(
        controller:
            PageController(viewportFraction: 0.95 + (padding / screenWidth)),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: padding, right: padding),
            child: LayoutBuilder(builder: (context, constraints) {
              return ClipPath(
                clipper: TicketClipper(
                  position: constraints.maxHeight / 1.5,
                  radius: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TicketScreen()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          _cardTopSection(),
                          CustomPaint(
                            painter: DottedMiddlePath(),
                            child: SizedBox(
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          const Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.flight_takeoff,
                                      size: 18,
                                      color: Color.fromRGBO(117, 97, 83, 1)),
                                  Text(
                                    'Departure',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(117, 97, 83, 1)),
                                  ),
                                  Text(
                                    '7:30AM',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(117, 97, 83, 1)),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.flight_land,
                                      size: 18,
                                      color: Color.fromRGBO(117, 97, 83, 1)),
                                  Text(
                                    'Arrival',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(117, 97, 83, 1)),
                                  ),
                                  Text(
                                    '8:45AM',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(117, 97, 83, 1)),
                                  ),
                                ],
                              ),
                            ],
                          )),
                        ],
                      )),
                ),
              );
            }),
          );
        });
  }

  Widget _cardTopSection() => Expanded(
      flex: 2,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Del'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 30,
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
                            'Jfk'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 30,
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
              )),
          const Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Color.fromRGBO(117, 97, 83, 1),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '10 Oct 24',
                    style: TextStyle(
                        fontSize: 12, color: Color.fromRGBO(117, 97, 83, 1)),
                  ),
                ],
              ),
              Text(
                'View Details',
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(117, 97, 83, 1)),
              ),
            ],
          )),
        ],
      ));
}
