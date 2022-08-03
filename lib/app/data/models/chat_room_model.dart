import 'package:quiver/core.dart';

import 'index.dart';

class ChatRoomModel {
  final String? chatroomid;
  final Map<String, dynamic>? participants;
  final String? lastMessage;
  final String idSender;
  final String nameSender;
  final bool? seen;
  final DateTime dateTime;

  ChatRoomModel({
    this.chatroomid,
    this.participants,
    this.lastMessage,
    required this.dateTime,
    required this.idSender,
    required this.nameSender,
    this.seen,
  });

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) => ChatRoomModel(
      chatroomid: json['chatroomid'].toString(),
      participants: json['participants'],
      lastMessage: json['lastMessage']?.toString(),
      idSender: json['idSender'].toString(),
      nameSender: json['nameSender'].toString(),
      seen: json['seen'] != null ? json['seen'] as bool : null,
      dateTime: DateTime.parse(json['dateTime'] as String));

  Map<String, dynamic> toJson() => {
        'chatroomid': chatroomid,
        'participants': participants,
        'lastMessage': lastMessage,
        'nameSender': nameSender,
        'idSender': idSender,
        'seen': seen,
        'dateTime': dateTime.toIso8601String()
      };
  ChatRoomModel clone() => ChatRoomModel(
        chatroomid: chatroomid,
        participants: participants,
        lastMessage: lastMessage,
        idSender: idSender,
        nameSender: nameSender,
        seen: seen,
        dateTime: dateTime,
      );

  ChatRoomModel copyWith({
    final String? chatroomid,
    final Map<String, dynamic>? participants,
    Optional<String?>? lastMessage,
    final String? idSender,
    final String? nameSender,
    Optional<bool?>? seen,
    final DateTime? dateTime,
  }) =>
      ChatRoomModel(
        chatroomid: chatroomid ?? this.chatroomid,
        idSender: idSender ?? this.idSender,
        nameSender: nameSender ?? this.nameSender,
        participants: participants ?? this.participants,
        seen: checkOptional(seen, () => this.seen),
        dateTime: dateTime ?? this.dateTime,
        lastMessage: checkOptional(lastMessage, () => this.lastMessage),
      );
}
