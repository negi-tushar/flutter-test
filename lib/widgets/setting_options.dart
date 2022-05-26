import 'package:flutter/material.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({
    Key? key,
    required this.text,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String text;
  final bool value;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
            Switch.adaptive(value: value, onChanged: onChanged)
          ],
        ),
      ),
    );
  }
}
