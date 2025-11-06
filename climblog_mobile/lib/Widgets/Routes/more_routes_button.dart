import 'package:flutter/material.dart';

class MoreRoutesButton extends StatelessWidget {
  const MoreRoutesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    onTap: () {
                        Navigator.of(context).pushNamed("/routesAll");
                      },

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color.fromARGB(255, 241, 240, 240),
                      ),
                      padding: EdgeInsets.only(top: 8,bottom: 5),
                      height: 55,
                      width: 55,
                      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                      child: Icon(Icons.more_horiz, size: 30,),
                    ),
                  );
  }
}
