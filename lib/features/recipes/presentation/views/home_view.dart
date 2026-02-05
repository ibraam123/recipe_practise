import 'package:flutter/material.dart';

import '../widgets/chips_list.dart';
import '../widgets/recipe_card.dart';
import '../widgets/search_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchTextField(),
        const SizedBox(height: 16),
        const ListOfChips(),
        const SizedBox(height: 16),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 16, mainAxisSpacing: 16),
            itemCount: 10,
            itemBuilder: (context, index) => const RecipeCard(),
          ),
        ),
      ],
    );
  }
}







