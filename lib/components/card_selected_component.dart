import 'package:flutter/material.dart';
import 'package:pokerit/models/card.dart';

class CardSelectedComponent extends StatefulWidget {
  final CardModel cardModel;

  CardSelectedComponent(this.cardModel);

  @override
  CardSelectedComponentState createState() {
    return new CardSelectedComponentState(cardModel);
  }
}

class CardSelectedComponentState extends State<CardSelectedComponent> {
  CardModel cardModel;
  Image renderImage;
  bool isFront = true;
  BoxDecoration cardDecoration;

  CardSelectedComponentState(this.cardModel);

  BoxDecoration frontDescoration() {
    return new BoxDecoration(
      border: new Border.all(width: 12, color: Colors.white),
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
    );
  }

  BoxDecoration backDescoration() {
    return new BoxDecoration(
      image: new DecorationImage(
        centerSlice: new Rect.fromLTWH(50.0, 50.0, 220.0, 90.0),
        fit: BoxFit.fill,
        image: NetworkImage('https://picsum.photos/100'),
      ),
      border: new Border.all(width: 12, color: Colors.white),
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
    );
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cardDecoration = frontDescoration();
    return new GestureDetector(
      onTap: () {
        turnCard(context);
      },
      child: new AnimatedContainer(
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        margin: new EdgeInsets.all(10.0),
        child: new Center(
          child: new Text(
            cardModel.value,
            style: new TextStyle(
              color: Colors.black,
              fontSize: 60.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: cardDecoration,
      ),
    );
  }

  turnCard(BuildContext context) {
    setState(() {
      cardDecoration:
      isFront ? backDescoration() : frontDescoration();
    });
    build(context);
    isFront = !isFront;
  }
}
