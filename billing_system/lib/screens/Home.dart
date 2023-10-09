import 'package:billing_system/Configs/Constants.dart';
import 'package:billing_system/components/GraphContainer.dart';
import 'package:billing_system/components/Menu.dart';
import 'package:billing_system/components/NotificationPopup.dart';
import 'package:flutter/material.dart';
import 'package:billing_system/components/NotificationIcon.dart';

class HomeState extends StatefulWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePage();
}

class HomePage extends State<HomeState> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double containerHeightPercentage = 70.0;
  double screenHeight = 0.0;
  double keyboardHeight = 0.0;

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    double visibleScreenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;

    double containerHeight =
        (visibleScreenHeight * containerHeightPercentage) / 100.0;

    double screenStartHeight = (visibleScreenHeight * 5) / 100;

    return Scaffold(
      key: _scaffoldKey, // Add this line to associate the key with the Scaffold
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: screenStartHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _openDrawer,
                // Open the Drawer when the icon is tapped
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    // const NotificationIcon(),
                    const NotificationPopup(),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 74,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Overview',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
          Container(
            height: containerHeight,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(243, 243, 243, 1.0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  const GraphContainer(),
                  const SizedBox(
                    height: 40 * figmaHeightFactor,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 356,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text('Bill Generate'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Menu(),
    );
  }
}
