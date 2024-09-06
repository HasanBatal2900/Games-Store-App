import 'package:flutter/material.dart';

class LangagueSwitcher extends StatefulWidget {
  const LangagueSwitcher({super.key});

  @override
  State<LangagueSwitcher> createState() => _LangagueSwitcherState();
}

class _LangagueSwitcherState extends State<LangagueSwitcher> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Colors.greenAccent.shade100,
        activeTrackColor: Colors.greenAccent.shade400,
        trackOutlineColor:
            MaterialStateColor.resolveWith((states) => Colors.transparent),
        inactiveTrackColor: Colors.grey.shade400,
        value: value,
        onChanged: (currentValue) {
          setState(() {
            value = currentValue;
          });
        });
  }
}
