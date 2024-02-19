import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl, categoryName;

  const CategoryCard(
      {super.key, required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  height: 60,
                  fit: BoxFit.cover)),
          Container(
            alignment: Alignment.center,
            width: 120,
            //height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black45,
            ),
            child: Text(
              categoryName.tr(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
