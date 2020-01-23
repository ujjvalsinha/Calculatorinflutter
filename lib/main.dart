import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String result="";
  double resultsize=78.0;
  String eq="";
  double eqsize=58.0;
  double number1=0;
  double number2=0;
  String opration="";
  String display="";

  btnpressed(op){
    setState(() {
      if(op=='+'||op=='-'||op=='x'||op=='/'){

      if(number1!=0){
        number2=double.parse(display);
        if(opration=="+"){
          result=(number1+number2).toString();
          if(opration=="-"){
          result=(number1-number2).toString();
          }
          if(opration=="x"){
          result=(number1*number2).toString();
          }
          if(opration=="/"){
            if(number2==0){
              result="Cant divide by zero";
            }
            else
          result=(number1/number2).toString();
          }
          

        }
          number1=double.parse(result);
          number2=0;
          //result="";
          display="";
          eq=number1.toString();
          eq=eq+op;

      }
      else{
        number1=double.parse(display);
        opration=op;
        //result="";
        display="";
        eq=number1.toString();
        eq=eq+op;
      }
      }
      else if(op=="AC"){
        number1=0;
        number2=0;
        result="";
        eq="";
        display="";
        opration="";
      }

      else if(op=='.'){
        if(eq.contains('.'))
        return;
        else
        eq=eq+op;
        display=display+op;

      }
      

      else if(op=='='){
        number2=double.parse(display);
        if(opration=="+"){
          result=(number1+number2).toString();
        }
        if(opration=="-"){
          result=(number1-number2).toString();
          }
          if(opration=="x"){
          result=(number1*number2).toString();
          }
          if(opration=="/"){
            if(number2==0){
              result="Cant divide by zero";
            }
            else
          result=(number1/number2).toString();
          }

        display=result;
        number1=0;
      }
      else{
        display=display+op;
        eq=eq+op;
      }
    });
  }


  Widget buildbutton(String btntxt, col, txtcol) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.only(bottom: 10),
      height: 70,
      minWidth: 90,
      color: col, //Color(0xFF282828),
      child: Text(
        btntxt,
        style: TextStyle(color: txtcol, fontSize: 28),
      ),
      onPressed: () {
        btnpressed(btntxt);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.black),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        eq,
                        style: TextStyle(
                          color: Color(0xFFD3D3D3),
                          fontSize: eqsize,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        result,
                        style: TextStyle(
                          color: Color(0xFFD3D3D3),
                          fontSize: resultsize,
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildbutton("mc", Color(0xFF282828), Colors.white),
                      buildbutton("m+", Color(0xFF282828), Colors.white),
                      buildbutton("m-", Color(0xFF282828), Colors.white),
                      buildbutton("mr", Color(0xFF282828), Colors.white)
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildbutton("AC", Color(0xFF282828), Color(0xFFEEC213)),
                      buildbutton("←", Color(0xFF282828), Color(0xFFEEC213)),
                      buildbutton("+/-", Color(0xFF282828), Colors.white),
                      buildbutton("/", Color(0xFF282828), Colors.white)
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildbutton("7", Color(0xFF181818), Colors.white),
                      buildbutton("8", Color(0xFF181818), Colors.white),
                      buildbutton("9", Color(0xFF181818), Colors.white),
                      buildbutton("x", Color(0xFF282828), Colors.white)
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildbutton("4", Color(0xFF181818), Colors.white),
                      buildbutton("5", Color(0xFF181818), Colors.white),
                      buildbutton("6", Color(0xFF181818), Colors.white),
                      buildbutton("-", Color(0xFF282828), Colors.white),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildbutton("1", Color(0xFF181818), Colors.white),
                      buildbutton("2", Color(0xFF181818), Colors.white),
                      buildbutton("3", Color(0xFF181818), Colors.white),
                      buildbutton("+", Color(0xFF282828), Colors.white)
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      buildbutton("%", Color(0xFF181818), Colors.white),
                      buildbutton("0", Color(0xFF181818), Colors.white),
                      buildbutton(".", Color(0xFF181818), Colors.white),
                      buildbutton("=", Color(0xFFEEC213), Colors.white)
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
