import 'package:flutter/material.dart';
import 'package:mindwatch/utils/app_colors.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    Key key,
    this.descriptionText,
    this.descriptionStyle,
    this.textAlign,
    this.padding,
    this.tailing,
  }) : super(key: key);

  final String descriptionText;
  final TextStyle descriptionStyle;
  final TextAlign textAlign;
  final EdgeInsets padding;
  final Widget tailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 2,
      child: Container(
        margin: padding ??
            const EdgeInsets.only(
              left: 8,
            ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0) ??
              const BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
              ),
          color: AppColors.appWhite ?? Theme.of(context).dividerColor,
          // image: const DecorationImage(
          //   image: AssetImage(AppAssets.background),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                descriptionText,
                style: (descriptionStyle ?? const TextStyle()),
                textAlign: textAlign ?? TextAlign.left,
              ),
            ),
            if (tailing != null) tailing,
          ],
        ),
      ),
    );
  }
}
