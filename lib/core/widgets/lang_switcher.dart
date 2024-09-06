import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_store/l10n/lang_cubit/lang_cubit.dart';

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
            BlocProvider.of<LangagueCubit>(context).changeLang();
          });
        });
  }
}
