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

abstract class VolunteerEvent
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  VolunteerEvent._({
    this.id,
    required this.title,
    required this.description,
    required this.organizerEmail,
    required this.eventDate,
    required this.location,
    required this.neighborhoodZone,
    required this.volunteersCount,
    this.volunteersList,
    required this.pointsReward,
    required this.createdAt,
  });

  factory VolunteerEvent({
    int? id,
    required String title,
    required String description,
    required String organizerEmail,
    required String eventDate,
    required String location,
    required String neighborhoodZone,
    required int volunteersCount,
    String? volunteersList,
    required int pointsReward,
    required DateTime createdAt,
  }) = _VolunteerEventImpl;

  factory VolunteerEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return VolunteerEvent(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      organizerEmail: jsonSerialization['organizerEmail'] as String,
      eventDate: jsonSerialization['eventDate'] as String,
      location: jsonSerialization['location'] as String,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String,
      volunteersCount: jsonSerialization['volunteersCount'] as int,
      volunteersList: jsonSerialization['volunteersList'] as String?,
      pointsReward: jsonSerialization['pointsReward'] as int,
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

  String organizerEmail;

  String eventDate;

  String location;

  String neighborhoodZone;

  int volunteersCount;

  String? volunteersList;

  int pointsReward;

  DateTime createdAt;

  /// Returns a shallow copy of this [VolunteerEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  VolunteerEvent copyWith({
    int? id,
    String? title,
    String? description,
    String? organizerEmail,
    String? eventDate,
    String? location,
    String? neighborhoodZone,
    int? volunteersCount,
    String? volunteersList,
    int? pointsReward,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VolunteerEvent',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'organizerEmail': organizerEmail,
      'eventDate': eventDate,
      'location': location,
      'neighborhoodZone': neighborhoodZone,
      'volunteersCount': volunteersCount,
      if (volunteersList != null) 'volunteersList': volunteersList,
      'pointsReward': pointsReward,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VolunteerEvent',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'organizerEmail': organizerEmail,
      'eventDate': eventDate,
      'location': location,
      'neighborhoodZone': neighborhoodZone,
      'volunteersCount': volunteersCount,
      if (volunteersList != null) 'volunteersList': volunteersList,
      'pointsReward': pointsReward,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VolunteerEventImpl extends VolunteerEvent {
  _VolunteerEventImpl({
    int? id,
    required String title,
    required String description,
    required String organizerEmail,
    required String eventDate,
    required String location,
    required String neighborhoodZone,
    required int volunteersCount,
    String? volunteersList,
    required int pointsReward,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         organizerEmail: organizerEmail,
         eventDate: eventDate,
         location: location,
         neighborhoodZone: neighborhoodZone,
         volunteersCount: volunteersCount,
         volunteersList: volunteersList,
         pointsReward: pointsReward,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [VolunteerEvent]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  VolunteerEvent copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? organizerEmail,
    String? eventDate,
    String? location,
    String? neighborhoodZone,
    int? volunteersCount,
    Object? volunteersList = _Undefined,
    int? pointsReward,
    DateTime? createdAt,
  }) {
    return VolunteerEvent(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      organizerEmail: organizerEmail ?? this.organizerEmail,
      eventDate: eventDate ?? this.eventDate,
      location: location ?? this.location,
      neighborhoodZone: neighborhoodZone ?? this.neighborhoodZone,
      volunteersCount: volunteersCount ?? this.volunteersCount,
      volunteersList: volunteersList is String?
          ? volunteersList
          : this.volunteersList,
      pointsReward: pointsReward ?? this.pointsReward,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
