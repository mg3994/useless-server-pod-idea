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

abstract class CarpoolRide
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CarpoolRide._({
    this.id,
    required this.driverEmail,
    required this.origin,
    required this.destination,
    required this.departureTime,
    required this.availableSeats,
    required this.contributionPoints,
    required this.neighborhoodZone,
    this.notes,
    this.passengerEmails,
    required this.isCompleted,
    required this.createdAt,
  });

  factory CarpoolRide({
    int? id,
    required String driverEmail,
    required String origin,
    required String destination,
    required String departureTime,
    required int availableSeats,
    required int contributionPoints,
    required String neighborhoodZone,
    String? notes,
    String? passengerEmails,
    required bool isCompleted,
    required DateTime createdAt,
  }) = _CarpoolRideImpl;

  factory CarpoolRide.fromJson(Map<String, dynamic> jsonSerialization) {
    return CarpoolRide(
      id: jsonSerialization['id'] as int?,
      driverEmail: jsonSerialization['driverEmail'] as String,
      origin: jsonSerialization['origin'] as String,
      destination: jsonSerialization['destination'] as String,
      departureTime: jsonSerialization['departureTime'] as String,
      availableSeats: jsonSerialization['availableSeats'] as int,
      contributionPoints: jsonSerialization['contributionPoints'] as int,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String,
      notes: jsonSerialization['notes'] as String?,
      passengerEmails: jsonSerialization['passengerEmails'] as String?,
      isCompleted: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isCompleted'],
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

  String driverEmail;

  String origin;

  String destination;

  String departureTime;

  int availableSeats;

  int contributionPoints;

  String neighborhoodZone;

  String? notes;

  String? passengerEmails;

  bool isCompleted;

  DateTime createdAt;

  /// Returns a shallow copy of this [CarpoolRide]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CarpoolRide copyWith({
    int? id,
    String? driverEmail,
    String? origin,
    String? destination,
    String? departureTime,
    int? availableSeats,
    int? contributionPoints,
    String? neighborhoodZone,
    String? notes,
    String? passengerEmails,
    bool? isCompleted,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CarpoolRide',
      if (id != null) 'id': id,
      'driverEmail': driverEmail,
      'origin': origin,
      'destination': destination,
      'departureTime': departureTime,
      'availableSeats': availableSeats,
      'contributionPoints': contributionPoints,
      'neighborhoodZone': neighborhoodZone,
      if (notes != null) 'notes': notes,
      if (passengerEmails != null) 'passengerEmails': passengerEmails,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CarpoolRide',
      if (id != null) 'id': id,
      'driverEmail': driverEmail,
      'origin': origin,
      'destination': destination,
      'departureTime': departureTime,
      'availableSeats': availableSeats,
      'contributionPoints': contributionPoints,
      'neighborhoodZone': neighborhoodZone,
      if (notes != null) 'notes': notes,
      if (passengerEmails != null) 'passengerEmails': passengerEmails,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CarpoolRideImpl extends CarpoolRide {
  _CarpoolRideImpl({
    int? id,
    required String driverEmail,
    required String origin,
    required String destination,
    required String departureTime,
    required int availableSeats,
    required int contributionPoints,
    required String neighborhoodZone,
    String? notes,
    String? passengerEmails,
    required bool isCompleted,
    required DateTime createdAt,
  }) : super._(
         id: id,
         driverEmail: driverEmail,
         origin: origin,
         destination: destination,
         departureTime: departureTime,
         availableSeats: availableSeats,
         contributionPoints: contributionPoints,
         neighborhoodZone: neighborhoodZone,
         notes: notes,
         passengerEmails: passengerEmails,
         isCompleted: isCompleted,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CarpoolRide]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CarpoolRide copyWith({
    Object? id = _Undefined,
    String? driverEmail,
    String? origin,
    String? destination,
    String? departureTime,
    int? availableSeats,
    int? contributionPoints,
    String? neighborhoodZone,
    Object? notes = _Undefined,
    Object? passengerEmails = _Undefined,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return CarpoolRide(
      id: id is int? ? id : this.id,
      driverEmail: driverEmail ?? this.driverEmail,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      departureTime: departureTime ?? this.departureTime,
      availableSeats: availableSeats ?? this.availableSeats,
      contributionPoints: contributionPoints ?? this.contributionPoints,
      neighborhoodZone: neighborhoodZone ?? this.neighborhoodZone,
      notes: notes is String? ? notes : this.notes,
      passengerEmails: passengerEmails is String?
          ? passengerEmails
          : this.passengerEmails,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
