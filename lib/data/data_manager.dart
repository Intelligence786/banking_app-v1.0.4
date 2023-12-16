import 'dart:math';

import 'package:banking_app/data/models/category_model.dart';
import 'package:banking_app/data/models/wallet_model.dart';
import 'package:banking_app/data/shared_preference_service.dart';

import '../core/utils/image_constant.dart';
import 'models/news_model.dart';

class DataManager {
  static WalletModel data = WalletModel(categories: fillIncomegridItemList());

  static Future<void> addOrUpdateWallet(WalletModel inputData) async {
    data = await SharedPreferencesService.getWalletModelFromPrefs() ??
        WalletModel(categories: fillIncomegridItemList());

    // Check if the data is not equal to inputData
    if (data != inputData) {
      // Update existing item
      data = inputData;
      await SharedPreferencesService.saveWalletModelToPrefs(data);
    }
  }

  static Future<void> addOrUpdateIncome(IncomeModel inputData) async {
    // Получаем текущий WalletModel из SharedPreferences
    data = await SharedPreferencesService.getWalletModelFromPrefs() ??
        WalletModel(categories: fillIncomegridItemList());

    // Находим индекс элемента, который нужно обновить
    int index =
        data.categories.indexWhere((element) => element.id == inputData.id);

    if (index != -1) {
      // inputData.incomeHistory.add(history);
      // Обновляем элемент в списке
      data.categories[index] = inputData;

      // Сохраняем обновленный WalletModel в SharedPreferences
      await SharedPreferencesService.saveWalletModelToPrefs(data);
    }
  }

  static Future<WalletModel> getWallet() async {
    data = await SharedPreferencesService.getWalletModelFromPrefs() ??
        WalletModel(categories: fillIncomegridItemList());
    return data;
  }

  static Future<IncomeModel> getIncomeModel(IncomeModel inputData) async {
    // Получаем текущий WalletModel из SharedPreferences
    data = await SharedPreferencesService.getWalletModelFromPrefs() ??
        WalletModel(categories: fillIncomegridItemList());

    // Находим индекс элемента, который нужно обновить
    int index =
        data.categories.indexWhere((element) => element.id == inputData.id);

    return data.categories[index] = inputData;
  }

  static List<IncomeModel> fillIncomegridItemList() {
    return [
      IncomeModel(
        id: 0,
        icon: ImageConstant.imgPersonalIncome,
        name: "Personal income",
        amount: 0,
        incomeHistory: [],
      ),
      IncomeModel(
        id: 1,
        icon: ImageConstant.imgRealEstate,
        name: "Real estate",
        amount: 0,
        incomeHistory: [],
      ),
      IncomeModel(
        id: 2,
        icon: ImageConstant.imgDividends,
        name: "Dividends",
        amount: 0,
        incomeHistory: [],
      ),
      IncomeModel(
        id: 3,
        icon: ImageConstant.imgAssets,
        name: "Assets",
        amount: 0,
        incomeHistory: [],
      ),
      IncomeModel(
        id: 4,
        icon: ImageConstant.imgBusiness,
        name: "Business",
        amount: 0,
        incomeHistory: [],
      ),
      IncomeModel(
        id: 5,
        icon: ImageConstant.imgAdditionalIncome,
        name: "Additional income",
        amount: 0,
        incomeHistory: [],
      ),
    ];
  }

  static List<CategoryModel> categories = [
    CategoryModel(id: 0, name: 'All'),

    CategoryModel(
      id: 4,
      name: 'Finance',
    ),
    CategoryModel(
      id: 1,
      name: 'Investing',
    ),
    CategoryModel(
      id: 2,
      name: 'Economy',
    ),
    CategoryModel(
      id: 3,
      name: 'Cryto',
    )

    // Добавь здесь другие категории по желанию
  ];

  static DateTime getRandomDate() {
    final random = Random();
    final now = DateTime.now();
    final randomDays =
        random.nextInt(30); // Генерация случайного числа от 0 до 29 для дней
    return now.subtract(Duration(days: randomDays));
  }

