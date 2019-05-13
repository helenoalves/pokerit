import 'package:flutter/material.dart';
import 'package:pokerit/models/card.dart';

import 'card_selected_component.dart';

class CardComponent extends StatefulWidget {
  final CardModel cardModel;

  CardComponent(this.cardModel);

  @override
  CardComponentState createState() {
    return new CardComponentState(cardModel);
  }
}

class CardComponentState extends State<CardComponent> {
  CardModel cardModel;
  String renderUrl;

  CardComponentState(this.cardModel);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        selectCard();
      },
      child: new Container(
        margin: new EdgeInsets.all(4.0),
        child: new Center(
          child: new Text(
            cardModel.value,
            style: new TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: new BoxDecoration(
          border: new Border.all(width: 6,color: Colors.white),
          color: Colors.grey[200],
          borderRadius: new BorderRadius.all(
            const Radius.circular(8.0),
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: const Color(0xcc000000),
              offset: new Offset(2.0, 2.0),
              blurRadius: 4.0,
            ),
          ],
        ),
      ),
    );
  }

  selectCard() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new CardSelectedComponent(cardModel);
    }));
  }
}
