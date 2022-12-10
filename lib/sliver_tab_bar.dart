import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BrUTT extends StatefulWidget {
  const BrUTT({Key? key}) : super(key: key);

  @override
  _BrUTTState createState() => _BrUTTState();
}

class _BrUTTState extends State<BrUTT> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image = 'assets/P.jpg';

  List<String> miImages = [
    'assets/P.jpg',
    'assets/C.jpg',
    'assets/D.jpg',
    'assets/H.jpg',
  ];

  void _tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    tabController!.addListener(_tabListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          pinned: true,
          backgroundColor: Color.fromARGB(255, 28, 117, 31),
          expandedHeight: 350.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Reservacion UTT'),
            background: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverAppBar(
          pinned: true,
          primary: false,
          elevation: 8.0,
          backgroundColor: Color.fromARGB(255, 54, 126, 48),
          title: Align(
            alignment: AlignmentDirectional.center,
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.greenAccent,
              isScrollable: true,
              tabs: const [
                Tab(
                  text: 'Edificio P',
                ),
                Tab(
                  text: 'Edificio C',
                ),
                Tab(
                  text: 'Edificio D',
                ),
                Tab(
                  text: 'Edificio H',
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 500.0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SfCalendar(
                view: CalendarView.month,
                monthViewSettings: MonthViewSettings(showAgenda: true),
                dataSource: MeetingDataSource(getApointments()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<Appointment> getApointments() {
  List<Appointment> meeting = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meeting.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Sala del edificio P apartada',
      color: Colors.red));

  return meeting;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
