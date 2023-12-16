import 'package:equatable/equatable.dart';

class WalletModel {
  List<IncomeModel> categories;

  WalletModel({
    this.categories = const [],
  });

  // Метод для получения общей суммы из всех категорий
  double getTotalAmount() {
    double total = 0.0;
    for (var category in categories) {
      total += category.amount;
    }
    return total;
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories.map((category) => category.toJson()).toList(),
    };
  }

  // Метод для преобразования модели в JSON

  // Фабричный метод для создания модели из JSON
  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
        categories: (json['categories'] as List)
            .map((data) => IncomeModel.fromJson(data))
            .toList());
  }
}

// ignore: must_be_immutable
class IncomeModel implements Equatable {
  final int id;
  final String name;
  final String icon;
  double amount;
  List<IncomeHistory> incomeHistory = [];

  IncomeModel({
    required this.id,
    required this.name,
    required this.icon,
    this.amount = 0.0,
    required this.incomeHistory,
  });

  @override
  List<Object?> get props => [name, icon, amount, incomeHistory];

  @override
  bool get stringify => true;

  @override
  IncomeModel copyWith({
    int? id,
    String? name,
    String? icon,
    double? amount,
    List<IncomeHistory>? incomeHistory,
  }) =>
      IncomeModel(
        name: name ?? this.name,
        icon: icon ?? this.icon,
        amount: amount ?? this.amount,
        incomeHistory: incomeHistory ?? this.incomeHistory,
        id: id ?? this.id,
      );

  // Метод для преобразования категории в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'amount': amount,
      'incomeHistory':
          incomeHistory.map((history) => history.toJson()).toList(),
    };
  }

  // Фабричный метод для создания категории из JSON
  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        amount: json['amount'],
        incomeHistory: (json['incomeHistory'] as List)
            .map((data) => IncomeHistory.fromJson(data))
            .toList());
  }
}

class IncomeHistory {
  final String title;
  final double amount;

  IncomeHistory({this.title = '', required this.amount});

  // Метод для преобразования истории в JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'amount': amount,
    };
  }

  // Фабричный метод для создания истории из JSON
  factory IncomeHistory.fromJson(Map<String, dynamic> json) {
    return IncomeHistory(
      title: json['title'],
      amount: json['amount'],
    );
  }
}
