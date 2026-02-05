import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('https://fastly.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI' , width: double.infinity, fit: BoxFit.cover ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const Text('Recipe Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CategoryText(category: 'Category'),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, size: 16, color: Colors.black),
                  onPressed: () {
                    print(
                      'Favorite button pressed',
                    );
                  },
                ),
              ),
            ),
          ]
      ),
    );
  }
}


class CategoryText extends StatelessWidget {
  const CategoryText({super.key ,  this.category});
  final String? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child:Text( category ?? ''  , style: TextStyle(fontSize: 12, color: Colors.black , fontWeight: FontWeight.bold)),
    );
  }
}
