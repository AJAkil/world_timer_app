import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    print(data);

    // set backgruound
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    Color otherColor = data['isDayTime'] ?   Colors.black : Colors.grey[300];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/day.png'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 128, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: otherColor,
                  ),
                  label: Text(
                      'Edit Location',
                  style: TextStyle(
                    color: otherColor
                  ),),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: otherColor
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: otherColor
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
