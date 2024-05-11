import 'package:buildmystore/white%20ContainerWithImage.dart';
import 'package:flutter/material.dart';

import 'CalendarContainer.dart';

class New extends StatelessWidget {
  const New({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                color: Color(0xFF354250),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: WhiteContainerWithImage(imagePath: "assets/menus.png"),
                      ),

                      Center(
                        child: Text(
                          'Home',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 110.0),
                        child: WhiteContainerWithImage(imagePath: "assets/star.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: WhiteContainerWithImage(imagePath: "assets/setting.png"),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.height / 5.2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0),
                    ),
                  ),
                  child: Center(),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 7,
                left: 16,
                right: 16,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Material(
                    elevation: 4, // Add elevation here
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  CalendarContainer(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
