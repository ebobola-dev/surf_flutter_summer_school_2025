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
