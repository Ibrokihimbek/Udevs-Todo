import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tiki Mobile App Project',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
