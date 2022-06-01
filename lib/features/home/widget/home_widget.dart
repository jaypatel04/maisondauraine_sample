import 'package:flutter/material.dart';
import 'package:maisondauraine/features/home/widget/chat_widget.dart';
import 'package:maisondauraine/features/home/widget/info_widget.dart';
import 'package:maisondauraine/features/home/widget/animation_widget.dart';
import 'package:maisondauraine/features/login/model/login_model.dart';

const textStyleActive = TextStyle(
  color: Colors.blue,
  fontSize: 14,
  fontStyle: FontStyle.normal,
);

const textStyleInActive = TextStyle(
  color: Colors.grey,
  fontSize: 14,
  fontStyle: FontStyle.normal,
);

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<Widget> _tabs = [];

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final loginModel = ModalRoute.of(context)!.settings.arguments as LoginModel;
    _tabs = [
      ChatWidget(
        loginModel: loginModel,
      ),
      const InfoWidget(),
      const AnimationWidget(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: _tabs.elementAt(_selectedIndex)),
      bottomNavigationBar: SizedBox(
        height: 70.0,
        child: _buildBottomNavigationBar(context),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0,
      selectedLabelStyle: textBottomBar(context, true),
      unselectedLabelStyle: textBottomBar(context, false),
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      items: _bottomBarItems(),
      type: BottomNavigationBarType.fixed,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _bottomBarItems() {
    return [
      _bottomNavigationItem(const Icon(Icons.chat), 'Chat'),
      _bottomNavigationItem(const Icon(Icons.info), 'Info'),
      _bottomNavigationItem(const Icon(Icons.animation), 'Animation'),
    ];
  }

  BottomNavigationBarItem _bottomNavigationItem(Icon icon, String label) {
    return BottomNavigationBarItem(
      label: label,
      icon: icon,
    );
  }

  static TextStyle textBottomBar(BuildContext context, bool active) {
    return active ? textStyleActive : textStyleInActive;
  }
}
