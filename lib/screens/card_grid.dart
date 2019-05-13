import 'package:flutter/material.dart';
import 'package:pokerit/components/card_component.dart';
import 'package:pokerit/models/card.dart';

class CardGrid extends StatelessWidget {
  final List<CardModel> cards;

  CardGrid(this.cards);

  GridView _buildCards(context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: (itemWidth / itemHeight),
      ),
      controller: new ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: _buildGridItems,
      itemCount: cards.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCards(context);
  }

  Widget _buildGridItems(BuildContext context, int index) {
    return CardComponent(cards[index]);
  }
}