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
import 'package:serverpod/serverpod.dart' as _is;

abstract class VolunteerEvent
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = VolunteerEventTable();

  static const db = VolunteerEventRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [VolunteerEvent]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static VolunteerEventInclude include() {
    return VolunteerEventInclude._();
  }

  static VolunteerEventIncludeList includeList({
    _is.WhereExpressionBuilder<VolunteerEventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<VolunteerEventTable>? orderBy,
    _is.OrderByListBuilder<VolunteerEventTable>? orderByList,
    VolunteerEventInclude? include,
  }) {
    return VolunteerEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VolunteerEvent.t),
      orderByList: orderByList?.call(VolunteerEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class VolunteerEventUpdateTable extends _is.UpdateTable<VolunteerEventTable> {
  VolunteerEventUpdateTable(super.table);

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<String, String> organizerEmail(String value) =>
      _is.ColumnValue(
        table.organizerEmail,
        value,
      );

  _is.ColumnValue<String, String> eventDate(String value) => _is.ColumnValue(
    table.eventDate,
    value,
  );

  _is.ColumnValue<String, String> location(String value) => _is.ColumnValue(
    table.location,
    value,
  );

  _is.ColumnValue<String, String> neighborhoodZone(String value) =>
      _is.ColumnValue(
        table.neighborhoodZone,
        value,
      );

  _is.ColumnValue<int, int> volunteersCount(int value) => _is.ColumnValue(
    table.volunteersCount,
    value,
  );

  _is.ColumnValue<String, String> volunteersList(String? value) =>
      _is.ColumnValue(
        table.volunteersList,
        value,
      );

  _is.ColumnValue<int, int> pointsReward(int value) => _is.ColumnValue(
    table.pointsReward,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class VolunteerEventTable extends _is.Table<int?> {
  VolunteerEventTable({super.tableRelation})
    : super(tableName: 'helphub_volunteer_event') {
    updateTable = VolunteerEventUpdateTable(this);
    title = _is.ColumnString(
      'title',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    organizerEmail = _is.ColumnString(
      'organizerEmail',
      this,
    );
    eventDate = _is.ColumnString(
      'eventDate',
      this,
    );
    location = _is.ColumnString(
      'location',
      this,
    );
    neighborhoodZone = _is.ColumnString(
      'neighborhoodZone',
      this,
    );
    volunteersCount = _is.ColumnInt(
      'volunteersCount',
      this,
    );
    volunteersList = _is.ColumnString(
      'volunteersList',
      this,
    );
    pointsReward = _is.ColumnInt(
      'pointsReward',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final VolunteerEventUpdateTable updateTable;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString organizerEmail;

  late final _is.ColumnString eventDate;

  late final _is.ColumnString location;

  late final _is.ColumnString neighborhoodZone;

  late final _is.ColumnInt volunteersCount;

  late final _is.ColumnString volunteersList;

  late final _is.ColumnInt pointsReward;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    title,
    description,
    organizerEmail,
    eventDate,
    location,
    neighborhoodZone,
    volunteersCount,
    volunteersList,
    pointsReward,
    createdAt,
  ];
}

class VolunteerEventInclude extends _is.IncludeObject {
  VolunteerEventInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => VolunteerEvent.t;
}

class VolunteerEventIncludeList extends _is.IncludeList {
  VolunteerEventIncludeList._({
    _is.WhereExpressionBuilder<VolunteerEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VolunteerEvent.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => VolunteerEvent.t;
}

class VolunteerEventRepository {
  const VolunteerEventRepository._();

  /// Returns a list of [VolunteerEvent]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<VolunteerEvent>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<VolunteerEventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<VolunteerEventTable>? orderBy,
    _is.OrderByListBuilder<VolunteerEventTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<VolunteerEvent>(
      where: where?.call(VolunteerEvent.t),
      orderBy: orderBy?.call(VolunteerEvent.t),
      orderByList: orderByList?.call(VolunteerEvent.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [VolunteerEvent] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<VolunteerEvent?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<VolunteerEventTable>? where,
    int? offset,
    _is.OrderByBuilder<VolunteerEventTable>? orderBy,
    _is.OrderByListBuilder<VolunteerEventTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<VolunteerEvent>(
      where: where?.call(VolunteerEvent.t),
      orderBy: orderBy?.call(VolunteerEvent.t),
      orderByList: orderByList?.call(VolunteerEvent.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [VolunteerEvent] by its [id] or null if no such row exists.
  Future<VolunteerEvent?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<VolunteerEvent>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [VolunteerEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [VolunteerEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<VolunteerEvent>> insert(
    _is.DatabaseSession session,
    List<VolunteerEvent> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<VolunteerEvent>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [VolunteerEvent] and returns the inserted row.
  ///
  /// The returned [VolunteerEvent] will have its `id` field set.
  Future<VolunteerEvent> insertRow(
    _is.DatabaseSession session,
    VolunteerEvent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<VolunteerEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [VolunteerEvent]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [VolunteerEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<VolunteerEvent>> upsert(
    _is.DatabaseSession session,
    List<VolunteerEvent> rows, {
    required _is.ColumnSelections<VolunteerEventTable> conflictColumns,
    _is.ColumnSelections<VolunteerEventTable>? updateColumns,
    _is.WhereExpressionBuilder<VolunteerEventTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<VolunteerEvent>(
      rows,
      conflictColumns: conflictColumns(VolunteerEvent.t),
      updateColumns: updateColumns?.call(VolunteerEvent.t),
      updateWhere: updateWhere?.call(VolunteerEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [VolunteerEvent] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [VolunteerEvent] will have its `id` field set.
  Future<VolunteerEvent?> upsertRow(
    _is.DatabaseSession session,
    VolunteerEvent row, {
    required _is.ColumnSelections<VolunteerEventTable> conflictColumns,
    _is.ColumnSelections<VolunteerEventTable>? updateColumns,
    _is.WhereExpressionBuilder<VolunteerEventTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<VolunteerEvent>(
      row,
      conflictColumns: conflictColumns(VolunteerEvent.t),
      updateColumns: updateColumns?.call(VolunteerEvent.t),
      updateWhere: updateWhere?.call(VolunteerEvent.t),
      transaction: transaction,
    );
  }

  /// Updates all [VolunteerEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<VolunteerEvent>> update(
    _is.DatabaseSession session,
    List<VolunteerEvent> rows, {
    _is.ColumnSelections<VolunteerEventTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<VolunteerEvent>(
      rows,
      columns: columns?.call(VolunteerEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [VolunteerEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VolunteerEvent> updateRow(
    _is.DatabaseSession session,
    VolunteerEvent row, {
    _is.ColumnSelections<VolunteerEventTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<VolunteerEvent>(
      row,
      columns: columns?.call(VolunteerEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VolunteerEvent] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<VolunteerEvent?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<VolunteerEventUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<VolunteerEvent>(
      id,
      columnValues: columnValues(VolunteerEvent.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [VolunteerEvent]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<VolunteerEvent>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<VolunteerEventUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<VolunteerEventTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<VolunteerEventTable>? orderBy,
    _is.OrderByListBuilder<VolunteerEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<VolunteerEvent>(
      columnValues: columnValues(VolunteerEvent.t.updateTable),
      where: where(VolunteerEvent.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VolunteerEvent.t),
      orderByList: orderByList?.call(VolunteerEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [VolunteerEvent]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<VolunteerEvent>> delete(
    _is.DatabaseSession session,
    List<VolunteerEvent> rows, {
    _is.OrderByBuilder<VolunteerEventTable>? orderBy,
    _is.OrderByListBuilder<VolunteerEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<VolunteerEvent>(
      rows,
      orderBy: orderBy?.call(VolunteerEvent.t),
      orderByList: orderByList?.call(VolunteerEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [VolunteerEvent].
  Future<VolunteerEvent> deleteRow(
    _is.DatabaseSession session,
    VolunteerEvent row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VolunteerEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<VolunteerEvent>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<VolunteerEventTable> where,
    _is.OrderByBuilder<VolunteerEventTable>? orderBy,
    _is.OrderByListBuilder<VolunteerEventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<VolunteerEvent>(
      where: where(VolunteerEvent.t),
      orderBy: orderBy?.call(VolunteerEvent.t),
      orderByList: orderByList?.call(VolunteerEvent.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<VolunteerEventTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<VolunteerEvent>(
      where: where?.call(VolunteerEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [VolunteerEvent] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<VolunteerEventTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<VolunteerEvent>(
      where: where(VolunteerEvent.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
