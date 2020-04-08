import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Covid extends StatefulWidget {
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  var url = 'https://api.covid19india.org/data.json';
  var response;
  var flag = false;
  var resp;
  var stat;
  getJSON() async {
    response = await http.get(url);
    resp = convert.jsonDecode(response.body);
    stat = resp['statewise'][0];
    setState(() {
      flag = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    getJSON();
    return Scaffold(
      backgroundColor: Colors.white,
      body: flag == false ? Center(child: CircularProgressIndicator()) : ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20),
            child: Text('COVID-19 TRACKER', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('INDIA', style: TextStyle(color: Colors.redAccent[400],fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                banner(Colors.red, 'AFFECTED', stat['confirmed'].toString(), stat['deltaconfirmed'].toString()),
                banner(Colors.blue, 'ACTIVE', stat['active'].toString(), ''),
                banner(Colors.green, 'RECOVERED', stat['recovered'].toString(), stat['deltarecovered'].toString()),
                banner(Colors.grey, 'DEATHS', stat['deaths'].toString(), stat['deltadeaths'].toString()),
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('31 STATES/UNION TERRITORIES AFFECTED', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: shower(),
            ),
          )
        ],
      )
    );
  }

  shower(){
    return ListView.builder(
      itemCount: resp['statewise'].length,
      itemBuilder: (BuildContext context, int index){
        if (index == 0)
          return SizedBox();
        return resp['statewise'][index]['confirmed'].toString() == '0' ? SizedBox() : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              height: MediaQuery.of(context).size.height / 20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(resp['statewise'][index]['state'].toString().toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(resp['statewise'][index]['confirmed'].toString().toUpperCase(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(resp['statewise'][index]['active'].toString().toUpperCase(), style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(resp['statewise'][index]['recovered'].toString().toUpperCase(), style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(resp['statewise'][index]['deaths'].toString().toUpperCase(), style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
                    ),
                  ),
                ]
              )
            ),
          ),
        );
      },
    );
  }

  Widget banner(Color color, String title, String count, String delta){
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width / 4.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(color: color,fontSize: 15, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width / 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color
                ),
                child: Center(child: Text(count, style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold)))
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                title != 'ACTIVE' ? Text('Today : ', style: TextStyle(color: color)) : SizedBox(),
                Text(delta, style: TextStyle(color: color))
              ],
            )
          ],
        ),
      ),
    );
  }

}