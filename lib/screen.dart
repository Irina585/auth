import 'package:auth/drawer_menu/drawer.dart';
import 'package:auth/lake.dart';
import 'package:auth/user_list/user_list_widget.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  static const String routeName = '/screen';

  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  int _selectedTab = 0;

  static final List<Widget> _widgetOptions = <Widget> [
    const UserListWidget(),
    const LikePage(),
    const Text('Просто пустой экран')
  ];

  void onSelectTab (int index) {
    if(_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список юзеров'),

        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              tooltip: 'Фильтр'),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            tooltip: 'Настройки',
          ),
        ],
      ),
      body: Center(
          child: _widgetOptions[_selectedTab]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Пользователи'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Озеро'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Пусто')
        ],
        onTap: (index) {
          onSelectTab(index);
        },
      ),
      drawer: const BuildDrawer(),
    );
  }
}






