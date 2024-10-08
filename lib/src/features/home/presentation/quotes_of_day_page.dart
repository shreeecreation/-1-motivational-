import 'package:flutter/material.dart';
import 'package:motivational/src/core/widgets/scaffold_wrapper.dart';

class QuotesOfDayPage extends StatelessWidget {
  const QuotesOfDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: const Text('Quotes of the Day'),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
