import 'package:flutter/material.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({super.key});

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Image.asset('./assets/logowithbranding.png'),
              );
  }
}