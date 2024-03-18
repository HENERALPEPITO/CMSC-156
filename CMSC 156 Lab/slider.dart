import 'package:flutter/material.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
        title: Center(
            child: Text(
              'Lab2 Activity',
              style: TextStyle(
                color: Colors.white, // Set title text color to white
              ),
            ),
          ),          backgroundColor: Colors.purple,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Sliders',
                  style: TextStyle(
                    color: Colors.white, // Set tab text color to white
                  ),
                ),
              ),              Tab(
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.white, // Set tab text color to white
                  ),
                ),
              ),            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildSlidersTab(),
            _buildDescriptionTab(),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget _buildSlidersTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: MyHomePage(title: 'Lab Activity 2'), 
      ),
    );
  }

  Widget _buildDescriptionTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'A slider in Flutter is a material design widget used for selecting a range of values. It is an input widget where we can set a range of values by dragging or pressing on the desired position.',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _blueBoxHeight = 100.0;
  double _redBoxHeight = 100.0;
  double _greenBoxHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBox(Colors.blue, _blueBoxHeight),
              _buildBox(Colors.red, _redBoxHeight),
              _buildBox(Colors.green, _greenBoxHeight),
            ],
          ),
          SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSlider(
                Colors.blue,
                (value) {
                  setState(() {
                    _blueBoxHeight = value;
                  });
                },
                'First Bar',
              ),
              _buildSlider(
                Colors.red,
                (value) {
                  setState(() {
                    _redBoxHeight = value;
                  });
                },
                'Second Bar',
              ),
              _buildSlider(
                Colors.green,
                (value) {
                  setState(() {
                    _greenBoxHeight = value;
                  });
                },
                'Third Bar',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBox(Color color, double height) {
    return Container(
      width: 100,
      child: Transform.translate(
        offset: Offset(0.0, -height / 2), // Move the box up by half of its height
        child: Container(
          height: height,
          color: color,
        ),
      ),
    );
  }

  Widget _buildSlider(Color color, ValueChanged<double> onChanged, String label) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white, // Set the label color to white
            fontWeight: FontWeight.bold,
          ),
        ),
        Slider(
          value: _getBoxHeight(color),
          min: 0,
          max: 220.0,
          onChanged: onChanged,
          activeColor: color,
        ),
      ],
    );
  }

  double _getBoxHeight(Color color) {
    if (color == Colors.blue) {
      return _blueBoxHeight;
    } else if (color == Colors.red) {
      return _redBoxHeight;
    } else {
      return _greenBoxHeight;
    }
  }
}
