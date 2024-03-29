

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kit/features/home/presentation/widgets/Mainbar.dart';
import 'package:flutter_kit/utils/constants/sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_kit/features/home/presentation/pages/pages/home_appbar.dart';
import 'package:flutter_kit/features/home/presentation/pages/pages/email_field.dart';
import 'package:flutter_kit/features/home/presentation/pages/pages/home_search_bar.dart';
import 'package:flutter_kit/features/home/presentation/pages/pages/lsit_widget.dart';
import 'package:flutter_kit/features/home/presentation/pages/pages/password_field.dart';



import '../../../../../utils/theme/widget_themes/switch_theme.dart';
import '../../../../../utils/theme/widget_themes/text_theme.dart';
import '../../widgets/InfoCard.dart';
import 'home_appbar.dart';

class DashBordPage extends StatelessWidget {
  const DashBordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
    SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(8.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.r,),
              const HomeAppbar(),
              SizedBox(height: 20.r,),
              //   Divider(height:2.r,thickness: 2.r,color: Theme.of(context).splashColor,),

              SizedBox(height: 20.r,),
              const HomeSearchBar(),
              SizedBox(height: 20.r,),
              const EmailField(),
              SizedBox(height: 20.r,),
              const PasswordField(),
              SizedBox(height: 20.r,),
              const WidgetList(),
              const   MySwitchTheme(),
              SizedBox(height: 20.r,),
              InfoCard(
                title: 'Total Registry',
                value: '99',
                bezierCOlor: Colors.orange,
                onTap: (){},
                topColor: Colors.deepOrangeAccent,
              ),

              SizedBox(height: 20.r,),
              Text('Display Large    ${TTextTheme.displayLarge?.fontSize?.w.toStringAsFixed(1)}',style: TTextTheme.displayLarge),
              SizedBox(height: 10.r,),
              Text('Display Medium   ${ TTextTheme.displayMedium?.fontSize?.w.toStringAsFixed(1)}',style: TTextTheme.displayMedium),
              SizedBox(height: 10.r,),
              Text('Display Small    ${Theme.of(context).textTheme.displaySmall?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.displaySmall),

              SizedBox(height: 20.r,),
              Text('Headline Large   ${Theme.of(context).textTheme.headlineLarge?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.headlineLarge),
              Text('Headline Medium  ${Theme.of(context).textTheme.headlineMedium?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.headlineMedium),
              Text('Headline Small    ${Theme.of(context).textTheme.headlineSmall?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.headlineSmall),

              SizedBox(height: 20.r,),
              Text('Title Large   ${Theme.of(context).textTheme.titleLarge?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.titleLarge),
              Text('Title Medium  ${Theme.of(context).textTheme.titleMedium?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.titleMedium),
              Text('Title Small   ${Theme.of(context).textTheme.titleSmall?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.titleSmall),

              SizedBox(height: 20.r,),
              Text('Body Large   ${Theme.of(context).textTheme.bodyLarge?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.bodyLarge),
              Text('Body Medium  ${Theme.of(context).textTheme.bodyMedium?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.bodyMedium),
              Text('Body Small   ${Theme.of(context).textTheme.bodySmall?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 20.r,),

              Text('Label Large   ${Theme.of(context).textTheme.labelLarge?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.labelLarge),
              Text('Label Medium   ${Theme.of(context).textTheme.labelMedium?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.labelMedium),
              Text('Label Small   ${Theme.of(context).textTheme.labelSmall?.fontSize?.w.toStringAsFixed(1)}',style: Theme.of(context).textTheme.labelSmall),

            ],
          ),
        ),
      )
    ;
  }
}
