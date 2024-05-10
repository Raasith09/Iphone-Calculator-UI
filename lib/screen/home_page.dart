import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '';
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/' ||
        buttonText == '%') {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = '';
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      if (_operand == '+') {
        _output = (_num1 + _num2).toString();
      }
      if (_operand == '-') {
        _output = (_num1 - _num2).toString();
      }
      if (_operand == '*') {
        _output = (_num1 * _num2).toString();
      }
      if (_operand == '/') {
        _output = (_num1 / _num2).toString();
      }
      if (_operand == '%') {
        _output = (_num1 % _num2).toString();
      }
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else {
      _output += buttonText;
    }

    setState(() {});
  }

  List<List<String>> data = [
    ["C", "D", "%", "÷"],
    ["7", "8", "9", "x"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(
                    right: 16, left: 16, top: 16, bottom: 0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _output.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(
                  right: 16, left: 16, top: 0, bottom: 16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 370,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (ctx, index) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                for (var sub in data[index])
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () => buttonPressed(sub),
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                              color: sub.contains("÷") ||
                                                      sub.contains("x") ||
                                                      sub.contains("-") ||
                                                      sub.contains("+")
                                                  ? const Color(0xffFFA008)
                                                  : sub.contains("C") ||
                                                          sub.contains("D") ||
                                                          sub.contains("%")
                                                      ? const Color(0xffA7A6A7)
                                                      : const Color(0xff333333),
                                              shape: BoxShape.circle),
                                          child: Center(
                                              child: Text(
                                            sub,
                                            style: const TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                              ],
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => buttonPressed("0"),
                          child: Container(
                            height: 70,
                            width: 165,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: const Color(0xff333333),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Center(
                              child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => buttonPressed("."),
                          child: Container(
                            height: 70,
                            width: 70,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: const BoxDecoration(
                                color: Color(0xff333333),
                                shape: BoxShape.circle),
                            child: const Center(
                                child: Text(
                              ".",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () => buttonPressed("="),
                          child: Container(
                            height: 70,
                            width: 70,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: const BoxDecoration(
                                color: Color(0xffFFA008),
                                shape: BoxShape.circle),
                            child: const Center(
                                child: Text(
                              "=",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
