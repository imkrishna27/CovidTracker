import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldwidePanal extends StatelessWidget {

  final Map worldData;

  const WorldwidePanal({Key key, this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2
        ,childAspectRatio: 2 ),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panalcolor: Colors.red[100],
            textcolor: Colors.red,
            count:worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panalcolor: Colors.blue[100],
            textcolor: Colors.blue[900],
            count:worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panalcolor: Colors.green[100],
            textcolor: Colors.green[900],
            count:worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'DEATHS',
            panalcolor: Colors.grey[400],
            textcolor: Colors.grey[900],
            count:worldData['deaths'].toString(),
          ),
        ],
      )
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panalcolor;
  final Color textcolor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panalcolor, this.textcolor, this.title, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(4),
      color: panalcolor,
      height: 80,
      width: width/2,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 16,color: textcolor,
            ),
          ),
          Text(count,
            style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 16,color: textcolor,
            ),
          ),

        ],
      )
    );
  }
}
