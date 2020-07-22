import 'package:covid20/datasource.dart';
import 'package:covid20/panals/FAQ.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: <Widget>[
          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQ()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
              color:primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   Text('FAQS',
                  style: TextStyle(
                    color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                  ),),
                  Icon(Icons.arrow_forward,color:Colors.white),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
              color:primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('DONATE',
                    style: TextStyle(
                      color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                    ),),
                  Icon(Icons.arrow_forward,color:Colors.white),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap:()
            {
              launch('https://www.who.int/westernpacific/emergencies/covid-19/information/mythbusters');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
              color:primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('MYTH BUSTERS',
                    style: TextStyle(
                      color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18,
                    ),),
                  Icon(Icons.arrow_forward,color:Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
