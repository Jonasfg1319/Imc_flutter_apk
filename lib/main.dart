import 'dart:ffi';

import "package:flutter/material.dart";

void main(){

   runApp(MaterialApp(

      home: Home(),

   ));

}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  String _infotext = "Informe seus dados";

  void resetField(){
    setState(() {
      _infotext = "Informe seus dados";
    });
    weightController.text = "";
    heightController.text = "";



  }

  void calculate(){
     setState(() {
       double weight = double.parse(weightController.text);
       double height = double.parse(heightController.text) / 100;

       double imc = weight / (height*height);

       if(imc < 18.5){
         _infotext = "Abaixo do peso ${imc.toStringAsPrecision(4)}";
       }else if(imc >= 18.5 && imc <= 24.99){

         _infotext = "Peso normal ${imc.toStringAsPrecision(4)}";

       }else if(imc >= 25 && imc <= 29.99){

         _infotext = "Acima do peso ${imc.toStringAsPrecision(4)}";

       }else if(imc >= 30 && imc <= 34.99){

         _infotext = "Obesidade grau 1 ${imc.toStringAsPrecision(4)}";
       }else if(imc >= 35 && imc <= 39.99 ) {
         _infotext = "Obesidade grau 2 ${imc.toStringAsPrecision(4)}";
       }else if(imc >= 40){
         _infotext = "Obesidade Morbida ${imc.toStringAsPrecision(4)}";
       }

     });





  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text('Calculadora de imc'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
         actions: <Widget>[
           IconButton(icon: Icon(Icons.refresh), onPressed: (){

               resetField();
           })
         ],
       ),
      backgroundColor: Colors.cyanAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 120.0, color: Colors.white),
            TextField(keyboardType: TextInputType.number, decoration: InputDecoration(
                labelText: "Peso (KG)",labelStyle: TextStyle(color: Colors.amber)
            ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller: weightController,
            ),
            TextField(keyboardType: TextInputType.number, decoration: InputDecoration(
                labelText: "Altura(CM)",labelStyle: TextStyle(color: Colors.amber)
            ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
              controller:  heightController,
            ),
             Padding(
               padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
               child: Container(
                 height: 50.0,
                 child: RaisedButton(

                   onPressed: calculate,

                   child:  Text("Calcular", style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold), ),
                   color: Colors.black38,
                 ) ,
               ) ,

             ),
            Text(_infotext,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0,color: Colors.black38),

            )

          ],
        ),
      )
    );
  }
}


