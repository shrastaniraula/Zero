import 'package:flutter/material.dart';
// import 'package:circular/circular.dart';
import 'package:zero/Widgets/calculator/circular_drag.dart';
// import 'tips_screen.dart';

class CarbonFootprintCalculator extends StatefulWidget {
  @override
  _CarbonFootprintCalculatorState createState() =>
      _CarbonFootprintCalculatorState();
}

class _CarbonFootprintCalculatorState extends State<CarbonFootprintCalculator> {
  // Define the variables that will store the user's inputs
  double _carMileage = 0;
  double _carUsageTime = 0;
  double _publicTransportUsageTime = 0;
  double _flightsPerYear = 0;
  double _meatConsumption = 0;
  double _plasticUsage = 0;
  double _electricityUsage = 0;
  double _age = 0;

  // double house = 0;

  // Define the variables that will store the carbon footprint calculations
  double _carCarbonFootprint = 0;
  double _publicTransportCarbonFootprint = 0;
  double _flightsCarbonFootprint = 0;
  double _meatCarbonFootprint = 0;
  double _plasticCarbonFootprint = 0;
  double _electricityCarbonFootprint = 0;
  double _totalCarbonFootprint = 0;

  // Define the function that will calculate the carbon footprint
  void _calculateCarbonFootprint() {
    // Calculate the carbon footprint for each input
    _carCarbonFootprint = _carMileage * _carUsageTime * 0.42;
    _publicTransportCarbonFootprint = _publicTransportUsageTime * 0.09;
    _flightsCarbonFootprint = _flightsPerYear * 0.24;
    _meatCarbonFootprint = _meatConsumption * 2.5;
    _plasticCarbonFootprint = _plasticUsage * 0.11;
    _electricityCarbonFootprint = _electricityUsage * 1.35;

    // Calculate the total carbon footprint
    _totalCarbonFootprint = _carCarbonFootprint +
        _publicTransportCarbonFootprint +
        _flightsCarbonFootprint +
        _meatCarbonFootprint +
        _plasticCarbonFootprint +
        _electricityCarbonFootprint;

    if (_totalCarbonFootprint < 10) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Great job!"),
            content: Text(
                "Your carbon footprint is less than 10 tons of CO2 per year."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    } else {
      double treesToPlant = (_totalCarbonFootprint - 10) / 0.6;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("You can do better!"),
            content: Text(
                "Your carbon footprint is ${_totalCarbonFootprint.toStringAsFixed(2)} tons of CO2 per year. You should plant ${treesToPlant.toStringAsFixed(0)} trees per year to offset your carbon emissions."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }

    // Update the UI with the new values
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: const Color.fromARGB(255, 185, 185, 185),
                      offset: Offset(1, 1),
                      blurRadius: 5.0),
                ],
              ),
              margin: const EdgeInsets.all(60),
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Enter your information to calculate your carbon footprint:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Car mileage \n(miles per gallon)",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CircularSlide(
                            setValue: (val) {
                              setState(() {
                                _carMileage = val;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Car usage time \n(hours per week)",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CircularSlide(
                            setValue: (val) {
                              setState(() {
                                _carUsageTime = val;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Flights per year\n",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CircularSlide(
                            setValue: (val) {
                              setState(() {
                                _flightsPerYear = val;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Public transport usage\n(hrs/week)",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CircularSlide(
                            setValue: (val) {
                              setState(() {
                                _publicTransportUsageTime = val;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Meat consumption \n(pounds per week)",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CircularSlide(
                            setValue: (val) {
                              setState(() {
                                _meatConsumption = val;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Plastic usage \n(pounds per week)",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CircularSlide(
                            setValue: (val) {
                              setState(() {
                                _plasticUsage = val;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Electricity Usage \n(Kilowatts per month)",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CircularSlide(
                            setValue: (val) {
                              setState(() {
                                _electricityUsage = val;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            "Your Age\n",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CircularSlide(
                            setValue: (val) {
                              setState(() {
                                _age = val;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _calculateCarbonFootprint,
                    child: Text('Calculate'),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
