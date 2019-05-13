import 'package:flutter/material.dart';
import 'package:pokerit/screens/card_grid.dart';
import 'package:pokerit/theme/style.dart';

import 'models/card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poker IT',
      home: PokerItPage(title: 'Poker IT'),
    );
  }
}

class PokerItPage extends StatefulWidget {
  PokerItPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PokerItPageState createState() => new _PokerItPageState();
}

class _PokerItPageState extends State<PokerItPage> {
  var initialCards = <CardModel>[]
    ..add(new CardModel("∞️", true))
    ..add(new CardModel("0", true))
    ..add(new CardModel("1/2", true))
    ..add(new CardModel("1", true))
    ..add(new CardModel("2", true))
    ..add(new CardModel("3", true))
    ..add(new CardModel("5", true))
    ..add(new CardModel("8", true))
    ..add(new CardModel("13", true))
    ..add(new CardModel("21", true))
    ..add(new CardModel("34", true))
    ..add(new CardModel("55", true))
    ..add(new CardModel("89", true))
    ..add(new CardModel("?", true));

  Future<Null> _showForm() async {
    CardModel newCard = await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Container();
        },
      ),
    );
    if (newCard != null) {
      initialCards.add(newCard);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text(widget.title),
        actions: [
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: () => _showForm(),
          ),
        ],
      ),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        ),
        child: new Center(
          child: new CardGrid(initialCards),
        ),
      ),
    );
  }
}