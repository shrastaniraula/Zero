import 'package:flutter/material.dart';

class Miscellaneous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Miscellaneous Guidelines",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.0),
          Text(
            "In addition to making sustainable choices in food, clothing, and transportation, there are various miscellaneous practices that contribute to reducing your carbon footprint. Here are some miscellaneous guidelines:",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "1. Buy Less Stuff:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Minimize your consumption by buying only what you need. Choose used or recycled items whenever possible to reduce environmental impact.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "2. Bring Your Own Reusable Bag:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Carry your own reusable bag when you shop to reduce plastic waste and encourage sustainable practices.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "3. Avoid Items with Excess Packaging:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Choose products with minimal packaging to reduce waste. Avoid unnecessary packaging whenever possible.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "4. Opt for Energy-Efficient Products:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "When shopping for appliances, lighting, office equipment, or electronics, look for Energy Star products certified to be more energy-efficient.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "5. Support Environmentally Responsible Companies:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Choose to support and buy from companies that prioritize environmental responsibility and sustainability.",
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
