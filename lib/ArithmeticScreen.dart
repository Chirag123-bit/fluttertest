import 'package:flutter/material.dart';
import 'package:fluttertest/model/artithmetic.dart';

class ArithmeticScreen extends StatefulWidget {
  const ArithmeticScreen({Key? key}) : super(key: key);

  @override
  State<ArithmeticScreen> createState() => _ArithmeticScreenState();
}

class _ArithmeticScreenState extends State<ArithmeticScreen> {
  String result = "";

  TextEditingController num1Controller = TextEditingController();

  TextEditingController num2Controller = TextEditingController();

  Arithmetic arithmetic = Arithmetic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Arithmetic'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: SafeArea(
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      key: const ValueKey("txtNum1"),
                      controller: num1Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Number 1',
                        hintText: "Number 1",
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      key: const ValueKey("txtNum2"),
                      controller: num2Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Number 2',
                        hintText: "Number 2",
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        key: const ValueKey("btnAdd"),
                        onPressed: () {
                          arithmetic.first = int.parse(num1Controller.text);
                          arithmetic.second = int.parse(num2Controller.text);

                          result = arithmetic.add().toString();
                          setState(() {
                            result = result;
                          });
                          Navigator.pushNamed(context, "/result",
                              arguments: result);
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          key: const ValueKey("btnSub"),
                          onPressed: () {
                            arithmetic.first = int.parse(num1Controller.text);
                            arithmetic.second = int.parse(num2Controller.text);

                            result = arithmetic.sub().toString();
                            setState(() {
                              result = result;
                            });
                            Navigator.pushNamed(context, "/result",
                                arguments: result);
                          },
                          child: const Text("Subtract",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      child: Center(
                        child: Text("Result: $result",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
