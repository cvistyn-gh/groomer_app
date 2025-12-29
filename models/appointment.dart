import 'package:hive/hive.dart';

part 'appointment.g.dart';

@HiveType(typeId: 7)
class Appointment extends HiveObject {
  @HiveField(0)
  int id;
  
  @HiveField(1)
  int groomerId; // ID мастера
  
  @HiveField(2)
  int clientId; // ID клиента
  
  @HiveField(3)
  int serviceId; // ID услуги
  
  @HiveField(4)
  int petId; // ID питомца
  
  @HiveField(5)
  int salonId; // ID салона
  
  @HiveField(6)
  DateTime dateTime; // Дата и время записи
  
  @HiveField(7)
  double price; // Стоимость
  
  @HiveField(8)
  int duration; // Длительность в минутах
  
  @HiveField(9)
  String comment; // Комментарий
  
  @HiveField(10)
  bool isRental; // Аренда
  
  @HiveField(11)
  bool isAtHome; // На дому
  
  @HiveField(12)
  bool hasAssistant; // Ассистент
  
  @HiveField(13)
  bool isPaid; // Оплата
  
  @HiveField(14)
  DateTime createdAt;

  Appointment({
    required this.id,
    required this.groomerId,
    required this.clientId,
    required this.serviceId,
    required this.petId,
    required this.salonId,
    required this.dateTime,
    required this.price,
    required this.duration,
    this.comment = '',
    this.isRental = false,
    this.isAtHome = false,
    this.hasAssistant = false,
    this.isPaid = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Геттер для форматированного времени
  String get formattedTime {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  // Геттер для форматированной даты
  String get formattedDate {
    return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}';
  }

  // Геттер для полной даты и времени
  String get formattedDateTime {
    return '$formattedDate $formattedTime';
  }

  // Геттер для форматированной длительности
  String get formattedDuration {
    if (duration < 60) {
      return '$duration мин';
    } else {
      final hours = duration ~/ 60;
      final minutes = duration % 60;
      if (minutes == 0) {
        return '$hours ч';
      } else {
        return '$hours ч $minutes мин';
      }
    }
  }

  // Метод для копирования объекта
  Appointment copyWith({
    int? id,
    int? groomerId,
    int? clientId,
    int? serviceId,
    int? petId,
    int? salonId,
    DateTime? dateTime,
    double? price,
    int? duration,
    String? comment,
    bool? isRental,
    bool? isAtHome,
    bool? hasAssistant,
    bool? isPaid,
    DateTime? createdAt,
  }) {
    return Appointment(
      id: id ?? this.id,
      groomerId: groomerId ?? this.groomerId,
      clientId: clientId ?? this.clientId,
      serviceId: serviceId ?? this.serviceId,
      petId: petId ?? this.petId,
      salonId: salonId ?? this.salonId,
      dateTime: dateTime ?? this.dateTime,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      comment: comment ?? this.comment,
      isRental: isRental ?? this.isRental,
      isAtHome: isAtHome ?? this.isAtHome,
      hasAssistant: hasAssistant ?? this.hasAssistant,
      isPaid: isPaid ?? this.isPaid,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'Запись #$id на $formattedDateTime';
  }
}
