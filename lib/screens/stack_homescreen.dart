// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class StackHomeWidgets extends StatefulWidget {
  const StackHomeWidgets({Key? key}) : super(key: key);

  @override
  State<StackHomeWidgets> createState() => _StackHomeWidgetsState();
}

class _StackHomeWidgetsState extends State<StackHomeWidgets> {
  static final _formKey = new GlobalKey<FormState>();

  double _specificPrice = 1;
  bool isButtonActive = true;

  @override
  Widget build(BuildContext context) {
    Color _purple = Colors.purple;
    double _baseQantity = 1;
    double _baseQantityPrice = 1;
    double _specific = 1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: _purple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: _purple),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\$ $_specificPrice",
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 2,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Input Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'market rate per item(s)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Enter Base Quantity';
                            }
                            return null;
                          },
                          style: const TextStyle(fontSize: 16),
                          onSaved: (valueQ) => {},
                          onChanged: (value) => {
                            _baseQantity = double.parse(value),
                          },
                          decoration: InputDecoration(
                              labelText: 'Base Quantity',
                              focusColor:
                                  const Color.fromARGB(255, 0, 116, 231),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              //isDense: true,
                              contentPadding: const EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                gapPadding: 5,
                                borderSide: const BorderSide(
                                    color: Colors.black26,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'Enter Base Quantity Price';
                            }
                            return null;
                          },
                          style: const TextStyle(fontSize: 16),
                          onSaved: (valueQ) => {},
                          onChanged: (value) => {
                            _baseQantityPrice = double.parse(value),
                          },
                          decoration: InputDecoration(
                              labelText: 'Base Quantity Price',
                              focusColor:
                                  const Color.fromARGB(255, 0, 116, 231),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              //isDense: true,
                              contentPadding: const EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                gapPadding: 5,
                                borderSide: const BorderSide(
                                    color: Colors.black26,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'our',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Specific';
                        }
                        return null;
                      },
                      style: const TextStyle(fontSize: 16),
                      onChanged: (value) => {
                        _specific = double.parse(value),
                      },
                      decoration: InputDecoration(
                          labelText: 'Specific',
                          focusColor: const Color.fromARGB(255, 0, 116, 231),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          //isDense: true,
                          contentPadding: const EdgeInsets.all(12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            gapPadding: 5,
                            borderSide: const BorderSide(
                                color: Colors.black26,
                                width: 0.5,
                                style: BorderStyle.solid),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _specificPrice =
                                    ((_baseQantityPrice * _specific) /
                                        _baseQantity);
                              });

                              /*         Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      StackHomeWidgets()));*/
                            }
                          },
                          style: TextButton.styleFrom(
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 45),
                            backgroundColor: Color.fromARGB(255, 237, 26, 58),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            elevation: 4,
                          ),
                          child: Text(
                            "Verify",
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
