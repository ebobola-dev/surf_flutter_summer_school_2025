/// Типы мест.
enum PlaceTypeEntity {
  /// Другое.
  other('Другое'),

  /// Парк.
  park('Парк'),

  /// Памятник.
  monument('Памятник'),

  /// Театр.
  theatre('Театр'),

  /// Музей.
  museum('Музей'),

  /// Храм.
  temple('Храм'),

  /// Отель.
  hotel('Отель'),

  /// Ресторан.
  restaurant('Ресторан'),

  /// Кафе.
  cafe('Кафе'),

  /// Магазин.
  shopping('Магазин');

  final String ruName;
  const PlaceTypeEntity(this.ruName);
}
