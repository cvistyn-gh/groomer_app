import 'package:hive/hive.dart';
import 'animal_type.dart';

class AnimalTypeAdapter extends TypeAdapter<AnimalType> {
  @override
  final int typeId = 100; // Уникальный ID для AnimalType

  @override
  AnimalType read(BinaryReader reader) {
    final value = reader.readString();
    return AnimalType.fromString(value);
  }

  @override
  void write(BinaryWriter writer, AnimalType obj) {
    writer.writeString(obj.name);
  }
}
