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

abstract class HelpRequest
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  HelpRequest._({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.urgency,
    required this.status,
    required this.rewardPoints,
    required this.isEmergency,
    required this.creatorUserId,
    required this.creatorEmail,
    this.helperUserId,
    this.helperEmail,
    this.neighborhoodZone,
    this.estimatedDuration,
    this.upvotes,
    required this.createdAt,
    this.updatedAt,
  });

  factory HelpRequest({
    int? id,
    required String title,
    required String description,
    required String category,
    required String location,
    required String urgency,
    required String status,
    required int rewardPoints,
    required bool isEmergency,
    required int creatorUserId,
    required String creatorEmail,
    int? helperUserId,
    String? helperEmail,
    String? neighborhoodZone,
    String? estimatedDuration,
    int? upvotes,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _HelpRequestImpl;

  factory HelpRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return HelpRequest(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      location: jsonSerialization['location'] as String,
      urgency: jsonSerialization['urgency'] as String,
      status: jsonSerialization['status'] as String,
      rewardPoints: jsonSerialization['rewardPoints'] as int,
      isEmergency: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isEmergency'],
      ),
      creatorUserId: jsonSerialization['creatorUserId'] as int,
      creatorEmail: jsonSerialization['creatorEmail'] as String,
      helperUserId: jsonSerialization['helperUserId'] as int?,
      helperEmail: jsonSerialization['helperEmail'] as String?,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String?,
      estimatedDuration: jsonSerialization['estimatedDuration'] as String?,
      upvotes: jsonSerialization['upvotes'] as int?,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String description;

  String category;

  String location;

  String urgency;

  String status;

  int rewardPoints;

  bool isEmergency;

  int creatorUserId;

  String creatorEmail;

  int? helperUserId;

  String? helperEmail;

  String? neighborhoodZone;

  String? estimatedDuration;

  int? upvotes;

  DateTime createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [HelpRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  HelpRequest copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    String? location,
    String? urgency,
    String? status,
    int? rewardPoints,
    bool? isEmergency,
    int? creatorUserId,
    String? creatorEmail,
    int? helperUserId,
    String? helperEmail,
    String? neighborhoodZone,
    String? estimatedDuration,
    int? upvotes,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HelpRequest',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'urgency': urgency,
      'status': status,
      'rewardPoints': rewardPoints,
      'isEmergency': isEmergency,
      'creatorUserId': creatorUserId,
      'creatorEmail': creatorEmail,
      if (helperUserId != null) 'helperUserId': helperUserId,
      if (helperEmail != null) 'helperEmail': helperEmail,
      if (neighborhoodZone != null) 'neighborhoodZone': neighborhoodZone,
      if (estimatedDuration != null) 'estimatedDuration': estimatedDuration,
      if (upvotes != null) 'upvotes': upvotes,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HelpRequest',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'urgency': urgency,
      'status': status,
      'rewardPoints': rewardPoints,
      'isEmergency': isEmergency,
      'creatorUserId': creatorUserId,
      'creatorEmail': creatorEmail,
      if (helperUserId != null) 'helperUserId': helperUserId,
      if (helperEmail != null) 'helperEmail': helperEmail,
      if (neighborhoodZone != null) 'neighborhoodZone': neighborhoodZone,
      if (estimatedDuration != null) 'estimatedDuration': estimatedDuration,
      if (upvotes != null) 'upvotes': upvotes,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HelpRequestImpl extends HelpRequest {
  _HelpRequestImpl({
    int? id,
    required String title,
    required String description,
    required String category,
    required String location,
    required String urgency,
    required String status,
    required int rewardPoints,
    required bool isEmergency,
    required int creatorUserId,
    required String creatorEmail,
    int? helperUserId,
    String? helperEmail,
    String? neighborhoodZone,
    String? estimatedDuration,
    int? upvotes,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         category: category,
         location: location,
         urgency: urgency,
         status: status,
         rewardPoints: rewardPoints,
         isEmergency: isEmergency,
         creatorUserId: creatorUserId,
         creatorEmail: creatorEmail,
         helperUserId: helperUserId,
         helperEmail: helperEmail,
         neighborhoodZone: neighborhoodZone,
         estimatedDuration: estimatedDuration,
         upvotes: upvotes,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [HelpRequest]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  HelpRequest copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? category,
    String? location,
    String? urgency,
    String? status,
    int? rewardPoints,
    bool? isEmergency,
    int? creatorUserId,
    String? creatorEmail,
    Object? helperUserId = _Undefined,
    Object? helperEmail = _Undefined,
    Object? neighborhoodZone = _Undefined,
    Object? estimatedDuration = _Undefined,
    Object? upvotes = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return HelpRequest(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      location: location ?? this.location,
      urgency: urgency ?? this.urgency,
      status: status ?? this.status,
      rewardPoints: rewardPoints ?? this.rewardPoints,
      isEmergency: isEmergency ?? this.isEmergency,
      creatorUserId: creatorUserId ?? this.creatorUserId,
      creatorEmail: creatorEmail ?? this.creatorEmail,
      helperUserId: helperUserId is int? ? helperUserId : this.helperUserId,
      helperEmail: helperEmail is String? ? helperEmail : this.helperEmail,
      neighborhoodZone: neighborhoodZone is String?
          ? neighborhoodZone
          : this.neighborhoodZone,
      estimatedDuration: estimatedDuration is String?
          ? estimatedDuration
          : this.estimatedDuration,
      upvotes: upvotes is int? ? upvotes : this.upvotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
