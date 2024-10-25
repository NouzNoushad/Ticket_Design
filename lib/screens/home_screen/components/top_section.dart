import 'dart:ui';

import 'package:flutter/material.dart';

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
                            'Trv'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(117, 97, 83, 1)),
                          ),
                          const Text(
                            'Thiruvananthapuram',
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
                            'Pnq'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(117, 97, 83, 1)),
                          ),
                          const Text(
                            'Pune',
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

class DottedMiddlePath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromRGBO(117, 97, 83, 1)
      ..strokeWidth = 1;

    void drawDashedLine({
      required Canvas canvas,
      required Offset p1,
      required Offset p2,
      required List<double> pattern,
      required Paint paint,
    }) {
      final double distance = (p2 - p1).distance;
      final List<double> fullPattern =
          pattern.map((width) => width / distance).toList();
      final points = <Offset>[];
      double t = 0;
      int i = 0;
      while (t < 1) {
        points.add(Offset.lerp(p1, p2, t)!);
        t += fullPattern[i++];
        points.add(Offset.lerp(p1, p2, t.clamp(0, 1))!);
        t += fullPattern[i++];
        i %= fullPattern.length;
      }
      canvas.drawPoints(PointMode.lines, points, paint);
    }

    drawDashedLine(
        canvas: canvas,
        p1: Offset(0, size.height * 0.6),
        p2: Offset(size.width, size.height * 0.6),
        pattern: [10, 5],
        paint: paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TicketClipper extends CustomClipper<Path> {
  TicketClipper({
    this.position = 50,
    this.radius = 15,
  });

  double position;
  final double radius;

  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    position = position + (radius * 0.25);
    final path = Path();

    // Top
    path.moveTo(0, 0);
    path.lineTo(position - radius, 0.0);

    // Right
    path.lineTo(w, 0.0);
    path.lineTo(w, position - radius);
    path.arcToPoint(
      Offset(w, position),
      clockwise: false,
      radius: const Radius.circular(1),
    );

    // Bottom
    path.lineTo(w, h);
    path.lineTo(position, h);

    // Left
    path.lineTo(0.0, h);
    path.lineTo(0, position);
    path.arcToPoint(
      Offset(0, position - radius),
      clockwise: false,
      radius: const Radius.circular(1),
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
