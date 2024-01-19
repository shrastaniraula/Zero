import 'package:flutter/material.dart';
import 'package:zero/Screen/Guildelines/clothing.dart';
import 'package:zero/Screen/Guildelines/food.dart';
import 'package:zero/Screen/Guildelines/miscell.dart';
import 'package:zero/Screen/Guildelines/transport.dart';

class Guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Reduce your Carbon Imprints"),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {
                // Handle notifications button press
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Food"),
              Tab(text: "Clothing"),
              Tab(text: "Transport"),
              Tab(text: "Miscellaneous"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FoodPage(),
            Clothing(),
            Transportation(),
            Miscellaneous(),
          ],
        ),
      ),
    );
  }
}
