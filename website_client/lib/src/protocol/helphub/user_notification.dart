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

abstract class UserNotification
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  UserNotification._({
    this.id,
    required this.recipientEmail,
    required this.title,
    required this.message,
    this.requestId,
    required this.isRead,
    required this.createdAt,
  });

  factory UserNotification({
    int? id,
    required String recipientEmail,
    required String title,
    required String message,
    int? requestId,
    required bool isRead,
    required DateTime createdAt,
  }) = _UserNotificationImpl;

  factory UserNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserNotification(
      id: jsonSerialization['id'] as int?,
      recipientEmail: jsonSerialization['recipientEmail'] as String,
      title: jsonSerialization['title'] as String,
      message: jsonSerialization['message'] as String,
      requestId: jsonSerialization['requestId'] as int?,
      isRead: _isc.BoolJsonExtension.fromJson(jsonSerialization['isRead']),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String recipientEmail;

  String title;

  String message;

  int? requestId;

  bool isRead;

  DateTime createdAt;

  /// Returns a shallow copy of this [UserNotification]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  UserNotification copyWith({
    int? id,
    String? recipientEmail,
    String? title,
    String? message,
    int? requestId,
    bool? isRead,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserNotification',
      if (id != null) 'id': id,
      'recipientEmail': recipientEmail,
      'title': title,
      'message': message,
      if (requestId != null) 'requestId': requestId,
      'isRead': isRead,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserNotification',
      if (id != null) 'id': id,
      'recipientEmail': recipientEmail,
      'title': title,
      'message': message,
      if (requestId != null) 'requestId': requestId,
      'isRead': isRead,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserNotificationImpl extends UserNotification {
  _UserNotificationImpl({
    int? id,
    required String recipientEmail,
    required String title,
    required String message,
    int? requestId,
    required bool isRead,
    required DateTime createdAt,
  }) : super._(
         id: id,
         recipientEmail: recipientEmail,
         title: title,
         message: message,
         requestId: requestId,
         isRead: isRead,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UserNotification]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  UserNotification copyWith({
    Object? id = _Undefined,
    String? recipientEmail,
    String? title,
    String? message,
    Object? requestId = _Undefined,
    bool? isRead,
    DateTime? createdAt,
  }) {
    return UserNotification(
      id: id is int? ? id : this.id,
      recipientEmail: recipientEmail ?? this.recipientEmail,
      title: title ?? this.title,
      message: message ?? this.message,
      requestId: requestId is int? ? requestId : this.requestId,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
