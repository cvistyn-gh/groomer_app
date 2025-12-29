enum AnimalType {
  cat('Кошка', '🐈'),
  dog('Собака', '🐕'),
  both('Для всех', '🐾');

  final String label;
  final String emoji;

  const AnimalType(this.label, this.emoji);

  static AnimalType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'cat':
        return AnimalType.cat;
      case 'dog':
        return AnimalType.dog;
      case 'both':
        return AnimalType.both;
      default:
        return AnimalType.both;
    }
  }
}
