import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal picker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> dataList = [];

  @override
  void initState() {
    for (int i = 0; i < 30; i++) {
      dataList.add(i);
    }
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 100,
            child: HorizontalPicker(
                childCount: 50,
                selectedIndex: (index) {
                  if (mounted) {
                    setState(() {
                      currentIndex = index;
                    });
                  }
                },
                itemExtent: 20,
                builder: (context, index) {
                  return _itemWidget(currentIndex == index);
                },
                controller: FixedExtentScrollController()),
          ),
        ),
      ),
    );
  }

  Widget _itemWidget(bool selected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: selected ? 70 : 50,
            color: selected ? Colors.blue : Colors.red),
      ],
    );
  }
}
