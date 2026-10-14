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

abstract class UserProfile
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  UserProfile._({
    this.id,
    required this.userId,
    required this.email,
    required this.displayName,
    required this.points,
    required this.completedCount,
    required this.requestedCount,
    required this.avatarBadge,
    this.ratingAverage,
    this.ratingCount,
    this.skills,
    this.unlockedBadges,
  });

  factory UserProfile({
    int? id,
    required int userId,
    required String email,
    required String displayName,
    required int points,
    required int completedCount,
    required int requestedCount,
    required String avatarBadge,
    double? ratingAverage,
    int? ratingCount,
    String? skills,
    String? unlockedBadges,
  }) = _UserProfileImpl;

  factory UserProfile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserProfile(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      email: jsonSerialization['email'] as String,
      displayName: jsonSerialization['displayName'] as String,
      points: jsonSerialization['points'] as int,
      completedCount: jsonSerialization['completedCount'] as int,
      requestedCount: jsonSerialization['requestedCount'] as int,
      avatarBadge: jsonSerialization['avatarBadge'] as String,
      ratingAverage: (jsonSerialization['ratingAverage'] as num?)?.toDouble(),
      ratingCount: jsonSerialization['ratingCount'] as int?,
      skills: jsonSerialization['skills'] as String?,
      unlockedBadges: jsonSerialization['unlockedBadges'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String email;

  String displayName;

  int points;

  int completedCount;

  int requestedCount;

  String avatarBadge;

  double? ratingAverage;

  int? ratingCount;

  String? skills;

  String? unlockedBadges;

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  UserProfile copyWith({
    int? id,
    int? userId,
    String? email,
    String? displayName,
    int? points,
    int? completedCount,
    int? requestedCount,
    String? avatarBadge,
    double? ratingAverage,
    int? ratingCount,
    String? skills,
    String? unlockedBadges,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      'userId': userId,
      'email': email,
      'displayName': displayName,
      'points': points,
      'completedCount': completedCount,
      'requestedCount': requestedCount,
      'avatarBadge': avatarBadge,
      if (ratingAverage != null) 'ratingAverage': ratingAverage,
      if (ratingCount != null) 'ratingCount': ratingCount,
      if (skills != null) 'skills': skills,
      if (unlockedBadges != null) 'unlockedBadges': unlockedBadges,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserProfile',
      if (id != null) 'id': id,
      'userId': userId,
      'email': email,
      'displayName': displayName,
      'points': points,
      'completedCount': completedCount,
      'requestedCount': requestedCount,
      'avatarBadge': avatarBadge,
      if (ratingAverage != null) 'ratingAverage': ratingAverage,
      if (ratingCount != null) 'ratingCount': ratingCount,
      if (skills != null) 'skills': skills,
      if (unlockedBadges != null) 'unlockedBadges': unlockedBadges,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserProfileImpl extends UserProfile {
  _UserProfileImpl({
    int? id,
    required int userId,
    required String email,
    required String displayName,
    required int points,
    required int completedCount,
    required int requestedCount,
    required String avatarBadge,
    double? ratingAverage,
    int? ratingCount,
    String? skills,
    String? unlockedBadges,
  }) : super._(
         id: id,
         userId: userId,
         email: email,
         displayName: displayName,
         points: points,
         completedCount: completedCount,
         requestedCount: requestedCount,
         avatarBadge: avatarBadge,
         ratingAverage: ratingAverage,
         ratingCount: ratingCount,
         skills: skills,
         unlockedBadges: unlockedBadges,
       );

  /// Returns a shallow copy of this [UserProfile]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  UserProfile copyWith({
    Object? id = _Undefined,
    int? userId,
    String? email,
    String? displayName,
    int? points,
    int? completedCount,
    int? requestedCount,
    String? avatarBadge,
    Object? ratingAverage = _Undefined,
    Object? ratingCount = _Undefined,
    Object? skills = _Undefined,
    Object? unlockedBadges = _Undefined,
  }) {
    return UserProfile(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      points: points ?? this.points,
      completedCount: completedCount ?? this.completedCount,
      requestedCount: requestedCount ?? this.requestedCount,
      avatarBadge: avatarBadge ?? this.avatarBadge,
      ratingAverage: ratingAverage is double?
          ? ratingAverage
          : this.ratingAverage,
      ratingCount: ratingCount is int? ? ratingCount : this.ratingCount,
      skills: skills is String? ? skills : this.skills,
      unlockedBadges: unlockedBadges is String?
          ? unlockedBadges
          : this.unlockedBadges,
    );
  }
}
