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

abstract class RequestRating
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RequestRating._({
    this.id,
    required this.requestId,
    required this.fromUserId,
    required this.toUserId,
    required this.rating,
    this.feedback,
    required this.createdAt,
  });

  factory RequestRating({
    int? id,
    required int requestId,
    required int fromUserId,
    required int toUserId,
    required int rating,
    String? feedback,
    required DateTime createdAt,
  }) = _RequestRatingImpl;

  factory RequestRating.fromJson(Map<String, dynamic> jsonSerialization) {
    return RequestRating(
      id: jsonSerialization['id'] as int?,
      requestId: jsonSerialization['requestId'] as int,
      fromUserId: jsonSerialization['fromUserId'] as int,
      toUserId: jsonSerialization['toUserId'] as int,
      rating: jsonSerialization['rating'] as int,
      feedback: jsonSerialization['feedback'] as String?,
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

  int fromUserId;

  int toUserId;

  int rating;

  String? feedback;

  DateTime createdAt;

  /// Returns a shallow copy of this [RequestRating]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RequestRating copyWith({
    int? id,
    int? requestId,
    int? fromUserId,
    int? toUserId,
    int? rating,
    String? feedback,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RequestRating',
      if (id != null) 'id': id,
      'requestId': requestId,
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'rating': rating,
      if (feedback != null) 'feedback': feedback,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RequestRating',
      if (id != null) 'id': id,
      'requestId': requestId,
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'rating': rating,
      if (feedback != null) 'feedback': feedback,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequestRatingImpl extends RequestRating {
  _RequestRatingImpl({
    int? id,
    required int requestId,
    required int fromUserId,
    required int toUserId,
    required int rating,
    String? feedback,
    required DateTime createdAt,
  }) : super._(
         id: id,
         requestId: requestId,
         fromUserId: fromUserId,
         toUserId: toUserId,
         rating: rating,
         feedback: feedback,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RequestRating]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RequestRating copyWith({
    Object? id = _Undefined,
    int? requestId,
    int? fromUserId,
    int? toUserId,
    int? rating,
    Object? feedback = _Undefined,
    DateTime? createdAt,
  }) {
    return RequestRating(
      id: id is int? ? id : this.id,
      requestId: requestId ?? this.requestId,
      fromUserId: fromUserId ?? this.fromUserId,
      toUserId: toUserId ?? this.toUserId,
      rating: rating ?? this.rating,
      feedback: feedback is String? ? feedback : this.feedback,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
