# Проект задание летней школы 2025 от [Surf](https://surf.ru/)

## Задание - сделать приложение "Путеводитель" на Flutter используя предоставленный Api и Figma Макет

### Api предоставляет нам места, которые содержат

- id
- name - название места
- description - описание места
- lat & lon - координаты места
- urls - список из изображений (список из ссылой)
- placeType - тип места (один из 'парк', 'ресторан', 'музей', ... и так далее)

### Экраны, которые нужно было реализовать

- Сплеш экран с анимацией
  - Показываем 2 секунды и, если первый запуск, кидаем на туториал, иначе на главный экран

- Экран с туториалом (онбоардинг, описание приложения)
  - 3 слайда на макете
  - Сохранение факта прохождения

Главный экран представляет собой 4 экрана с навигацией между ними через бар снизу
- Экран со списоком мест, включая поиск
  - Список мест, который подгружается с api, должен кешироваться
  - На карточках мест кнопка лайка/дизлайка (добавление в избранные)
  - При тапе на карточку места открывается экран с детальной информацией о месте
  - Фильтры по типам мест и расстоянию до них
  - Поиск
    - Места по запросу подгружаются с апи с пагиницией
	- Фильтрация результатов (так же как описано выше)
	- Сохранение и показ истории поиска с возможностью удаления одного query или всей истории

- Экран с картой
  - Метки мест по фильтрам, просмотр мест на карте
  - Метка пользователя, его текущая геопозиция

- Экран избранных мест
  - Список мест, которые мы добавили в избранное
  - Возможность удалять места из избранных
  - При тапе на карточку места открывается экран с детальной информацией о месте

- Экран настроек
  - Смена темы между тёмной и светлой
  - Кнопка(кейс/опция) повторного прохождения туториала

- Экран детального описания места
  - Подробное описание места
  - По тапу на фото открывается карусель, на которой можно посмотреть все фотографии места
  - Кнопка поделится
  - Кнопка лайка/дизлайка (добавление и удаление из избранного)

- Экран карусели из фотографии
  - Ну тут мне нечего добавить

- Экран фильтров
  - Фильтры состоят из
    - Список типов мест (какие из типов показывать)
	- Диапазон расстония от пользователя до места (на каком расстоянии от пользователя показывать места)

### Логика, которую нужно было реализовать

- Возможность оффлайн просмотра на экране списка мест и на экране детального описания места, то есть кеширование, при получении списка мест, и при получении одного места
  - То есть нужно иметь базу данных кеша, из которой мы будем брать места до получения результата от ремоута или при отсутствии этого результата
- Избранные места - их нужно тоже сохранять, не знаю подразумевался кеш или персистент, но хотя бы сам факт(а не целые данные места) избранного должен хранится персистентно, то есть не удаляться, когда пользователь отчищает кеш приложения
- Выбранный мод темы (светлый или темный) также должен сохранятся при выходе из приложения
- Факт прохождения туториала также сохраняется, мы должны попадать на экран туториала только при первом запуске приложения (ну и если не прошли разумеется)

### Как я расставил приоритеты по задачам (экранам грубо говоря)

Увидев карту на макете я сразу понял, что до неё скорее всего дело не дойдёт xD

##### Приоритет был такой

Сначала самое очевидно нужное, база так сказать
- Экран мест
  - Получение списка мест от ремоута
  - Их вывод с карточками
    - На карточке кнопка лайка/дизлайка
  - Вся бизнес логика для выше перечисленного
    - Включая базу данных для избранных
- Экран избранных мест
  - Просто вывод карточек - избранных мест, которые загружаются из базы данных
  - Удаление места из избранных
    - Особое внимание уделяем тому, как выглядит процесс удаления на ui в макете (like slidable)
- Экран фильтров
  - Выглядит как отдельный экран, значит мы должны дать ему текущие фильтры и получить из него изменения (как я это понял)

Далее идёт то, что реализовать легко (для чего практически не нужен бизнес, или он очень лёгкий, также ui логика лёгкая)

- Экран настроек
  - Смена темы и её кнопочка
  - Кнопочка повторного прохождения туториала

- Сплеш скрин
  - Какая-нибудь базовая анимация
  - По истечении 2 секунд, кидаем либо на туториал, либо на основной экран

- Туториал (onboarding) скрин
  - Ну просто page view с картиночками из макета

