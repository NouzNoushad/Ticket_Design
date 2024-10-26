import 'package:flutter/material.dart';

import '../../../data/data.dart';

class TripBottomSection extends StatefulWidget {
  const TripBottomSection({
    super.key,
  });

  @override
  State<TripBottomSection> createState() => _TripBottomSectionState();
}

class _TripBottomSectionState extends State<TripBottomSection>
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
              tabs: const [Text('Upcoming'), Text('Completed')]),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: TabBarView(controller: _tabController, children: [
          _buildUpcomingContainer(),
          Container(
            color: Colors.yellow,
          ),
        ]))
      ],
    );
  }

  Widget _buildUpcomingContainer() {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = 8.0;
    return PageView.builder(
        controller:
            PageController(viewportFraction: 0.95 + (padding / screenWidth)),
        itemCount: upcoming.length,
        itemBuilder: (context, index) {
          final flight = upcoming[index];
          return Padding(
            padding: EdgeInsets.only(left: padding, right: padding),
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/${flight["image"]}',
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  Positioned.fill(
                                      child: Container(
                                    color:
                                        const Color.fromARGB(131, 117, 97, 83),
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  flight["fromShort"],
                                                  style: const TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  flight["from"],
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  flight["toShort"],
                                                  style: const TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  flight["to"],
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Travel Date',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(117, 97, 83, 1)),
                                ),
                                Text(
                                  flight["date"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(117, 97, 83, 1)),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Departure',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(117, 97, 83, 1)),
                                  ),
                                  Text(
                                    flight["time"],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(117, 97, 83, 1)),
                                  ),
                                ],
                              ),
                            )),
                            const Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'View Details',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(117, 97, 83, 1)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ));
            }),
          );
        });
  }
}
