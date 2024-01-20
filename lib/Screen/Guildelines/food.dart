import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Global/colors.dart';

class FoodPage extends StatelessWidget {
  final List<Map<String, String>> foodTips = [
    {
      'title': 'Eat low on the food chain:',
      'description':
          'Consume mostly fruits, veggies, grains, and beans. Livestock—meat and dairy—is responsible for 14.5 percent of manmade global greenhouse gas emissions. Every day that you forgo meat and dairy, you can reduce your carbon footprint by 8 pounds—that’s 2,920 pounds a year. Consider joining Meatless Mondays.',
      'image': 'assets/img/kimchi.png',
    },
    {
      'title': 'Choose organic and local foods:',
      'description':
          'Transporting food from far away uses fossil fuels. Opt for organic and local foods that are in season to reduce the carbon footprint associated with transportation.',
      'image': 'assets/img/kimchi.png',
    },
    {
      'title': 'Buy foodstuffs in bulk:',
      'description':
          'Reduce packaging waste by buying food in bulk using your own reusable container.',
      'image': 'assets/img/kimchi.png',
    },
    {
      'title': 'Reduce food waste:',
      'description':
          'Plan meals ahead, freeze excess, and reuse leftovers to minimize food waste.',
      'image': 'assets/img/kimchi.png',
    },
    {
      'title': 'Compost your food waste:',
      'description':
          'If possible, compost your food waste to further reduce environmental impact.',
      'image': 'assets/img/kimchi.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Food",
            style:
                GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Gap(12),
          Text(
            "In the face of the recent National Climate Assessment report on the threats of climate change, taking steps to reduce your carbon footprint is crucial. Here are some ways to make a difference through your food choices:",
            style: GoogleFonts.aBeeZee(fontSize: 16),
          ),
          const SizedBox(height: 12.0),
          MasonryGridView.builder(
            itemCount: foodTips.length, // Use the length of galleryImgs
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            // physics:
            //     const NeverScrollableScrollPhysics(), // Disable scrolling for MasonryGridView
            itemBuilder: (context, index) {
              var data = foodTips[index]; // Access the GalleryImg instance

              return Container(
                margin: const EdgeInsets.only(bottom: 1.0),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppTheme.grey.withOpacity(0.2),
                      offset: const Offset(1, 1),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: Column(children: [
                  Text(
                    data['title']!,
                    style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.amber,
                  ),
                  Text(
                    data['description']!,
                    style: GoogleFonts.aBeeZee(fontSize: 16),
                  )
                ]),
              );
            },
          )
        ],
      ),
    );
  }
}
