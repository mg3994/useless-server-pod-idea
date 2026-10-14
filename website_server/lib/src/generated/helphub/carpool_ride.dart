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

abstract class CarpoolRide
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      isCompleted: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isCompleted'],
      ),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = CarpoolRideTable();

  static const db = CarpoolRideRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [CarpoolRide]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static CarpoolRideInclude include() {
    return CarpoolRideInclude._();
  }

  static CarpoolRideIncludeList includeList({
    _is.WhereExpressionBuilder<CarpoolRideTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CarpoolRideTable>? orderBy,
    _is.OrderByListBuilder<CarpoolRideTable>? orderByList,
    CarpoolRideInclude? include,
  }) {
    return CarpoolRideIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CarpoolRide.t),
      orderByList: orderByList?.call(CarpoolRide.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class CarpoolRideUpdateTable extends _is.UpdateTable<CarpoolRideTable> {
  CarpoolRideUpdateTable(super.table);

  _is.ColumnValue<String, String> driverEmail(String value) => _is.ColumnValue(
    table.driverEmail,
    value,
  );

  _is.ColumnValue<String, String> origin(String value) => _is.ColumnValue(
    table.origin,
    value,
  );

  _is.ColumnValue<String, String> destination(String value) => _is.ColumnValue(
    table.destination,
    value,
  );

  _is.ColumnValue<String, String> departureTime(String value) =>
      _is.ColumnValue(
        table.departureTime,
        value,
      );

  _is.ColumnValue<int, int> availableSeats(int value) => _is.ColumnValue(
    table.availableSeats,
    value,
  );

  _is.ColumnValue<int, int> contributionPoints(int value) => _is.ColumnValue(
    table.contributionPoints,
    value,
  );

  _is.ColumnValue<String, String> neighborhoodZone(String value) =>
      _is.ColumnValue(
        table.neighborhoodZone,
        value,
      );

  _is.ColumnValue<String, String> notes(String? value) => _is.ColumnValue(
    table.notes,
    value,
  );

  _is.ColumnValue<String, String> passengerEmails(String? value) =>
      _is.ColumnValue(
        table.passengerEmails,
        value,
      );

  _is.ColumnValue<bool, bool> isCompleted(bool value) => _is.ColumnValue(
    table.isCompleted,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class CarpoolRideTable extends _is.Table<int?> {
  CarpoolRideTable({super.tableRelation}) : super(tableName: 'carpool_ride') {
    updateTable = CarpoolRideUpdateTable(this);
    driverEmail = _is.ColumnString(
      'driverEmail',
      this,
    );
    origin = _is.ColumnString(
      'origin',
      this,
    );
    destination = _is.ColumnString(
      'destination',
      this,
    );
    departureTime = _is.ColumnString(
      'departureTime',
      this,
    );
    availableSeats = _is.ColumnInt(
      'availableSeats',
      this,
    );
    contributionPoints = _is.ColumnInt(
      'contributionPoints',
      this,
    );
    neighborhoodZone = _is.ColumnString(
      'neighborhoodZone',
      this,
    );
    notes = _is.ColumnString(
      'notes',
      this,
    );
    passengerEmails = _is.ColumnString(
      'passengerEmails',
      this,
    );
    isCompleted = _is.ColumnBool(
      'isCompleted',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final CarpoolRideUpdateTable updateTable;

  late final _is.ColumnString driverEmail;

  late final _is.ColumnString origin;

  late final _is.ColumnString destination;

  late final _is.ColumnString departureTime;

  late final _is.ColumnInt availableSeats;

  late final _is.ColumnInt contributionPoints;

  late final _is.ColumnString neighborhoodZone;

  late final _is.ColumnString notes;

  late final _is.ColumnString passengerEmails;

  late final _is.ColumnBool isCompleted;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    driverEmail,
    origin,
    destination,
    departureTime,
    availableSeats,
    contributionPoints,
    neighborhoodZone,
    notes,
    passengerEmails,
    isCompleted,
    createdAt,
  ];
}

class CarpoolRideInclude extends _is.IncludeObject {
  CarpoolRideInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => CarpoolRide.t;
}

class CarpoolRideIncludeList extends _is.IncludeList {
  CarpoolRideIncludeList._({
    _is.WhereExpressionBuilder<CarpoolRideTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CarpoolRide.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => CarpoolRide.t;
}

class CarpoolRideRepository {
  const CarpoolRideRepository._();

  /// Returns a list of [CarpoolRide]s matching the given query parameters.
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
  Future<List<CarpoolRide>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CarpoolRideTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CarpoolRideTable>? orderBy,
    _is.OrderByListBuilder<CarpoolRideTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CarpoolRide>(
      where: where?.call(CarpoolRide.t),
      orderBy: orderBy?.call(CarpoolRide.t),
      orderByList: orderByList?.call(CarpoolRide.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CarpoolRide] matching the given query parameters.
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
  Future<CarpoolRide?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CarpoolRideTable>? where,
    int? offset,
    _is.OrderByBuilder<CarpoolRideTable>? orderBy,
    _is.OrderByListBuilder<CarpoolRideTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CarpoolRide>(
      where: where?.call(CarpoolRide.t),
      orderBy: orderBy?.call(CarpoolRide.t),
      orderByList: orderByList?.call(CarpoolRide.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CarpoolRide] by its [id] or null if no such row exists.
  Future<CarpoolRide?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CarpoolRide>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CarpoolRide]s in the list and returns the inserted rows.
  ///
  /// The returned [CarpoolRide]s will have their `id` fields set.
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
  Future<List<CarpoolRide>> insert(
    _is.DatabaseSession session,
    List<CarpoolRide> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<CarpoolRide>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [CarpoolRide] and returns the inserted row.
  ///
  /// The returned [CarpoolRide] will have its `id` field set.
  Future<CarpoolRide> insertRow(
    _is.DatabaseSession session,
    CarpoolRide row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<CarpoolRide>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [CarpoolRide]s in the list and returns the resulting rows.
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
  /// The returned [CarpoolRide]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CarpoolRide>> upsert(
    _is.DatabaseSession session,
    List<CarpoolRide> rows, {
    required _is.ColumnSelections<CarpoolRideTable> conflictColumns,
    _is.ColumnSelections<CarpoolRideTable>? updateColumns,
    _is.WhereExpressionBuilder<CarpoolRideTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<CarpoolRide>(
      rows,
      conflictColumns: conflictColumns(CarpoolRide.t),
      updateColumns: updateColumns?.call(CarpoolRide.t),
      updateWhere: updateWhere?.call(CarpoolRide.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [CarpoolRide] and returns the resulting row.
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
  /// The returned [CarpoolRide] will have its `id` field set.
  Future<CarpoolRide?> upsertRow(
    _is.DatabaseSession session,
    CarpoolRide row, {
    required _is.ColumnSelections<CarpoolRideTable> conflictColumns,
    _is.ColumnSelections<CarpoolRideTable>? updateColumns,
    _is.WhereExpressionBuilder<CarpoolRideTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<CarpoolRide>(
      row,
      conflictColumns: conflictColumns(CarpoolRide.t),
      updateColumns: updateColumns?.call(CarpoolRide.t),
      updateWhere: updateWhere?.call(CarpoolRide.t),
      transaction: transaction,
    );
  }

  /// Updates all [CarpoolRide]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CarpoolRide>> update(
    _is.DatabaseSession session,
    List<CarpoolRide> rows, {
    _is.ColumnSelections<CarpoolRideTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<CarpoolRide>(
      rows,
      columns: columns?.call(CarpoolRide.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [CarpoolRide]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CarpoolRide> updateRow(
    _is.DatabaseSession session,
    CarpoolRide row, {
    _is.ColumnSelections<CarpoolRideTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<CarpoolRide>(
      row,
      columns: columns?.call(CarpoolRide.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CarpoolRide] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CarpoolRide?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<CarpoolRideUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<CarpoolRide>(
      id,
      columnValues: columnValues(CarpoolRide.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CarpoolRide]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<CarpoolRide>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<CarpoolRideUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<CarpoolRideTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<CarpoolRideTable>? orderBy,
    _is.OrderByListBuilder<CarpoolRideTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<CarpoolRide>(
      columnValues: columnValues(CarpoolRide.t.updateTable),
      where: where(CarpoolRide.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CarpoolRide.t),
      orderByList: orderByList?.call(CarpoolRide.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [CarpoolRide]s in the list and returns the deleted rows.
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
  Future<List<CarpoolRide>> delete(
    _is.DatabaseSession session,
    List<CarpoolRide> rows, {
    _is.OrderByBuilder<CarpoolRideTable>? orderBy,
    _is.OrderByListBuilder<CarpoolRideTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<CarpoolRide>(
      rows,
      orderBy: orderBy?.call(CarpoolRide.t),
      orderByList: orderByList?.call(CarpoolRide.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [CarpoolRide].
  Future<CarpoolRide> deleteRow(
    _is.DatabaseSession session,
    CarpoolRide row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CarpoolRide>(
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
  Future<List<CarpoolRide>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CarpoolRideTable> where,
    _is.OrderByBuilder<CarpoolRideTable>? orderBy,
    _is.OrderByListBuilder<CarpoolRideTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<CarpoolRide>(
      where: where(CarpoolRide.t),
      orderBy: orderBy?.call(CarpoolRide.t),
      orderByList: orderByList?.call(CarpoolRide.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<CarpoolRideTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<CarpoolRide>(
      where: where?.call(CarpoolRide.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CarpoolRide] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<CarpoolRideTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CarpoolRide>(
      where: where(CarpoolRide.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
