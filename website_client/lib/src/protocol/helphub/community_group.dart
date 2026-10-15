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

abstract class CommunityGroup
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CommunityGroup._({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.neighborhoodZone,
    required this.memberCount,
    required this.leaderEmail,
    this.membersList,
    required this.createdAt,
  });

  factory CommunityGroup({
    int? id,
    required String name,
    required String description,
    required String category,
    required String neighborhoodZone,
    required int memberCount,
    required String leaderEmail,
    String? membersList,
    required DateTime createdAt,
  }) = _CommunityGroupImpl;

  factory CommunityGroup.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommunityGroup(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String,
      memberCount: jsonSerialization['memberCount'] as int,
      leaderEmail: jsonSerialization['leaderEmail'] as String,
      membersList: jsonSerialization['membersList'] as String?,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String description;

  String category;

  String neighborhoodZone;

  int memberCount;

  String leaderEmail;

  String? membersList;

  DateTime createdAt;

  /// Returns a shallow copy of this [CommunityGroup]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CommunityGroup copyWith({
    int? id,
    String? name,
    String? description,
    String? category,
    String? neighborhoodZone,
    int? memberCount,
    String? leaderEmail,
    String? membersList,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityGroup',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'category': category,
      'neighborhoodZone': neighborhoodZone,
      'memberCount': memberCount,
      'leaderEmail': leaderEmail,
      if (membersList != null) 'membersList': membersList,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommunityGroup',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'category': category,
      'neighborhoodZone': neighborhoodZone,
      'memberCount': memberCount,
      'leaderEmail': leaderEmail,
      if (membersList != null) 'membersList': membersList,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityGroupImpl extends CommunityGroup {
  _CommunityGroupImpl({
    int? id,
    required String name,
    required String description,
    required String category,
    required String neighborhoodZone,
    required int memberCount,
    required String leaderEmail,
    String? membersList,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         category: category,
         neighborhoodZone: neighborhoodZone,
         memberCount: memberCount,
         leaderEmail: leaderEmail,
         membersList: membersList,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CommunityGroup]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CommunityGroup copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? category,
    String? neighborhoodZone,
    int? memberCount,
    String? leaderEmail,
    Object? membersList = _Undefined,
    DateTime? createdAt,
  }) {
    return CommunityGroup(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      neighborhoodZone: neighborhoodZone ?? this.neighborhoodZone,
      memberCount: memberCount ?? this.memberCount,
      leaderEmail: leaderEmail ?? this.leaderEmail,
      membersList: membersList is String? ? membersList : this.membersList,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
