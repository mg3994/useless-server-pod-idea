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

abstract class RewardRedemption
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  RewardRedemption._({
    this.id,
    required this.perkTitle,
    required this.pointsCost,
    required this.partnerName,
    required this.userEmail,
    required this.redemptionCode,
    required this.createdAt,
  });

  factory RewardRedemption({
    int? id,
    required String perkTitle,
    required int pointsCost,
    required String partnerName,
    required String userEmail,
    required String redemptionCode,
    required DateTime createdAt,
  }) = _RewardRedemptionImpl;

  factory RewardRedemption.fromJson(Map<String, dynamic> jsonSerialization) {
    return RewardRedemption(
      id: jsonSerialization['id'] as int?,
      perkTitle: jsonSerialization['perkTitle'] as String,
      pointsCost: jsonSerialization['pointsCost'] as int,
      partnerName: jsonSerialization['partnerName'] as String,
      userEmail: jsonSerialization['userEmail'] as String,
      redemptionCode: jsonSerialization['redemptionCode'] as String,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String perkTitle;

  int pointsCost;

  String partnerName;

  String userEmail;

  String redemptionCode;

  DateTime createdAt;

  /// Returns a shallow copy of this [RewardRedemption]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  RewardRedemption copyWith({
    int? id,
    String? perkTitle,
    int? pointsCost,
    String? partnerName,
    String? userEmail,
    String? redemptionCode,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RewardRedemption',
      if (id != null) 'id': id,
      'perkTitle': perkTitle,
      'pointsCost': pointsCost,
      'partnerName': partnerName,
      'userEmail': userEmail,
      'redemptionCode': redemptionCode,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RewardRedemption',
      if (id != null) 'id': id,
      'perkTitle': perkTitle,
      'pointsCost': pointsCost,
      'partnerName': partnerName,
      'userEmail': userEmail,
      'redemptionCode': redemptionCode,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RewardRedemptionImpl extends RewardRedemption {
  _RewardRedemptionImpl({
    int? id,
    required String perkTitle,
    required int pointsCost,
    required String partnerName,
    required String userEmail,
    required String redemptionCode,
    required DateTime createdAt,
  }) : super._(
         id: id,
         perkTitle: perkTitle,
         pointsCost: pointsCost,
         partnerName: partnerName,
         userEmail: userEmail,
         redemptionCode: redemptionCode,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [RewardRedemption]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  RewardRedemption copyWith({
    Object? id = _Undefined,
    String? perkTitle,
    int? pointsCost,
    String? partnerName,
    String? userEmail,
    String? redemptionCode,
    DateTime? createdAt,
  }) {
    return RewardRedemption(
      id: id is int? ? id : this.id,
      perkTitle: perkTitle ?? this.perkTitle,
      pointsCost: pointsCost ?? this.pointsCost,
      partnerName: partnerName ?? this.partnerName,
      userEmail: userEmail ?? this.userEmail,
      redemptionCode: redemptionCode ?? this.redemptionCode,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
