import 'package:flutter_file_manager_ui/data/root_app_json.dart';
import 'package:flutter_file_manager_ui/pages/files_page.dart';
import 'package:flutter_file_manager_ui/pages/home_page.dart';
import 'package:flutter_file_manager_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'my_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getTabs(),
      body: getBody(),
    );
  }
  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children: const [
        HomePage(),
        FilesPage(),
         Center(
          child: Text("废纸篓",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        MyPage()
      ],
    );
  }

  Widget getTabs() {
    return SalomonBottomBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: List.generate(rootAppJson.length, (index) {
          return SalomonBottomBarItem(
              selectedColor: rootAppJson[index]['color'],
              icon: SvgPicture.asset(
                rootAppJson[index]['icon'],
                color: rootAppJson[index]['color'],
              ),
              title: Text(rootAppJson[index]['text']));
        }));
  }
}
