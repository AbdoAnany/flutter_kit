import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_kit/utils/theme/widget_themes/text_theme.dart';

import '../../../../../utils/theme/theme.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.fillColor, borderRadius: BorderRadius.circular(12)),
      child: TextField(
        decoration: InputDecoration(isDense: true,
          prefixIcon: Icon(
            Iconsax.search_normal,
            color: Theme.of(context).iconTheme.color,),
          hintText: "Search any recipes",
          hintStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
