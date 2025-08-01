/// Типы мест.
enum PlaceTypeEntity {
  /// Другое.
  other('другое'),

  /// Парк.
  park('парк'),

  /// Памятник.
  monument('памятник'),

  /// Театр.
  theatre('театр'),

  /// Музей.
  museum('музей'),

  /// Храм.
  temple('храм'),

  /// Отель.
  hotel('отель'),

  /// Ресторан.
  restaurant('ресторан'),

  /// Кафе.
  cafe('кафе'),

  /// Магазин.
  shopping('магазин');

  final String ruName;
  const PlaceTypeEntity(this.ruName);
}
