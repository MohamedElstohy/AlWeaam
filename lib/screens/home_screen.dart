import 'package:flutter/material.dart';

import './widgets/home_widgets/settings_body.dart';
import './widgets/home_widgets/bookmark_body.dart';
import './widgets/home_widgets/home_widget.dart';
import './widgets/home_widgets/categories_body.dart';

class HomeScreen extends StatefulWidget {
static const routeName = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 3;
  Color _activeColor = Color(0xFFBFBFBF);
  Color _iconColor = Color(0xFF999999);
  bool _searchMode = false;

  List<Widget> bodies = [
    SettingsBody(),
    BookMarkBody(),
    CategoriesBody(),
    HomeBody(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Directionality _searchTitle = new Directionality(
    textDirection: TextDirection.rtl,
    child: TextField(
      decoration: InputDecoration(
        hintText: 'البحث...',
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w600
        ),
      ),
    ),
  );

  Text _defaultTitle = new Text(
    'الوئام',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w900
      ),
  );

  BottomNavigationBar bottomNavigationBar(int index){
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _iconColor,
              ),

              title: Text(
                'الاعدادات',
                style: TextStyle(
                  color: _selectedIndex == 0 ? _activeColor : _iconColor,
                ),
              ),

              activeIcon: Icon(
                Icons.settings,
                color: _activeColor,
              ),
          ),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border,
                color: _iconColor,
              ),

              title: Text(
                'المحفوظات',
                style: TextStyle(
                  color: _selectedIndex == 1 ? _activeColor : _iconColor
                ),
              ),

              activeIcon: Icon(
                Icons.bookmark_border,
                color: _activeColor,
              ),
          ),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _iconColor,
              ),

              title: Text(
                'التصنيفات',
                style: TextStyle(
                  color: _selectedIndex == 2 ? _activeColor : _iconColor
                ),
              ),

              activeIcon: Icon(
                Icons.pages,
                color: _activeColor,
              )
          ),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _iconColor,
              ),

              title: Text(
                'الرئيسية',
                style: TextStyle(
                  color: _selectedIndex == 3 ? _activeColor : _iconColor
                ),
              ),

              activeIcon: Icon(
                Icons.home,
                color: _activeColor,
              ),
          ),
        ],
        currentIndex: index,
        backgroundColor: Color(0xFF003d99),
        onTap: _onItemTapped,
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003d99),
        title: !_searchMode ? _defaultTitle : _searchTitle,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            !_searchMode ? Icons.search : Icons.close,
            color: _iconColor,
            size: 30,
          ),
          onPressed: (){
            setState(() {
              _searchMode =!_searchMode ;
          });
          },
        ),  
        actions: <Widget>[
          !_searchMode 
            ? IconButton(
              icon: Icon(
                Icons.notifications,
                size: 30,
                color: _activeColor,
              ),
              onPressed: (){},
            ) 
            : IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: _activeColor,
                ),
                onPressed: (){},
              ),
        ],
      ),
      
      body: bodies[_selectedIndex],
      
      bottomNavigationBar: bottomNavigationBar(_selectedIndex),
    );
  }
}