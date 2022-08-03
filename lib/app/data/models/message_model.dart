import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class MessageModel {

  const MessageModel({
    required this.messageId,
    required this.idSender,
    this.message,
    this.seen,
    required this.dateTime,
    required this.typeMessage,
  });

  final String messageId;
  final String idSender;
  final String? message;
  final bool? seen;
  final DateTime dateTime;
  final String typeMessage;

  factory MessageModel.fromJson(Map<String,dynamic> json) => MessageModel(
    messageId: json['messageId'].toString(),
    idSender: json['idSender'].toString(),
    message: json['message']?.toString(),
    seen: json['seen'] != null ? json['seen'] as bool : null,
    dateTime: DateTime.parse(json['dateTime'] as String),
    typeMessage: json['typeMessage'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'messageId': messageId,
    'idSender': idSender,
    'message': message,
    'seen': seen,
    'dateTime': dateTime.toIso8601String(),
    'typeMessage': typeMessage
  };

  MessageModel clone() => MessageModel(
    messageId: messageId,
    idSender: idSender,
    message: message,
    seen: seen,
    dateTime: dateTime,
    typeMessage: typeMessage
  );


  MessageModel copyWith({
    String? messageId,
    String? idSender,
    Optional<String?>? message,
    Optional<bool?>? seen,
    DateTime? dateTime,
    String? typeMessage
  }) => MessageModel(
    messageId: messageId ?? this.messageId,
    idSender: idSender ?? this.idSender,
    message: checkOptional(message, () => this.message),
    seen: checkOptional(seen, () => this.seen),
    dateTime: dateTime ?? this.dateTime,
    typeMessage: typeMessage ?? this.typeMessage,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is MessageModel && messageId == other.messageId && idSender == other.idSender && message == other.message && seen == other.seen && dateTime == other.dateTime && typeMessage == other.typeMessage;

  @override
  int get hashCode => messageId.hashCode ^ idSender.hashCode ^ message.hashCode ^ seen.hashCode ^ dateTime.hashCode ^ typeMessage.hashCode;
}
