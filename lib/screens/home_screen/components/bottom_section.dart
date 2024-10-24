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
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
        ]))
      ],
    );
  }
}
