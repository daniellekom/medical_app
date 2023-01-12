import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final iconImagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final String buttonTabText;

  const CategoryCard({
    super.key,
    required this.iconImagePath,
    required this.isSelected,
    required this.onTap,
    required this.buttonTabText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isSelected ? Colors.deepPurple[100] : Colors.white,
              ),
              child: Row(
                children: [
                  Image.asset(
                    iconImagePath,
                    height: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(buttonTabText,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: isSelected? Colors.white : Colors.black),),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
