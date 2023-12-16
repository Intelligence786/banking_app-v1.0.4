import 'category_model.dart';

class NewsModel {
  final String? imgUrl;
  final String? title;
  final String? body;
  final DateTime? date;
  final CategoryModel? category;

  NewsModel({
     this.imgUrl,
     this.title,
     this.body,
     this.date,
    this.category,
  });
}
