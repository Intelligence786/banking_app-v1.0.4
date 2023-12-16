import '../../../core/app_export.dart';

/// This class is used in the [newslist_item_widget] screen.
class NewslistItemModel {
  NewslistItemModel({
    this.image,
    this.headerText,
    this.dateText,
    this.contentText,
    this.id,
  }) {
    image = image ?? ImageConstant.imgVector;
    headerText = headerText ??
        "Implementation of new technologies for ensuring the security";
    dateText = dateText ?? "16 may, 2023";
    contentText = contentText ??
        "The implementation of new technologies plays an important role in ensuring the security of financial transactions. ";
    id = id ?? "";
  }

  String? image;

  String? headerText;

  String? dateText;

  String? contentText;

  String? id;
}
