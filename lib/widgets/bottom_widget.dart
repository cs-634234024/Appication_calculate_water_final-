import 'package:calculate_water_2/screen/result_sreen.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final int type;
  final int service;
  final int changesize;
  final double water;
  const ButtonWidget(
      {super.key,
      required this.type,
      required this.service,
      required this.changesize,
      required this.water});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                    service: service,
                    size: changesize,
                    type: type,
                    water: water),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.indigo.shade300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Calculater',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ));
  }
}
