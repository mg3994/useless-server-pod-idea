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

abstract class SkillOffer
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  SkillOffer._({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.offererUserId,
    required this.offererEmail,
    required this.availability,
    this.neighborhoodZone,
    required this.isAvailable,
    this.claimedByEmail,
    required this.createdAt,
  });

  factory SkillOffer({
    int? id,
    required String title,
    required String description,
    required String category,
    required int offererUserId,
    required String offererEmail,
    required String availability,
    String? neighborhoodZone,
    required bool isAvailable,
    String? claimedByEmail,
    required DateTime createdAt,
  }) = _SkillOfferImpl;

  factory SkillOffer.fromJson(Map<String, dynamic> jsonSerialization) {
    return SkillOffer(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      offererUserId: jsonSerialization['offererUserId'] as int,
      offererEmail: jsonSerialization['offererEmail'] as String,
      availability: jsonSerialization['availability'] as String,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String?,
      isAvailable: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isAvailable'],
      ),
      claimedByEmail: jsonSerialization['claimedByEmail'] as String?,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String description;

  String category;

  int offererUserId;

  String offererEmail;

  String availability;

  String? neighborhoodZone;

  bool isAvailable;

  String? claimedByEmail;

  DateTime createdAt;

  /// Returns a shallow copy of this [SkillOffer]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  SkillOffer copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    int? offererUserId,
    String? offererEmail,
    String? availability,
    String? neighborhoodZone,
    bool? isAvailable,
    String? claimedByEmail,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SkillOffer',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'offererUserId': offererUserId,
      'offererEmail': offererEmail,
      'availability': availability,
      if (neighborhoodZone != null) 'neighborhoodZone': neighborhoodZone,
      'isAvailable': isAvailable,
      if (claimedByEmail != null) 'claimedByEmail': claimedByEmail,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SkillOffer',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'offererUserId': offererUserId,
      'offererEmail': offererEmail,
      'availability': availability,
      if (neighborhoodZone != null) 'neighborhoodZone': neighborhoodZone,
      'isAvailable': isAvailable,
      if (claimedByEmail != null) 'claimedByEmail': claimedByEmail,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SkillOfferImpl extends SkillOffer {
  _SkillOfferImpl({
    int? id,
    required String title,
    required String description,
    required String category,
    required int offererUserId,
    required String offererEmail,
    required String availability,
    String? neighborhoodZone,
    required bool isAvailable,
    String? claimedByEmail,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         category: category,
         offererUserId: offererUserId,
         offererEmail: offererEmail,
         availability: availability,
         neighborhoodZone: neighborhoodZone,
         isAvailable: isAvailable,
         claimedByEmail: claimedByEmail,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SkillOffer]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  SkillOffer copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? category,
    int? offererUserId,
    String? offererEmail,
    String? availability,
    Object? neighborhoodZone = _Undefined,
    bool? isAvailable,
    Object? claimedByEmail = _Undefined,
    DateTime? createdAt,
  }) {
    return SkillOffer(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      offererUserId: offererUserId ?? this.offererUserId,
      offererEmail: offererEmail ?? this.offererEmail,
      availability: availability ?? this.availability,
      neighborhoodZone: neighborhoodZone is String?
          ? neighborhoodZone
          : this.neighborhoodZone,
      isAvailable: isAvailable ?? this.isAvailable,
      claimedByEmail: claimedByEmail is String?
          ? claimedByEmail
          : this.claimedByEmail,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
