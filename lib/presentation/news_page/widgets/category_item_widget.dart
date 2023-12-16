import 'package:banking_app/core/app_export.dart';
import 'package:banking_app/data/models/category_model.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class CategoryItemWidget extends StatefulWidget {
  CategoryItemWidget(
    this.categoryModel, {
    this.onTap,
    Key? key,  this.isSelected = false,
  }) : super(
          key: key,
        );

  CategoryModel categoryModel;
  Function? onTap;
   bool isSelected ;

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap?.call();
      },
      borderRadius: BorderRadiusStyle.roundedBorder8,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          // width: 51.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 5.v,
          ),
          decoration: widget.isSelected ?  AppDecoration.fillYellowA70001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ): AppDecoration.fillGray100.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8),
          child: Text(
            widget.categoryModel.name!,
            style: CustomTextStyles.bodyLargeBlack900,
          ),
        ),
      ),
    );
  }
}
