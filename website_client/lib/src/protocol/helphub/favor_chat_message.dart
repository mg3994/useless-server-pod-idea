/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class FavorChatMessage
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  FavorChatMessage._({
    this.id,
    required this.requestId,
    required this.senderUserId,
    required this.senderEmail,
    required this.message,
    required this.createdAt,
  });

  factory FavorChatMessage({
    int? id,
    required int requestId,
    required int senderUserId,
    required String senderEmail,
    required String message,
    required DateTime createdAt,
  }) = _FavorChatMessageImpl;

  factory FavorChatMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return FavorChatMessage(
      id: jsonSerialization['id'] as int?,
      requestId: jsonSerialization['requestId'] as int,
      senderUserId: jsonSerialization['senderUserId'] as int,
      senderEmail: jsonSerialization['senderEmail'] as String,
      message: jsonSerialization['message'] as String,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int requestId;

  int senderUserId;

  String senderEmail;

  String message;

  DateTime createdAt;

  /// Returns a shallow copy of this [FavorChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  FavorChatMessage copyWith({
    int? id,
    int? requestId,
    int? senderUserId,
    String? senderEmail,
    String? message,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FavorChatMessage',
      if (id != null) 'id': id,
      'requestId': requestId,
      'senderUserId': senderUserId,
      'senderEmail': senderEmail,
      'message': message,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FavorChatMessage',
      if (id != null) 'id': id,
      'requestId': requestId,
      'senderUserId': senderUserId,
      'senderEmail': senderEmail,
      'message': message,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FavorChatMessageImpl extends FavorChatMessage {
  _FavorChatMessageImpl({
    int? id,
    required int requestId,
    required int senderUserId,
    required String senderEmail,
    required String message,
    required DateTime createdAt,
  }) : super._(
         id: id,
         requestId: requestId,
         senderUserId: senderUserId,
         senderEmail: senderEmail,
         message: message,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [FavorChatMessage]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  FavorChatMessage copyWith({
    Object? id = _Undefined,
    int? requestId,
    int? senderUserId,
    String? senderEmail,
    String? message,
    DateTime? createdAt,
  }) {
    return FavorChatMessage(
      id: id is int? ? id : this.id,
      requestId: requestId ?? this.requestId,
      senderUserId: senderUserId ?? this.senderUserId,
      senderEmail: senderEmail ?? this.senderEmail,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
