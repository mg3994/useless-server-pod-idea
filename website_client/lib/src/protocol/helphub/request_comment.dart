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

abstract class RequestComment
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RequestComment._({
    this.id,
    required this.requestId,
    required this.authorUserId,
    required this.authorEmail,
    required this.content,
    required this.createdAt,
  });

  factory RequestComment({
    int? id,
    required int requestId,
    required int authorUserId,
    required String authorEmail,
    required String content,
    required DateTime createdAt,
  }) = _RequestCommentImpl;

  factory RequestComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return RequestComment(
      id: jsonSerialization['id'] as int?,
      requestId: jsonSerialization['requestId'] as int,
      authorUserId: jsonSerialization['authorUserId'] as int,
      authorEmail: jsonSerialization['authorEmail'] as String,
      content: jsonSerialization['content'] as String,
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

  int authorUserId;

  String authorEmail;

  String content;

  DateTime createdAt;

  /// Returns a shallow copy of this [RequestComment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RequestComment copyWith({
    int? id,
    int? requestId,
    int? authorUserId,
    String? authorEmail,
    String? content,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RequestComment',
      if (id != null) 'id': id,
      'requestId': requestId,
      'authorUserId': authorUserId,
      'authorEmail': authorEmail,
      'content': content,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RequestComment',
      if (id != null) 'id': id,
      'requestId': requestId,
      'authorUserId': authorUserId,
      'authorEmail': authorEmail,
      'content': content,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequestCommentImpl extends RequestComment {
  _RequestCommentImpl({
    int? id,
    required int requestId,
    required int authorUserId,
    required String authorEmail,
    required String content,
    required DateTime createdAt,
  }) : super._(
         id: id,
         requestId: requestId,
         authorUserId: authorUserId,
         authorEmail: authorEmail,
         content: content,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RequestComment]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RequestComment copyWith({
    Object? id = _Undefined,
    int? requestId,
    int? authorUserId,
    String? authorEmail,
    String? content,
    DateTime? createdAt,
  }) {
    return RequestComment(
      id: id is int? ? id : this.id,
      requestId: requestId ?? this.requestId,
      authorUserId: authorUserId ?? this.authorUserId,
      authorEmail: authorEmail ?? this.authorEmail,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