  static Future<List<NewsModel>> getAllNews() async {
    List<NewsModel> news = [
      NewsModel(
          category: categories[4],
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://friendsoftheearth.eu/wp-content/uploads/2022/01/new-ec-2-1024x1024.jpg",
          title:
              "Экономисты прогнозируют снижение инфляции в США и избежание рецессии",
          body:
              "По результатам опроса большинство бизнес-экономистов считают, что американская экономика сможет избежать рецессии в следующем году, даже если рынок труда ослабеет под давлением высоких процентных ставок"),
      NewsModel(
          category: categories[1],
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://lcdgroup.org/wp-content/uploads/2023/07/us_economy-KL-1024x680-1.png",
          title:
              "ВВП может создавать солнечную картину экономики, но этот показатель говорит о другом",
          body:
              "За последние четыре квартала ВВП вырос на 3%, а GDI упал на 0,16%, согласно анализу данных Министерства торговли Джозефом ЛаВоргной, главным экономистом SMBC Nikko Securities. Это самое большое расхождение между двумя показателями за последнее время."),
      NewsModel(
          category: categories[2],
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://cdn.corporatefinanceinstitute.com/assets/economy-1-1024x402.jpeg",
          title:
              "Американцы не счастливее от экономики Байдена, несмотря на то, что крупные СМИ говорят им, как хорошо у них все",
          body:
              "Несколько СМИ и фигур настаивали на том, что американская экономика сильна и утверждали, что те, кто не признает этого, не получают правильной информации."),
      NewsModel(
          category: categories[1],
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://www.thestatesman.com/wp-content/uploads/2020/08/ECONOMY.jpg",
          title: "Госдолг США достиг рекордного уровня в \$29 трлн",
          body:
              "Госдолг США превысил \$29 трлн впервые в истории, по данным Министерства финансов. Это произошло после того, как Конгресс одобрил пакеты стимулирования экономики на сумму более \$5 трлн в ответ на пандемию коронавируса."),
      NewsModel(
          category: categories[4],
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://comptroller.texas.gov/economy/fiscal-notes/2023/may/images/FNmay2023ScrollLG.jpg",
          title: "Китай снижает ставку по кредитам для поддержки экономики",
          body:
              "Китай снизил ключевую ставку по кредитам впервые за почти два года, чтобы стимулировать заемщиков и поддержать рост экономики, который замедлился до минимума за 10 лет. Ставка по кредитам с однолетним сроком была снижена с 4,35% до 4,25%, а ставка по кредитам с пятилетним сроком - с 4,8% до 4,75%."),
      NewsModel(
          category: categories[4],
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://equitablegrowth.org/wp-content/uploads/2019/10/GDP-2.0-measuring-growth-1080x675.jpg",
          title:
              "Европейский центробанк оставил процентные ставки без изменений, но увеличил программу покупки активов",
          body:
              "Европейский центробанк оставил свою основную процентную ставку на уровне 0%, но увеличил объем своей программы покупки активов с 1,85 трлн евро до 2,2 трлн евро, чтобы смягчить последствия нового всплеска коронавируса для экономики еврозоны. Банк также продлил срок действия программы до конца марта 2025 года."),
      NewsModel(
          category: categories[4],
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://www2.deloitte.com/content/dam/insights/us/articles/4674_IbtN-July-2018/images/4675_IbtN_July-2018_1440x660.jpg/_jcr_content/renditions/cq5dam.web.1440.660.jpeg",
          title:
              "Великобритания вступает в рецессию после сокращения ВВП на 1,5% в третьем квартале",
          body:
              "Великобритания вошла в техническую рецессию после того, как ее ВВП сократился на 1,5% в третьем квартале, по данным Офиса национальной статистики. Это второй квартал подряд, когда экономика страны сокращается, что является определением рецессии. Сокращение было вызвано ограничениями, введенными для борьбы с распространением коронавируса, которые ударили по секторам услуг, производства и строительства."),
      NewsModel(
          category: categories[3],
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://i.investopedia.com/content/video/whats_the_economy/whatstheeconomy.png",
          title:
              "Япония вышла из рецессии после роста ВВП на 5,3% в третьем квартале",
          body:
              "Японская экономика вышла из рецессии после того, как ее ВВП вырос на 5,3% в третьем квартале, по данным Кабинета министров. Это самый быстрый темп роста с 1968 года, когда начался учет данных. Восстановление было поддержано восстановлением потребления, экспорта и капитальных вложений после снятия ограничений, связанных с коронавирусом."),
      NewsModel(
          category: categories[1],
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://www.economist.com/cdn-cgi/image/width=1424,quality=80,format=auto/content-assets/images/20230722_LDD002.jpg",
          title:
              "Россия повышает ключевую ставку до 8,5%, чтобы сдержать инфляцию",
          body:
              "Центральный банк России повысил свою ключевую ставку с 8% до 8,5%, чтобы сдержать рост инфляции, который достиг 8,1% в октябре, самого высокого уровня с 2016 года. Банк также предупредил, что может повысить ставку еще раз в декабре, если инфляционные риски не уменьшатся. Повышение ставки ударит по заемщикам и потребителям, но укрепит рубль."),
      NewsModel(
          category: categories[2],
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://keydifferences.com/wp-content/uploads/2019/08/economics-vs-economy.jpg",
          title:
              "Индия сокращает налог на корпоративную прибыль, чтобы стимулировать экономику",
          body:
              "Правительство Индии снизило налог на корпоративную прибыль с 30% до 22%, чтобы стимулировать экономический рост, который замедлился до 5,7% во втором квартале, самого низкого уровня за шесть лет. Снижение налога также направлено на привлечение иностранных инвесторов и улучшение конкурентоспособности индийских компаний."),
    ];

    return news;
  }

  static Future<List<NewsModel>> getCategoryNews(
      CategoryModel categoryModel) async {
    List<NewsModel> allNews = await getAllNews();

    // Фильтрация новостей по категории
    List<NewsModel> categoryNews =
        allNews.where((news) => news.category == categoryModel).toList();

    return categoryNews;
  }
}
