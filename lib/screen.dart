
import 'package:flutter/material.dart';
class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;
  late double height = 0;
  late double weight = 0;
  late String result = "";
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(

        appBar: AppBar(
          title: Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(color: Colors.white),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Men", Colors.blueAccent, 0),
                    radioButton("Women", Colors.blueAccent, 1),
                  ],
                ),
                SizedBox(height: 20,),
                Text("Your Height in M:",
                  style: TextStyle(
                      fontSize: 24
                  ),
                ),
                SizedBox(height: 8,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  decoration: InputDecoration(
                      hintText: "your height in m",
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )
                  ),
                ),
                SizedBox(height: 20,),

                Text("Your Weight in KG:",
                  style: TextStyle(
                      fontSize: 24
                  ),
                ),
                SizedBox(height: 8,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  decoration: InputDecoration(
                      hintText: "your weight in kg",
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      )
                  ),
                ),
                SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.blueAccent,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate inputs and calculate BMI
                        setState(() {
                          height = double.tryParse(heightController.value.text) ?? 0;
                          weight = double.tryParse(weightController.value.text) ?? 0;
                        });
                        calculateBMI(height, weight);
                      },
                      child: Text("Calculate",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child: Text("Your BMI is : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child: Text("$result",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBMI(double height, double weight) {
    if (height > 0 && weight > 0) {
      double finalResult = weight / (height * height);
      String bmi = finalResult.toStringAsFixed(2);
      setState(() {
        result = bmi;
      });
    } else {
      setState(() {
        result = "Invalid input. Please enter valid height and weight.";
      });
    }
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: currentindex == index ? color : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
