import 'package:climblog_mobile/Widgets/Routes/route_add_form.dart';
import 'package:flutter/material.dart';

class RouteAddButton extends StatelessWidget {
  const RouteAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              insetPadding: const EdgeInsets.all(10),
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: RouteAddForm(),
                              ),
                            );
                          },
                        );
                      },

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFF00a896),
                      ),
                      padding: EdgeInsets.only(top: 8,bottom: 5),
                      height: 55,
                      width: 55,
                      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                      child: Icon(Icons.add, size: 30, color: Colors.white,),
                    ),
                  );
  }
}
