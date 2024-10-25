import 'package:flutter/material.dart';

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
        itemCount: 3,
        itemBuilder: (context, index) {
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
                          )),
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Travel Date',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(117, 97, 83, 1)),
                                ),
                                Text(
                                  '11 Oct 24',
                                  style: TextStyle(
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
                                  Text(
                                    'Departure',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color.fromRGBO(117, 97, 83, 1)),
                                  ),
                                  Text(
                                    '1:30PM',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(117, 97, 83, 1)),
                                  ),
                                ],
                              ),
                            )),
                            Expanded(
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