- Экран деталального описания места
  - Так-то его нельзя назвать чем-то овер-лёгким, как другие скрины в этой категории, ну просто именно в этот момент до него руки дошли
  - Просто показываем все поля места как на макете, включая полезную кнопку "Поделится"
  - При тапе на фото открывается экран карусели из фото

- Экран карусели из фото
  - Показываем все фото места

И на последнюю очередь я оставил то, что реализовать мне сложнее всего

- Кеш, а конкретнее его база данных, а конкретно в нашем случае только для мест
  - Сложность для меня заключалась в логике отображения кеша, а не просто в базе данных, об этом тут*

- Поиск
  - Пагинацию и фильтры
  - База данных истории запросов
    - Пагинация как и база данных не проблема
    - Проблема для меня то, что я не очень понял по макету как это должно выглядеть, то есть поиск прямо на странице со списоком, то есть он должен заменять список, + непонятно как интегрировать фильтры, когда фильтры у нас локально а поиск удаленный да ещё и с пагинацией

- Карта и всё, что связано с пользовательской локацией
  - Никогда не работал с картами, сразу понял что это будет проблема, проблема именно по времени

### Что из этого я реализовал

Ну тут легче сказать, что я не реализовал, я реализовал всё, кроме:

- Фильтрация результатов поиска (у обычныго списка мест фильтры работают)
- Карта, экран с картой, и всё что связанно с локацией, то есть у фильтров есть диапазон дистанции, но его логики нет (фильтры по типу мест работают)

### Как я это реализовал

#### Начнём с базы(core) приложения

