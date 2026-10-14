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

abstract class HazardReport
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  HazardReport._({
    this.id,
    required this.title,
    required this.description,
    required this.severity,
    required this.location,
    required this.neighborhoodZone,
    required this.reporterEmail,
    required this.isResolved,
    required this.createdAt,
  });

  factory HazardReport({
    int? id,
    required String title,
    required String description,
    required String severity,
    required String location,
    required String neighborhoodZone,
    required String reporterEmail,
    required bool isResolved,
    required DateTime createdAt,
  }) = _HazardReportImpl;

  factory HazardReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return HazardReport(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      severity: jsonSerialization['severity'] as String,
      location: jsonSerialization['location'] as String,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String,
      reporterEmail: jsonSerialization['reporterEmail'] as String,
      isResolved: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isResolved'],
      ),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = HazardReportTable();

  static const db = HazardReportRepository._();

  @override
  int? id;

  String title;

  String description;

  String severity;

  String location;

  String neighborhoodZone;

  String reporterEmail;

  bool isResolved;

  DateTime createdAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [HazardReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  HazardReport copyWith({
    int? id,
    String? title,
    String? description,
    String? severity,
    String? location,
    String? neighborhoodZone,
    String? reporterEmail,
    bool? isResolved,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HazardReport',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'severity': severity,
      'location': location,
      'neighborhoodZone': neighborhoodZone,
      'reporterEmail': reporterEmail,
      'isResolved': isResolved,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HazardReport',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'severity': severity,
      'location': location,
      'neighborhoodZone': neighborhoodZone,
      'reporterEmail': reporterEmail,
      'isResolved': isResolved,
      'createdAt': createdAt.toJson(),
    };
  }

  static HazardReportInclude include() {
    return HazardReportInclude._();
  }

  static HazardReportIncludeList includeList({
    _is.WhereExpressionBuilder<HazardReportTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HazardReportTable>? orderBy,
    _is.OrderByListBuilder<HazardReportTable>? orderByList,
    HazardReportInclude? include,
  }) {
    return HazardReportIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HazardReport.t),
      orderByList: orderByList?.call(HazardReport.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HazardReportImpl extends HazardReport {
  _HazardReportImpl({
    int? id,
    required String title,
    required String description,
    required String severity,
    required String location,
    required String neighborhoodZone,
    required String reporterEmail,
    required bool isResolved,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         severity: severity,
         location: location,
         neighborhoodZone: neighborhoodZone,
         reporterEmail: reporterEmail,
         isResolved: isResolved,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [HazardReport]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  HazardReport copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? severity,
    String? location,
    String? neighborhoodZone,
    String? reporterEmail,
    bool? isResolved,
    DateTime? createdAt,
  }) {
    return HazardReport(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      location: location ?? this.location,
      neighborhoodZone: neighborhoodZone ?? this.neighborhoodZone,
      reporterEmail: reporterEmail ?? this.reporterEmail,
      isResolved: isResolved ?? this.isResolved,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class HazardReportUpdateTable extends _is.UpdateTable<HazardReportTable> {
  HazardReportUpdateTable(super.table);

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<String, String> severity(String value) => _is.ColumnValue(
    table.severity,
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

  _is.ColumnValue<String, String> reporterEmail(String value) =>
      _is.ColumnValue(
        table.reporterEmail,
        value,
      );

  _is.ColumnValue<bool, bool> isResolved(bool value) => _is.ColumnValue(
    table.isResolved,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class HazardReportTable extends _is.Table<int?> {
  HazardReportTable({super.tableRelation})
    : super(tableName: 'helphub_hazard_report') {
    updateTable = HazardReportUpdateTable(this);
    title = _is.ColumnString(
      'title',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    severity = _is.ColumnString(
      'severity',
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
    reporterEmail = _is.ColumnString(
      'reporterEmail',
      this,
    );
    isResolved = _is.ColumnBool(
      'isResolved',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final HazardReportUpdateTable updateTable;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString severity;

  late final _is.ColumnString location;

  late final _is.ColumnString neighborhoodZone;

  late final _is.ColumnString reporterEmail;

  late final _is.ColumnBool isResolved;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    title,
    description,
    severity,
    location,
    neighborhoodZone,
    reporterEmail,
    isResolved,
    createdAt,
  ];
}

class HazardReportInclude extends _is.IncludeObject {
  HazardReportInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => HazardReport.t;
}

class HazardReportIncludeList extends _is.IncludeList {
  HazardReportIncludeList._({
    _is.WhereExpressionBuilder<HazardReportTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(HazardReport.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => HazardReport.t;
}

class HazardReportRepository {
  const HazardReportRepository._();

  /// Returns a list of [HazardReport]s matching the given query parameters.
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
  Future<List<HazardReport>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HazardReportTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HazardReportTable>? orderBy,
    _is.OrderByListBuilder<HazardReportTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<HazardReport>(
      where: where?.call(HazardReport.t),
      orderBy: orderBy?.call(HazardReport.t),
      orderByList: orderByList?.call(HazardReport.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [HazardReport] matching the given query parameters.
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
  Future<HazardReport?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HazardReportTable>? where,
    int? offset,
    _is.OrderByBuilder<HazardReportTable>? orderBy,
    _is.OrderByListBuilder<HazardReportTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<HazardReport>(
      where: where?.call(HazardReport.t),
      orderBy: orderBy?.call(HazardReport.t),
      orderByList: orderByList?.call(HazardReport.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [HazardReport] by its [id] or null if no such row exists.
  Future<HazardReport?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<HazardReport>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [HazardReport]s in the list and returns the inserted rows.
  ///
  /// The returned [HazardReport]s will have their `id` fields set.
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
  Future<List<HazardReport>> insert(
    _is.DatabaseSession session,
    List<HazardReport> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<HazardReport>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [HazardReport] and returns the inserted row.
  ///
  /// The returned [HazardReport] will have its `id` field set.
  Future<HazardReport> insertRow(
    _is.DatabaseSession session,
    HazardReport row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<HazardReport>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [HazardReport]s in the list and returns the resulting rows.
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
  /// The returned [HazardReport]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HazardReport>> upsert(
    _is.DatabaseSession session,
    List<HazardReport> rows, {
    required _is.ColumnSelections<HazardReportTable> conflictColumns,
    _is.ColumnSelections<HazardReportTable>? updateColumns,
    _is.WhereExpressionBuilder<HazardReportTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<HazardReport>(
      rows,
      conflictColumns: conflictColumns(HazardReport.t),
      updateColumns: updateColumns?.call(HazardReport.t),
      updateWhere: updateWhere?.call(HazardReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [HazardReport] and returns the resulting row.
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
  /// The returned [HazardReport] will have its `id` field set.
  Future<HazardReport?> upsertRow(
    _is.DatabaseSession session,
    HazardReport row, {
    required _is.ColumnSelections<HazardReportTable> conflictColumns,
    _is.ColumnSelections<HazardReportTable>? updateColumns,
    _is.WhereExpressionBuilder<HazardReportTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<HazardReport>(
      row,
      conflictColumns: conflictColumns(HazardReport.t),
      updateColumns: updateColumns?.call(HazardReport.t),
      updateWhere: updateWhere?.call(HazardReport.t),
      transaction: transaction,
    );
  }

  /// Updates all [HazardReport]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HazardReport>> update(
    _is.DatabaseSession session,
    List<HazardReport> rows, {
    _is.ColumnSelections<HazardReportTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<HazardReport>(
      rows,
      columns: columns?.call(HazardReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [HazardReport]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<HazardReport> updateRow(
    _is.DatabaseSession session,
    HazardReport row, {
    _is.ColumnSelections<HazardReportTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<HazardReport>(
      row,
      columns: columns?.call(HazardReport.t),
      transaction: transaction,
    );
  }

  /// Updates a single [HazardReport] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<HazardReport?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<HazardReportUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<HazardReport>(
      id,
      columnValues: columnValues(HazardReport.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [HazardReport]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HazardReport>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<HazardReportUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<HazardReportTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HazardReportTable>? orderBy,
    _is.OrderByListBuilder<HazardReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<HazardReport>(
      columnValues: columnValues(HazardReport.t.updateTable),
      where: where(HazardReport.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HazardReport.t),
      orderByList: orderByList?.call(HazardReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [HazardReport]s in the list and returns the deleted rows.
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
  Future<List<HazardReport>> delete(
    _is.DatabaseSession session,
    List<HazardReport> rows, {
    _is.OrderByBuilder<HazardReportTable>? orderBy,
    _is.OrderByListBuilder<HazardReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<HazardReport>(
      rows,
      orderBy: orderBy?.call(HazardReport.t),
      orderByList: orderByList?.call(HazardReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [HazardReport].
  Future<HazardReport> deleteRow(
    _is.DatabaseSession session,
    HazardReport row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<HazardReport>(
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
  Future<List<HazardReport>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HazardReportTable> where,
    _is.OrderByBuilder<HazardReportTable>? orderBy,
    _is.OrderByListBuilder<HazardReportTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<HazardReport>(
      where: where(HazardReport.t),
      orderBy: orderBy?.call(HazardReport.t),
      orderByList: orderByList?.call(HazardReport.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HazardReportTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<HazardReport>(
      where: where?.call(HazardReport.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [HazardReport] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HazardReportTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<HazardReport>(
      where: where(HazardReport.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
