import 'package:flutter/material.dart';

class Transportation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transportation",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.0),
          Text(
            "Reducing your carbon footprint in transportation is essential for environmental sustainability. Here are some eco-friendly practices to adopt:",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "1. Drive Less:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Opt for alternatives like walking, public transportation, carpooling, ridesharing, or biking whenever possible. This not only reduces CO2 emissions but also lessens traffic congestion and engine idling.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "2. Avoid Unnecessary Braking and Acceleration:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Aggressive driving can result in 40 percent more fuel consumption than consistent, calm driving. Avoid unnecessary braking and acceleration to improve fuel efficiency.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "3. Take Care of Your Car:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Keep your tires properly inflated to increase fuel efficiency by three percent. Ensure that your car is properly maintained, remove any extra weight, and consider the environmental impact of manufacturing when choosing a vehicle.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "4. Combine Errands:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Reduce your driving by combining errands and planning routes efficiently.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "5. Use Traffic Apps:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Use traffic apps like Waze to help avoid getting stuck in traffic jams, optimizing your travel routes.",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Text(
            "6. Consider Hybrid or Electric Vehicles:",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "If you're in the market for a new car, consider purchasing a hybrid or electric vehicle. Factor in the greenhouse gas emissions from both the production and operation of the vehicle.",
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
