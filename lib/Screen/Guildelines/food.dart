import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  final List<Map<String, String>> foodTips = [
    {
      'title': 'Eat low on the food chain:',
      'description':
          'Consume mostly fruits, veggies, grains, and beans. Livestock—meat and dairy—is responsible for 14.5 percent of manmade global greenhouse gas emissions. Every day that you forgo meat and dairy, you can reduce your carbon footprint by 8 pounds—that’s 2,920 pounds a year. Consider joining Meatless Mondays.',
      'image': 'img/kimchi.png',
    },
    {
      'title': 'Choose organic and local foods:',
      'description':
          'Transporting food from far away uses fossil fuels. Opt for organic and local foods that are in season to reduce the carbon footprint associated with transportation.',
      'image': 'img/kimchi.png',
    },
    {
      'title': 'Buy foodstuffs in bulk:',
      'description':
          'Reduce packaging waste by buying food in bulk using your own reusable container.',
      'image': 'kimchi.png',
    },
    {
      'title': 'Reduce food waste:',
      'description':
          'Plan meals ahead, freeze excess, and reuse leftovers to minimize food waste.',
      'image': 'assets/food_image_4.jpg',
    },
    {
      'title': 'Compost your food waste:',
      'description':
          'If possible, compost your food waste to further reduce environmental impact.',
      'image': 'assets/food_image_5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Food",
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.0),
          Text(
            "In the face of the recent National Climate Assessment report on the threats of climate change, taking steps to reduce your carbon footprint is crucial. Here are some ways to make a difference through your food choices:",
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 12.0),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: foodTips.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 1.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color.fromARGB(255, 228, 228, 228),
                        offset: Offset(0, 3),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                  child: index.isOdd
                      ? _buildFoodCardWithImageOnLeft(foodTips[index])
                      : _buildFoodCardWithImageOnRight(foodTips[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodCard(Map<String, String> tip) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tip['title']!,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          tip['description']!,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  Widget _buildFoodCardWithImageOnLeft(Map<String, String> tip) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: _buildFoodCard(tip),
        ),
        SizedBox(width: 12.0),
        Expanded(
          flex: 1,
          child: Container(
            height: 120.0,
            // decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(8.0),
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //     color: Color.fromARGB(255, 185, 185, 185),
            //     offset: Offset(1, 1),
            //     blurRadius: 5.0,
            //   ),
            // ],
            // ),\
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                tip['image']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFoodCardWithImageOnRight(Map<String, String> tip) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 120.0,
            // decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(8.0),
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //     color: Color.fromARGB(255, 185, 185, 185),
            //     offset: Offset(1, 1),
            //     blurRadius: 5.0,
            //   ),
            // ],
            // ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                tip['image']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.0),
        Expanded(
          flex: 2,
          child: _buildFoodCard(tip),
        ),
      ],
    );
  }
}
