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

abstract class LostFoundItem
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  LostFoundItem._({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.location,
    required this.neighborhoodZone,
    required this.reporterEmail,
    this.claimedByEmail,
    required this.isResolved,
    required this.createdAt,
  });

  factory LostFoundItem({
    int? id,
    required String title,
    required String description,
    required String category,
    required String status,
    required String location,
    required String neighborhoodZone,
    required String reporterEmail,
    String? claimedByEmail,
    required bool isResolved,
    required DateTime createdAt,
  }) = _LostFoundItemImpl;

  factory LostFoundItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return LostFoundItem(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      status: jsonSerialization['status'] as String,
      location: jsonSerialization['location'] as String,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String,
      reporterEmail: jsonSerialization['reporterEmail'] as String,
      claimedByEmail: jsonSerialization['claimedByEmail'] as String?,
      isResolved: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isResolved'],
      ),
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

  String status;

  String location;

  String neighborhoodZone;

  String reporterEmail;

  String? claimedByEmail;

  bool isResolved;

  DateTime createdAt;

  /// Returns a shallow copy of this [LostFoundItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  LostFoundItem copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    String? status,
    String? location,
    String? neighborhoodZone,
    String? reporterEmail,
    String? claimedByEmail,
    bool? isResolved,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LostFoundItem',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'status': status,
      'location': location,
      'neighborhoodZone': neighborhoodZone,
      'reporterEmail': reporterEmail,
      if (claimedByEmail != null) 'claimedByEmail': claimedByEmail,
      'isResolved': isResolved,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LostFoundItem',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'status': status,
      'location': location,
      'neighborhoodZone': neighborhoodZone,
      'reporterEmail': reporterEmail,
      if (claimedByEmail != null) 'claimedByEmail': claimedByEmail,
      'isResolved': isResolved,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LostFoundItemImpl extends LostFoundItem {
  _LostFoundItemImpl({
    int? id,
    required String title,
    required String description,
    required String category,
    required String status,
    required String location,
    required String neighborhoodZone,
    required String reporterEmail,
    String? claimedByEmail,
    required bool isResolved,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         category: category,
         status: status,
         location: location,
         neighborhoodZone: neighborhoodZone,
         reporterEmail: reporterEmail,
         claimedByEmail: claimedByEmail,
         isResolved: isResolved,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [LostFoundItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  LostFoundItem copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? category,
    String? status,
    String? location,
    String? neighborhoodZone,
    String? reporterEmail,
    Object? claimedByEmail = _Undefined,
    bool? isResolved,
    DateTime? createdAt,
  }) {
    return LostFoundItem(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      status: status ?? this.status,
      location: location ?? this.location,
      neighborhoodZone: neighborhoodZone ?? this.neighborhoodZone,
      reporterEmail: reporterEmail ?? this.reporterEmail,
      claimedByEmail: claimedByEmail is String?
          ? claimedByEmail
          : this.claimedByEmail,
      isResolved: isResolved ?? this.isResolved,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
