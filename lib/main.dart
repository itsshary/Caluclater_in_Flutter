import 'package:flutter/material.dart';
import 'package:flutter_application_2/colors.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var userinput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        userinput.toString(),
                        style:
                            const TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Custom(
                          title: 'Ac',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput = '';
                            answer = '';
                            setState(() {});
                          }),
                      Custom(
                          title: '+/-',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '+/-';
                            setState(() {});
                          }),
                      Custom(
                          title: '%',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '%';
                            setState(() {});
                          }),
                      Custom(
                          title: '/',
                          bgcolor: Colors.amber,
                          onpress: () {
                            userinput += '/';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Custom(
                          title: '7',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '7';
                            setState(() {});
                          }),
                      Custom(
                          title: '8',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '8';
                            setState(() {});
                          }),
                      Custom(
                          title: '9',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '9';
                            setState(() {});
                          }),
                      Custom(
                          title: 'x',
                          bgcolor: Colors.amber,
                          onpress: () {
                            userinput += 'x';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Custom(
                          title: '4',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '4';
                            setState(() {});
                          }),
                      Custom(
                          title: '5',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '5';
                            setState(() {});
                          }),
                      Custom(
                          title: '6',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '6';
                            setState(() {});
                          }),
                      Custom(
                          title: '-',
                          bgcolor: Colors.amber,
                          onpress: () {
                            userinput += '-';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Custom(
                          title: '1',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '1';
                            setState(() {});
                          }),
                      Custom(
                          title: '2',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '2';
                            setState(() {});
                          }),
                      Custom(
                          title: '3',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '3';
                            setState(() {});
                          }),
                      Custom(
                          title: '+',
                          bgcolor: Colors.amber,
                          onpress: () {
                            userinput += '+';
                            setState(() {});
                          }),
                    ],
                  ),
                  Row(
                    children: [
                      Custom(
                          title: '0',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '0';
                            setState(() {});
                          }),
                      Custom(
                          title: '.',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput += '.';
                            setState(() {});
                          }),
                      Custom(
                          title: 'Del',
                          bgcolor: backcolor,
                          onpress: () {
                            userinput =
                                userinput.substring(0, userinput.length - 1);
                            setState(() {});
                          }),
                      Custom(
                          title: '=',
                          bgcolor: Colors.amber,
                          onpress: () {
                            equalpress();
                            setState(() {});
                          }),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }

//Using Math Expression Package from pub.dev
  void equalpress() {
    String finalUser = userinput;
    finalUser = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUser);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

//Componets class mean designs  button
class Custom extends StatelessWidget {
  final Color bgcolor;
  final String title;
  final VoidCallback onpress;

  const Custom(
      {super.key,
      required this.bgcolor,
      required this.title,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        splashColor: Colors.deepOrange,
        onTap: onpress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            height: 65,
            decoration: BoxDecoration(shape: BoxShape.circle, color: bgcolor),
            child: Center(
                child: Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
