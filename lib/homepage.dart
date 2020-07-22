import 'dart:convert';

import 'package:covid20/datasource.dart';
import 'package:covid20/panals/countrypage.dart';
import 'package:covid20/panals/infopanel.dart';
import 'package:covid20/panals/mostaffected.dart';
import 'package:covid20/panals/worldwidepanal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchData() async
  {
    http.Response response=await http.get('https://corona.lmao.ninja/v2/all');

    setState(() {
      worldData=jsonDecode(response.body);
    });
  }


  List countryData;
  fetchCountryData() async
  {
    http.Response response=await http.get('https://corona.lmao.ninja/v2/countries');

    setState(() {
      countryData=jsonDecode(response.body);
    });
  }



  @override

  void initState() {
    fetchData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('COVID-19 DATA'),
      ),
      body: SingleChildScrollView(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 150,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  color: Colors.indigoAccent,
                  child:Text(DataSource.quote,
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("World-Wide"
                      ,style: TextStyle(fontSize:22,fontWeight:FontWeight.bold ),),
                      GestureDetector(
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryBlack,
                            borderRadius:BorderRadius.circular(15),
                          ),

                          padding: EdgeInsets.all(10),
                          child: Text("Regional"
                            ,style: TextStyle(fontSize:12,fontWeight:FontWeight.bold ,color: Colors.white,),),
                        ),
                      ),
                    ],
                  ),
                ),
                worldData==null?Center(child: CircularProgressIndicator()):WorldwidePanal(worldData:worldData),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Most Affected Countries"
                    ,style: TextStyle(fontSize:22,fontWeight:FontWeight.bold ),),
                ),

//                SizedBox(height: 10),
                countryData==null?Center(child: CircularProgressIndicator()):MostAffected(countryData: countryData,),
              InfoPanel(),
                SizedBox(height: 20),
                Padding(

                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Center(child:
                  Text('©आत्मनिर्भर भारत',style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold,
                  ),)),
                )
              ],
        ),
      ),

    );
  }
}
