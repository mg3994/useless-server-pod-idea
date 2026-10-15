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

abstract class BorrowableItem
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  BorrowableItem._({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.ownerUserId,
    required this.ownerEmail,
    this.depositRequired,
    required this.neighborhoodZone,
    required this.isAvailable,
    this.borrowedByEmail,
    required this.createdAt,
  });

  factory BorrowableItem({
    int? id,
    required String title,
    required String description,
    required String category,
    required int ownerUserId,
    required String ownerEmail,
    String? depositRequired,
    required String neighborhoodZone,
    required bool isAvailable,
    String? borrowedByEmail,
    required DateTime createdAt,
  }) = _BorrowableItemImpl;

  factory BorrowableItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return BorrowableItem(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      ownerUserId: jsonSerialization['ownerUserId'] as int,
      ownerEmail: jsonSerialization['ownerEmail'] as String,
      depositRequired: jsonSerialization['depositRequired'] as String?,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String,
      isAvailable: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isAvailable'],
      ),
      borrowedByEmail: jsonSerialization['borrowedByEmail'] as String?,
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

  int ownerUserId;

  String ownerEmail;

  String? depositRequired;

  String neighborhoodZone;

  bool isAvailable;

  String? borrowedByEmail;

  DateTime createdAt;

  /// Returns a shallow copy of this [BorrowableItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  BorrowableItem copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    int? ownerUserId,
    String? ownerEmail,
    String? depositRequired,
    String? neighborhoodZone,
    bool? isAvailable,
    String? borrowedByEmail,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'BorrowableItem',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'ownerUserId': ownerUserId,
      'ownerEmail': ownerEmail,
      if (depositRequired != null) 'depositRequired': depositRequired,
      'neighborhoodZone': neighborhoodZone,
      'isAvailable': isAvailable,
      if (borrowedByEmail != null) 'borrowedByEmail': borrowedByEmail,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'BorrowableItem',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'ownerUserId': ownerUserId,
      'ownerEmail': ownerEmail,
      if (depositRequired != null) 'depositRequired': depositRequired,
      'neighborhoodZone': neighborhoodZone,
      'isAvailable': isAvailable,
      if (borrowedByEmail != null) 'borrowedByEmail': borrowedByEmail,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BorrowableItemImpl extends BorrowableItem {
  _BorrowableItemImpl({
    int? id,
    required String title,
    required String description,
    required String category,
    required int ownerUserId,
    required String ownerEmail,
    String? depositRequired,
    required String neighborhoodZone,
    required bool isAvailable,
    String? borrowedByEmail,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         category: category,
         ownerUserId: ownerUserId,
         ownerEmail: ownerEmail,
         depositRequired: depositRequired,
         neighborhoodZone: neighborhoodZone,
         isAvailable: isAvailable,
         borrowedByEmail: borrowedByEmail,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [BorrowableItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  BorrowableItem copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? category,
    int? ownerUserId,
    String? ownerEmail,
    Object? depositRequired = _Undefined,
    String? neighborhoodZone,
    bool? isAvailable,
    Object? borrowedByEmail = _Undefined,
    DateTime? createdAt,
  }) {
    return BorrowableItem(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      ownerEmail: ownerEmail ?? this.ownerEmail,
      depositRequired: depositRequired is String?
          ? depositRequired
          : this.depositRequired,
      neighborhoodZone: neighborhoodZone ?? this.neighborhoodZone,
      isAvailable: isAvailable ?? this.isAvailable,
      borrowedByEmail: borrowedByEmail is String?
          ? borrowedByEmail
          : this.borrowedByEmail,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
