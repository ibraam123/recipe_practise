import 'package:flutter/material.dart';

import '../widgets/chips_list.dart';
import '../widgets/search_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchTextField(),
        SizedBox(height: 16),
        ListOfChips()
      ],
    );
  }
}




