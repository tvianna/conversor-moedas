import 'package:conversor_curso/app/components/currency_box.dart';
import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
          child: ListView(
            children: [
              Image.network('https://i.pinimg.com/originals/90/9e/5a/909e5aa23f8b3ff4d293dbeb162a59db.png',
              width: 150,
              height: 150,),
              SizedBox(height:40),
              CurrencyBox(selectedItem: homeController.toCurrency,
              controller: toText,
              items: homeController.currencies,
              onChanged: (model){
                setState(() {
                  homeController.toCurrency = model;
                });
              }),
              SizedBox(height:10),
              CurrencyBox(selectedItem: homeController.fromCurrency,
              controller: fromText,
              items: homeController.currencies, onChanged: (model){
                setState(() {
                  homeController.fromCurrency = model;
                });
              }),
            SizedBox(height:50),
            RaisedButton(
              color: Colors.amber,
              onPressed: () {
                homeController.convert();
              },
              child: Text('Converter'),)
          ],
          ),
        ),
      )
    );
  }
}