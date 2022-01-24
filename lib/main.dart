import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int d, m, y;
  String days1="", month1="", year1="";
  late String date="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Age Calculator"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                width: 220.0,
                height: 70.0,
                child: ElevatedButton(
                    onPressed: (){f1();},
                    child: const Text(
                        "Choose Date",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                // date+" "+year1+" "+month1+" "+days1
                "Chosen Date : "+date,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.blue,
                    letterSpacing: .5,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "No. of Days : "+days1,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.blue,
                    letterSpacing: .5,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "No. of Months : "+month1,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.blue,
                    letterSpacing: .5,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "No. of Years : "+year1,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.blue,
                    letterSpacing: .5,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Future f1() async
  {
    DateTime? date1 = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
    setState(() {
      date = date1.toString().substring(0, 11);
      d =int.parse(DateFormat("dd").format(date1!));
      m =int.parse(DateFormat("MM").format(date1));
      y =int.parse(DateFormat("yy").format(date1));

      int d1 = int.parse(DateFormat("yy").format(DateTime.now()));
      int m1 = int.parse(DateFormat("MM").format(DateTime.now()));
      int y1 = int.parse(DateFormat("yy").format(DateTime.now()));

      int day = finddays(m1, y1);

      if(d1-d>=0) {
        days1 = (d1-d).toString()+" days";
      } else{
        days1 = (d1+day-d).toString()+" days";
        m1 = m1-1;
      }
      if(m1-m>=0){
        month1 = (m1-m).toString()+" months";
      }else{
        month1 = (m1+12-m).toString()+" months";
        y1 = y1-1;
      }
      year1 = (y1-y).toString()+" years";
    });
  }

  int finddays(int m1, int y1) {
    int day;
    if(m1==1 || m1==3 || m1==5 || m1==7 || m1==8 || m1==10 || m1==12){
      day = 31;
    }else if(m1==4 || m1==6 || m1==9 || m1==11){
      day = 30;
    }else{
      if(y1%4==0) {
        day = 29;
      } else {
        day = 28;
      }
    }
    return day;
  }
}
