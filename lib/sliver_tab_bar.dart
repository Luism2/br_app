import 'package:flutter/material.dart';

class BrUTT extends StatefulWidget {
  const BrUTT({Key? key}) : super(key: key);

  @override
  _BrUTTState createState() => _BrUTTState();
}

class _BrUTTState extends State<BrUTT> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image = 'assets/UTT.jpeg';

  List<String> miImages = [
    'assets/UTT.jpeg',
    'assets/utt_logo_ver_6.png',
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
          backgroundColor: Colors.deepPurple,
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
          backgroundColor: Colors.deepPurple,
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
            height: 800.0,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: TabBarView(
                  controller: tabController,
                  children: const [Text('Hola a todos')]),
            ),
          ),
        ),
      ],
    );
  }
}
