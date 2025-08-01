import 'package:freezed_annotation/freezed_annotation.dart';

part 'sorted_map.freezed.dart';

@freezed
abstract class SortedMap<TID, TData> with _$SortedMap<TID, TData> {
  const SortedMap._();

  const factory SortedMap({
    @Default({}) Map<TID, TData> data,
    @Default([]) List<TID> idOrderedList,
  }) = _SortedMap;

  factory SortedMap.fromList({
    required List<TData> list,
    required TID Function(TData) getId,
  }) {
    return SortedMap<TID, TData>(
      data: {for (final item in list) getId(item): item},
      idOrderedList: list.map(getId).toList(),
    );
  }

  SortedMap<TID, TData> copyWithout(TID id) {
    final updatedData = {...data}..remove(id);
    final updatedIds = idOrderedList.where((itemId) => itemId != id).toList();
    return copyWith(
      data: updatedData,
      idOrderedList: updatedIds,
    );
  }

  SortedMap<TID, TData> withElementReplaced({
    required TID id,
    required TData updatedElement,
  }) {
    if (!data.containsKey(id)) return this;
    final updatedData = {...data, id: updatedElement};
    return copyWith(data: updatedData);
  }

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

    final updatedIdList = [...newIds.where((id) => !currentIds.contains(id))];
    final updatedData = {...currentData, ...newData};

    return copyWith(
      data: updatedData,
      idOrderedList: updatedIdList,
    );
  }

  int get length => data.length;

  TData? operator [](int index) {
    final id = idOrderedList[index];
    return data[id];
  }

  TData? getById(TID id) => data[id];

  bool get isEmpty => data.isEmpty;

  bool get isNotEmpty => data.isNotEmpty;
}
