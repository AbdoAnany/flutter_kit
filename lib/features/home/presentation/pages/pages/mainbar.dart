import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/utils/constants/colors.dart';
import 'package:flutter_kit/utils/constants/sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/theme/widget_themes/text_theme.dart';

class MainBar extends StatefulWidget {
  const MainBar({Key? key}) : super(key: key);

  @override
  _MainBarState createState() => _MainBarState();
}

class _MainBarState extends State<MainBar> {
  bool _isExpanded = false;
  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _isExpanded ? 180 : 60, height: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            // color: AppColor.dark,
            height: TSizes.screenHeight * .1,
            child: Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                  // TODO: Handle navigation to the corresponding page
                },
                child: Text(
                  _isExpanded ? 'TITLE' : "T",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          ),
          SizedBox(
            height: TSizes.sm,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildNavItem(icon: Iconsax.home, index: 0, label: 'Dashboard'),
              _buildNavItem(icon: Iconsax.message, index: 1, label: 'Chat'),
              _buildNavItem(icon: Iconsax.profile_2user, index: 2, label: 'Users'),
              _buildNavItem(icon: Iconsax.chart, index: 3, label: 'Report'),
              _buildNavItem(icon: Iconsax.category, index: 4, label: 'Category'),



            ],
          ),
          Spacer(),
          _buildNavItem(icon: Iconsax.user, index: 18, label: 'Profile'),
          _buildNavItem(icon: Iconsax.setting_2, index: 19, label: 'Setting'),
    SizedBox(height: 20.r,),
          _buildNavItem(icon: Iconsax.logout, index: 20, label: 'Logout'),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      {required IconData icon, required int index, required String label}) {
    return InkWell(
        onTap: () {
          setState(() {
            _isSelected = index;
          });
          // TODO: Handle navigation to the corresponding page
        },
        // onHover: ,
        child: Container(
          color: _isSelected == index
              ? Theme.of(context).splashColor
              : Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.all(TSizes.sm),
          margin: EdgeInsets.zero,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: _isExpanded
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Icon(icon),
              if (_isExpanded)
                SizedBox(
                  width: TSizes.xs,
                ),
              if (_isExpanded) Text(label),
            ],
          ),
        ));
  }
}
