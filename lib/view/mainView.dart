import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api/view/home_page.dart';
import 'MyPhotosPage.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  int currentTab = 0;
  final List _buildSrcreens = [
    const HomePage(),
     MyPhotosPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSrcreens[currentTab],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/UploadPage');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  minWidth: 75,
                  onPressed: (){
                  setState(() {
                    currentTab = 0;
                  });
                  },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentTab == 0
                    ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.home, color: Colors.blue,),
                    ) :
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.home, color: Colors.grey,),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 11,
                          color: currentTab == 0
                            ? Colors.indigo
                            : Colors.grey
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 60,),
              MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                minWidth: 75,
                onPressed: (){
                  setState(() {
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentTab == 1
                        ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.home, color: Colors.blue,),
                    ) :
                    const SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.home, color: Colors.grey,),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'My photos',
                      style: TextStyle(
                          fontSize: 11,
                          color: currentTab == 1
                              ? Colors.indigo
                              : Colors.grey
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




/*
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api/view/home_page.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  final items = const [
    Icon(Icons.home, size: 30,),
    Icon(Icons.search, size: 30,),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selctedIndex){
          setState(() {
            index = selctedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: getSelectedWidget(index: index)
      ),
    );
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = HomePage();
        break;
        case 1:
        widget = SearchPage();
        break;
      default:
        widget = HomePage();
        break;
    }
    return widget;
  }
}
*/
