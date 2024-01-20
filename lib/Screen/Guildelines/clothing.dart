import 'package:flutter/material.dart';

class Clothing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Clothing",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.0),
          Text(
            "In the effort to reduce your carbon footprint, making sustainable choices in clothing is crucial. Here are some eco-friendly practices to adopt:",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "1. Avoid Fast Fashion:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Fast fashion items are trendy, cheap, and quickly go out of style. Unfortunately, they often end up in landfills where they produce methane during decomposition. The average American discards about 80 pounds of clothing each year, with 85 percent ending up in landfills. Instead, opt for quality clothing that lasts.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "2. Buy Vintage or Recycled Clothing:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Consider purchasing vintage or recycled clothing from consignment shops. This not only reduces waste but also gives a second life to fashion items.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "3. Wash Clothing in Cold Water:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Use cold water to wash your clothing. Cold water detergent is designed to clean better in lower temperatures. This simple switch can save up to 500 pounds of carbon dioxide each year if you do two loads of laundry weekly.",
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
