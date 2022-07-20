import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/routes/router.gr.dart';
import '../widgets/app_drawer.dart';
import 'information/info_page.dart';
import 'map/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _InitialPageState();
}

class _InitialPageState extends State<HomePage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _selectedIndex = 0;
    // BlocProvider.of<CategoriesCubit>(context).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('123456789-123456'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const AppDrawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => AutoRouter.of(context).push(const NewAlertRoute()),
        elevation: 2.0,
        backgroundColor: Colors.purple,
        child: const Icon(Icons.warning),
      ),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    InfoPage(),
    MapPage(),
  ];

  Widget _bottomNavigationBar() {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      notchMargin: 5,
      shape: const CircularNotchedRectangle(),
      child: Wrap(
        children: [
          BottomNavigationBar(
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.purple,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.article_outlined),
                label: 'Info',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Map',
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