Для mvvm экранчиков я использую [elementary](https://pub.dev/packages/elementary)
База экранчиков обычно такая
- Model
  - хранит данные в ValueNotifier
  - держит StreamController<String> и кидает в него текста ошибок, которые нужно дать ui

- ViewModel
  - Она может просто напрямую отдавать в ui ValueListenable, либо может обрабатывать их и передавать измененые в ui

- Widget
  - Просто всё на ValueListenableBuilder

Многое для базы, основы приложения, я брал из [surf-flutter-app-template](https://github.com/surfstudio/surf-flutter-app-template), так же часто смотрел туда, чтобы постараться выстроить правильную архитектуру приложения и структуру папок (но не вышло к сожалению), что именно я оттуда взял:
  - Реализация схем цветов и текстовых стилей (uikit)
  - theme_wm_mixin - миксин для геттеров тем для elementary wm
  - DisposableObject и DiScope - для внедрения зависимостей
  - Ещё оказывается я взял conditional wrapper, но он нигде не используется (ЫЫ да он может только копировать, сам ниче не может, даже не видит че копирует)
  - логгер на основе surf_logger package
  - Конвертер
  - BaseModel - базовый класс для ElementaryModel который логгирует ошибку при запросе, но на лекциях мы засунули эту логику в репозиторий, поэтому я больше не пользовался BaseModel
  - RequestOperation
  - Тема, theme storage и theme widget, да я конечно просто скопировал, ну там база
Также делал навигацию и иницилизацию проекта(создание appScope) опираясь на этот пример

Что я добавил в базу от себя:
- Экстеншены
  - Для StreamController, safeAdd - пикаем стрим контроллер, только если он ещё не закрыт
  ```dart
  extension SafeAdd<T> on StreamController<T> {
	  void safeAdd(T event) {
      if (!isClosed) {
        add(event);
      }
    }
  }
  ```
  - Для ValueNotifier, emit - сравнивает прежде чем пикнуть новое значение, умеет сравнивать List, Set и Map
  ```dart
  extension EmitExtension<T> on ValueNotifier<T> {
    void emit(T newValue) {
      final current = value;
      if (_areEqual(current, newValue)) return;
      value = newValue;
    }

    bool _areEqual(Object? a, Object? b) {
      if (a is List && b is List) {
        return listEquals(a, b);
      } else if (a is Set && b is Set) {
        return setEquals(a, b);
      } else if (a is Map && b is Map) {
        return mapEquals(a, b);
      } else {
        return a == b;
      }
    }
  }
  ```

- SmartValueNotifierBuilder - как ValueNotifier, но включая волшебный buildWhen как у блока, к сожалению не использовал его везде где нужно
Чуть тупее, без child(который не перерисовывается), но на всю красоту времени не хватило

```dart
typedef BuildWhen<T> = bool Function(T previous, T current);

class SmartValueListenableBuilder<T> extends StatefulWidget {
  final ValueListenable<T> listenable;
  final Widget Function(BuildContext, T) builder;
  final BuildWhen<T>? buildWhen;

  const SmartValueListenableBuilder({
    required this.listenable,
    required this.builder,
    super.key,
    this.buildWhen,
  });

  @override
  State<SmartValueListenableBuilder<T>> createState() => _SmartValueListenableBuilderState<T>();
}

class _SmartValueListenableBuilderState<T> extends State<SmartValueListenableBuilder<T>> {
  late T _latestValue;

  @override
  void initState() {
    super.initState();
    _latestValue = widget.listenable.value;
    widget.listenable.addListener(_listener);
  }

  @override
  void didUpdateWidget(covariant SmartValueListenableBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.listenable != oldWidget.listenable) {
      oldWidget.listenable.removeListener(_listener);
      _latestValue = widget.listenable.value;
      widget.listenable.addListener(_listener);
    }
  }

  void _listener() {
    final next = widget.listenable.value;
    final shouldBuild = widget.buildWhen?.call(_latestValue, next) ?? true;
    if (shouldBuild) {
      setState(() => _latestValue = next);
    } else {
      _latestValue = next;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _latestValue);
  }

  @override
  void dispose() {
    widget.listenable.removeListener(_listener);
    super.dispose();
  }
}
```

- SortedMap
  - Её назначение
    - Нужно хранить упорядоченный список из Entity, которые содержат id
	- Map быстрее List
	- SortedMap хранит данные в Map, предоставляя нужные методы для работы с данными

  - Вообще я часто использую эту приблуду в своих пет-проектах, но в основном юзаю на списках с пагинацией, но решил и сюда завезти, и использовать практически везде вместо List
  - Её суть в том, что работать с мапой, как таковой(обычной Map), удобнее чем с List, вернее быстрее, легче получить элемент, легче проверить существует ли он, легче удалить, все подобные операции это O(1) в мапе(ну скорее всего), а в списке чаще всего O(n)
  - Так конвертируем List в Map + создаём idOrderedList и методы для удобного управления данными и получением их, и получаем вроде бы удобный класс для работы с данными

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sorted_map.freezed.dart';

/// Удобный класс (по моему мнению) для работы со списком моделей, которые содержат id и важно хранить их порядок
///
/// TID - тип id модели
///
/// TData - тип модели (класс)
@freezed
abstract class SortedMap<TID, TData> with _$SortedMap<TID, TData> {
  const SortedMap._();

  const factory SortedMap({
    /// Данные в виде мапы, где ключ это id, значение это модель
    @Default({}) Map<TID, TData> data,

    /// Список из id в нужном порядке
    @Default([]) List<TID> idOrderedList,
  }) = _SortedMap;

  /// Сама сделает мапу и упорядоченный список id из исходного List
  ///
  /// Порядок будет такой же как в исходном List
  factory SortedMap.fromList({
    required List<TData> list,
    required TID Function(TData) getId,
  }) {
    return SortedMap<TID, TData>(
      data: {for (final item in list) getId(item): item},
      idOrderedList: list.map(getId).toList(),
    );
  }

  /// Скопировать данные, исключая элемент с указанным id
  SortedMap<TID, TData> copyWithout(TID id) {
    final updatedData = {...data}..remove(id);
    final updatedIds = idOrderedList.where((itemId) => itemId != id).toList();
    return copyWith(
      data: updatedData,
      idOrderedList: updatedIds,
    );
  }

  /// Скопировать данные, исключая элементы с указанными ids
  SortedMap<TID, TData> copyWithoutMany(Set<TID> ids) {
    final updatedData = {...data}..removeWhere((id, item) => ids.contains(id));
    final updatedIds = idOrderedList.where((itemId) => !ids.contains(itemId)).toList();
    return copyWith(
      data: updatedData,
      idOrderedList: updatedIds,
    );
  }

  /// Скопировать данные, изменив элемент по id
  SortedMap<TID, TData> withElementReplaced({
    required TID id,
    required TData updatedElement,
  }) {
    if (!data.containsKey(id)) return this;
    final updatedData = {...data, id: updatedElement};
    return copyWith(data: updatedData);
  }

  /// Скопировать данные, добавим новые элементы из списка
  ///
  /// Новые данные будут добавлены в конец
  SortedMap<TID, TData> copyWithAdditionalData({
    required List<TData> additionalData,
    required TID Function(TData) getId,
  }) {
    final currentData = data;
    final currentIds = idOrderedList;

    final newData = <TID, TData>{
      for (final item in additionalData) getId(item): item,
    };
    final newIds = additionalData.map(getId).toList();

    final updatedIdList = [...currentIds, ...newIds.where((id) => !currentIds.contains(id))];
    final updatedData = {...currentData, ...newData};

    return copyWith(
      data: updatedData,
      idOrderedList: updatedIdList,
    );
  }

  /// Получить исходный список
  List<TData> get list {
    return List<TData>.generate(length, (index) => getByIndex(index)!);
  }

  /// Длина списка (мапы, данных)
  int get length => data.length;

  /// Получить элемент по id
  TData? operator [](TID id) => data[id];

  /// Получить элемент по индексу
  TData? getByIndex(int index) {
    final id = idOrderedList[index];
    return data[id];
  }

  /// Данных нет
  bool get isEmpty => data.isEmpty;

  /// Данные есть, список не пустой
  bool get isNotEmpty => data.isNotEmpty;
}

```
#
C базой приложения закончили, идём дальше
#### Базы данных

- Для хранения темы и firstRun флага использовал SharedPrefernces, ну тут всё очевидно я думаю

А вот с моделями всё интереснее, мы решили использовать дрифт, ну выбор не велик особо, разумеется мы не можем использовать что-то вроде shared preferences, hive и тому подобное, так как они открываются при старте приложения и целиком загружаются в оперативную память, то есть такие бд подходят только для небольших и ограниченных по количеству данных

У меня была изначально такая задумка: должно быть две независимые друг от друга базы данных (drift) - одна для кеша, другая для персистентных данных

Потому что, например, кешированные данные очевидно должны отчищаться, когда пользователь чистит кеш приложения, а вот, например, избранные места, должны сохранятся вне зависимости от кеша (ну не то что должны, должны это я так решил) и сохранятся целиком, какой смысл хранить только id места

С sql у меня нет проблем, много работал с бд, но на мобилках, а вернее на flutter, первый раз с drift и с sql в целом взаимодействую, мне немного помогал ChatGPT

Создаём таблицы
PlaceType решил вынести в отдельную таблицу, и в Place ссылаться на него
У PlaceType будет только одно поле - name (string) - оно и будет его primary key, так как PlaceType это enum(то есть name уникален), возможно это избыточно... ну да я только сейчас понял, Place таблица хранит первичный ключ - name - это и есть PlaceType, ну да ладно, предполагаем что у PlaceType появятся ещё какие нибудь метаданные, тогда уже отдельная таблица не бесполезна

Сами таблицы для Place и PlaceType:
```dart
@DataClassName('PlaceTypeScheme')
class PlaceTypesTable extends Table {
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {name};
}
```

```dart
@DataClassName('PlaceScheme')
class PlacesTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();
  TextColumn get description => text()();

  TextColumn get imageUrls => text()();

  RealColumn get lat => real()();
  RealColumn get lon => real()();

  TextColumn get placeTypeName => text().references(PlaceTypesTable, #name)();

  @override
  Set<Column> get primaryKey => {id};
}
```

Эти таблицы нужны и в бд кеша и в персистентой бд, у меня была идея использовать одни и те же таблицы в двух бд (кешируем места и персистентно сохраняем избранные)
Но я быстро понял что так делать нельзя, так как дрифт генерит там запросы туда сюда и нельзя открывать несколько бд с одинаковыми классами таблиц туда сюда (это мне чатгпт пояснил), поэтому пришлось продублировать эти таблицы для кеша
#
#
Хранение избранных
#
Я решил также добавить likedAt поле к FavoritePlaceEntity - поле, которое указывает на время лайка, которое я разумеется нигде не буду использовать

Таблица для избранных мест и её View:
```dart
@DataClassName('FavoritePlaceScheme')
class FavoritePlacesTable extends Table {
  IntColumn get placeId => integer().references(
    PlacesTable,
    #id,
    onDelete: KeyAction.cascade,
  )();

  DateTimeColumn get likedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {placeId};
}

abstract class FavoritePlacesView extends View {
  PlaceTypesTable get placeTypesTable;
  PlacesTable get placesTable;
  FavoritePlacesTable get favoritePlacesTable;

  @override
  Query<HasResultSet, dynamic> as() =>
      select([
        favoritePlacesTable.placeId,
        favoritePlacesTable.likedAt,
        placesTable.id,
        placesTable.name,
        placesTable.description,
        placesTable.imageUrls,
        placesTable.lat,
        placesTable.lon,
        placesTable.placeTypeName,
      ]).from(favoritePlacesTable).join([
        innerJoin(placesTable, placesTable.id.equalsExp(favoritePlacesTable.placeId)),
      ]);
}
```

View для объединения (join'а), чтобы мы могли получить целый FavoritePlaceEntity
#
Таким образом, благодаря копированию таблиц для кеша и для персистента, и тому что у нас помимо Scheme есть View у favorite, мы получаем 54 миллиона конвертеров для одной сущности - Place :confused:, грустно, но всё работает

Как работает бд избранных:
- Добавление (на вход даём целый Place)
  - создаётся запись place в PlaceTable
  - создаётся запись favoritePlace в FavoritePlaceTable, которая ссылается на только что созданный place
- Удаление (на вход даём place_id)
  - удаляется запись place из PlaceTable
  - автоматом(каскадом) удаляется и favoritePlace запись, так как ссылалась на place
  ```dart
  class FavoritePlacesTable extends Table {
    IntColumn get placeId => integer().references(
      PlacesTable,
      #id,
      onDelete: KeyAction.cascade,
    )();
  // ...
  }
  ```
#
#
Хранение истории поиска

Ну тут база
Также добавил requestedAt, которым никогда не воспользуюсь

Таблица для query
```dart
@DataClassName('SearchedItemScheme')
class SearchedItemsTable extends Table {
  TextColumn get query => text()();

  DateTimeColumn get requestedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {query};
}
```

У бд есть методы
- создать или обновить
  - это один метод, на вход просто кидаем query, запись создаться, если существует то просто обновится requestedAt
- удалить по query
- удалить все записи

#
#### Переходим к экранчикам и их логике

##### Splash Screen

Базовая анимация - медленно увеличивает туда обратно, через 2 секунды кидает на онбоардинг, либо на tabs (основной) (отчищая весь стек навигации при этой)

<img src="/docs/splash_screen.gif" alt="splash_screen" width="200"/>

#
##### Onboarding Screen

Всё как в макете - через PageView, индикатор вручную написал, немного от себя анимаций накинул
По завершению прохождения проверяет, один ли он в стеке навигации, если один (то есть пришли из SplashScreen), то пушит на главный экран, если он не один, значит его принудительно открыли(например через экран настроек), тогда просто делаем pop() назад

<img src="/docs/onboarding_screen.jpg" alt="onboarding_screen" width="200"/>

#
##### Tabs Screen

Главный экран, снизу кастомный нав бар, так как со встроенным у меня были проблемы со стилизацией
Внутри просто IndexedStack из **PlacesScreen**, **MapScreen**, **FavoritePlacesScreen**, **SettingsScreen**

#
##### Places Screen

#
Показ всех мест
<img src="/docs/places_screen_1.gif" alt="places_screen_1" width="200"/>

Чтобы показывался поиск вместо всех мест, нужно нажать на текстовое поле(сделать его активным), тогда покажется поиск, чтобы закрыть поиск, нужно нажать на крестик на текстовом поле

#
Поиск
<img src="/docs/search_history_empty.jpg" alt="search_history_empty" width="200"/> <img src="/docs/search_history.jpg" alt="search_history" width="200"/> <img src="/docs/search_found.jpg" alt="search_found" width="200"/>

#
##### Map Screen
Не реализовал(

#
##### Favorite Places Screen

<img src="/docs/favorite_screen.jpg" alt="favorite_screen" width="200"/>

#
##### Settings Screen

<img src="/docs/settings_screen.jpg" alt="settings_screen" width="200"/>

#
##### Filters Screen

<img src="/docs/filters_screen.jpg" alt="filters_screen" width="200"/>

#
##### Place Detail Screen

<img src="/docs/detail.jpg" alt="detail" width="200"/>

#
##### Image Carousel Screen

<img src="/docs/carousel.jpg" alt="carousel" width="200"/>

На вход получаем список из строк - ссылок на изображения
Ну и просто через PageView их показываем

#### Дальше ...
Я бы ещё много чего хотел сказать но, время заканчивается

### На чём я отлаживал

Отлаживал я на физическом Xiaomi Redmi Note 8 Pro, ни на чем больше не тестировал
