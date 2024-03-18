import 'package:flutter/material.dart';

class CheckerboardScreen extends StatelessWidget {
  const CheckerboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Lab1 Activity',
              style: TextStyle(
                color: Colors.white, // Set title text color to white
              ),
            ),
          ),
          backgroundColor: Colors.purple,
           bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Checkerboard',
                  style: TextStyle(
                    color: Colors.white, // Set tab text color to white
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.white, // Set tab text color to white
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCheckerboardTab(),
            _buildDescriptionTab(),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildCheckerboardTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: 420.0,
          height: 500.0,
          child: _buildChessboard(),
        ),
      ),
    );
  }

  Widget _buildDescriptionTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Checkers is a game played on a board checkered with squares of two colors. Two players compete in checkers to have the last piece on the board. ',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white, // Set text color to white
          ),
        ),
      ),
    );
  }

  Widget _buildChessboard() {
    return GridView.builder(
      itemCount: 64,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
      ),
      itemBuilder: (BuildContext context, int index) {
        final bool isWhite = (index + (index ~/ 8)) % 2 == 0;
        final bool isRed = index < 24 && !isWhite;
        final bool isBlue = index >= 40 && !isWhite;

        return Stack(
          children: [
            Container(
              color: isWhite ? Colors.white : Colors.black,
            ),
            if (isRed)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            if (isBlue)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
