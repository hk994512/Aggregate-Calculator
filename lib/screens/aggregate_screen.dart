import 'package:cgpa_calculator/extension/extension.dart';
import 'package:cgpa_calculator/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';

class AggregateCalculatorScreen extends StatefulWidget {
  const AggregateCalculatorScreen({super.key});
  @override
  AggregateCalculatorScreenState createState() =>
      AggregateCalculatorScreenState();
}

class AggregateCalculatorScreenState extends State<AggregateCalculatorScreen> {
  final TextEditingController matricObtainedController =
      TextEditingController();
  final TextEditingController matricTotalController = TextEditingController();
  final TextEditingController fscObtainedController = TextEditingController();
  final TextEditingController fscTotalController = TextEditingController();
  final TextEditingController testObtainedController = TextEditingController();
  final TextEditingController testTotalController = TextEditingController();

  String selectedQualification = "FSC-Intermediate";
  double? ecatAggregate;
  double? nonEcatAggregate;

  void calculateAggregate() {
    final double matricMarks =
        double.tryParse(matricObtainedController.text) ?? 0;
    final double matricTotal = double.tryParse(matricTotalController.text) ?? 0;
    final double fscMarks = double.tryParse(fscObtainedController.text) ?? 0;
    final double fscTotal = double.tryParse(fscTotalController.text) ?? 0;
    final double testMarks = double.tryParse(testObtainedController.text) ?? 0;
    final double testTotal = double.tryParse(testTotalController.text) ?? 0;

    if (matricTotal == 0 ||
        fscTotal == 0 ||
        (selectedQualification.contains("FSC") && testTotal == 0)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    final double matricPercent = (matricMarks / matricTotal) * 100;
    final double fscPercent = (fscMarks / fscTotal) * 100;
    final double testPercent =
        testTotal > 0 ? (testMarks / testTotal) * 100 : 0;

    if (selectedQualification == "FSC-Intermediate" ||
        selectedQualification == "A-Level" ||
        selectedQualification == "DAE") {
      ecatAggregate =
          (matricPercent * 0.10) + (fscPercent * 0.40) + (testPercent * 0.50);
    } else {
      ecatAggregate = null;
    }

    nonEcatAggregate = (matricPercent * 0.30) + (fscPercent * 0.70);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final qualifications = [
      "Select Qualification",
      "FSC-Intermediate",
      "A-Level",
      "DAE",
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 57, 89, 187),
        title: UIHelpers.text(
          "Aggregate Calculator",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedQualification,
              items:
                  qualifications
                      .map((q) => DropdownMenuItem(value: q, child: Text(q)))
                      .toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() => selectedQualification = val);
                }
              },
              decoration: InputDecoration(
                labelText: "Select Qualification",
                border: OutlineInputBorder(),
              ),
            ),
            16.0.ht,
            Row(
              children: [
                Expanded(
                  child: buildInput(
                    "Matric Obtained",
                    matricObtainedController,
                  ),
                ),
                10.0.wt,
                Expanded(
                  child: buildInput("Matric Total", matricTotalController),
                ),
              ],
            ),
            10.0.ht,
            Row(
              children: [
                Expanded(
                  child: buildInput(
                    "FSc/DAE/A-Level Obtained",
                    fscObtainedController,
                  ),
                ),
                10.0.wt,
                Expanded(
                  child: buildInput(
                    "FSc/DAE/A-Level Total",
                    fscTotalController,
                  ),
                ),
              ],
            ),
            10.0.ht,
            Row(
              children: [
                Expanded(
                  child: buildInput("Test Obtained", testObtainedController),
                ),
                10.0.wt,
                Expanded(child: buildInput("Test Total", testTotalController)),
              ],
            ),
            20.0.ht,
            ElevatedButton(
              onPressed: calculateAggregate,
              child: UIHelpers.text('Calculate Aggregate'),
            ),
            20.0.ht,
            if (ecatAggregate != null)
              Column(
                children: [
                  UIHelpers.text(
                    "Aggregate (ECAT): ${ecatAggregate!.toStringAsFixed(2)}%",
                    fontSize: 18,
                    color: Colors.greenAccent,
                  ),
                  UIHelpers.text(
                    "Aggregate (ECAT): ${nonEcatAggregate!.toStringAsFixed(2)}%",
                    fontSize: 18,
                    color: Colors.greenAccent,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget buildInput(String label, TextEditingController controller) {
    return UIHelpers.field(label, controller);
  }
}
